<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('crud_model');
		$this->load->model('email_model');
        $this->load->database();
        $this->load->library('session');
        /* cache control */
        $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
    }
    public function index() {
        if ($this->session->userdata('admin_login') == 1)
            redirect(base_url() . 'index.php?aselsi/dashboard', 'refresh');
        $this->load->view('login');
    }

    //Ajax login function 
    function ajax_login() {
        $response = array();

        //Recieving post input of email, password from ajax request
        $email = $_POST["email"];
        $password = $_POST["password"];
        $response['submitted_data'] = $_POST;

        //Validating login
        $login_status = $this->validate_login($email, $password);
        $response['login_status'] = $login_status;
        if ($login_status == 'success') {
            $response['redirect_url'] = $this->session->userdata('last_page');
        }

        //Replying ajax request with validation response
        echo json_encode($response);
    }

    //Validating login from ajax request
    function validate_login($email = '', $password = '') {
        $credential = array('us_email' => $email, 'us_password' => sha1($password));
        
        // Check login cdp_usuario
        $query = $this->db->get_where('cdp_usuario', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('admin_login', '1');
            $this->session->set_userdata('login_user_id', $row->us_id);
            $this->session->set_userdata('name', $row->us_name);
            $this->session->set_userdata('login_type', 'Aselsi');
            return 'success';
        }
       
        return 'invalid';
    }

    /*     * *DEFAULT NOR FOUND PAGE**** */

    function four_zero_four() {
        $this->load->view('four_zero_four');
    }

    /*     * *RESET AND SEND PASSWORD TO REQUESTED EMAIL*** */
	
	function forgot_password() {
		$this->load->view('forgot_password');
	}

    function reset_password() {
        $email = $this->input->post('email');
		$reset_account_type = '';
		$new_password = substr( md5( rand(100000000,20000000000) ) , 0,7);
		// check credencia cdp_usuario
		$query = $this->db->get_where('cdp_usuario' , array('us_email' => $email));
        if ($query->num_rows() > 0) 
        {
            $reset_account_type     =   'admin';
            $this->db->where('us_email' , $email);
            $this->db->update('cdp_usuario' , array('us_password' => sha1($new_password)));
        }
		
		$result = $this->email_model->password_reset_email($reset_account_type, $email, $new_password);
		if ($result == true) {
			$this->session->set_flashdata('password_reset', 'Please check your email for the new password');
		} else {
			$this->session->set_flashdata('password_reset_error', 'Could not find the email that you have entered');	
		}
		redirect(base_url() . 'index.php?login/forgot_password', 'refresh');
    }

    /*     * *****LOGOUT FUNCTION ****** */

    function logout() {
        $this->session->sess_destroy();
        $this->session->set_flashdata('logout_notification', 'logged_out');
        redirect(base_url(), 'refresh');
    }

}
?>