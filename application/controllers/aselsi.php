<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aselsi extends CI_Controller {

    function __construct() {

        parent::__construct();
        $this->load->database();
        $this->load->library('session');
		$this->load->model('email_model');

        /* cache control */
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
    }

    /*     * *default function, redirects to login page if no admin logged in yet** */

    public function index() {
        if ($this->session->userdata('admin_login') != 1)
            redirect(base_url() . 'index.php?login', 'refresh');
        if ($this->session->userdata('admin_login') == 1)
            redirect(base_url() . 'index.php?aselsi/dashboard', 'refresh');
    }

    /*     * *ADMIN DASHBOARD** */

    function dashboard() {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }
        $page_data['page_name'] = 'dashboard';
        $page_data['page_title'] = get_phrase('admin_dashboard');
        $this->load->view('index', $page_data);
    }

    /*     * ***LANGUAGE SETTINGS******** */

    function manage_language($param1 = '', $param2 = '', $param3 = '') {
        if ($this->session->userdata('admin_login') != 1)
            redirect(base_url() . 'index.php?login', 'refresh');

        if ($param1 == 'edit_phrase') {
            $page_data['edit_profile'] = $param2;
        }
        if ($param1 == 'update_phrase') {
            $language = $param2;
            $total_phrase = $this->input->post('total_phrase');
            for ($i = 1; $i < $total_phrase; $i++) {
                $data[$language]	=	$this->input->post('la_frase').$i; /// comentar
                $this->db->where('la_id', $i);
                $this->db->update('crg_language', array($language => $this->input->post('la_frase' . $i))); ///
            }
            redirect(base_url() . 'index.php?aselsi/manage_language/edit_phrase/' . $language, 'refresh');
        }
        if ($param1 == 'do_update') {
            $language = $this->input->post('crg_language');
            $data[$language] = $this->input->post('la_frase');
            $this->db->where('la_id', $param2);
            $this->db->update('crg_language', $data);
            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/manage_language/', 'refresh');
        }
        if ($param1 == 'add_phrase') {
            $data['la_frase'] = $this->input->post('la_frase');
            $this->db->insert('crg_language', $data);
            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/manage_language/', 'refresh');
        }
        if ($param1 == 'add_language') {
            $language = $this->input->post('crg_language');
            $this->load->dbforge();
            $fields = array(
                $language => array(
                    'type' => 'LONGTEXT'
                )
            );
            $this->dbforge->add_column('crg_language', $fields);

            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/manage_language/', 'refresh');
        }
        if ($param1 == 'delete_language') {
            $language = $param2;
            $this->load->dbforge();
            $this->dbforge->drop_column('crg_language', $language);
            $this->session->set_flashdata('message', get_phrase('settings_updated'));

            redirect(base_url() . 'index.php?aselsi/manage_language/', 'refresh');
        }
        $page_data['page_name'] = 'manage_language';
        $page_data['page_title'] = get_phrase('manage_language');
        $page_data['language_phrases'] = $this->db->get('crg_language')->result_array(); //comentar
        $this->load->view('index', $page_data);
    }

    /*     * ***SITE/SYSTEM SETTINGS******** */

    function system_settings($param1 = '', $param2 = '', $param3 = '') {
        if ($this->session->userdata('admin_login') != 1)
            redirect(base_url() . 'index.php?login', 'refresh');

        if ($param1 == 'do_update') {
            $this->crud_model->update_system_settings();
            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/system_settings/', 'refresh');
        }
        if ($param1 == 'upload_logo') {
            move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/logo.png');
            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/system_settings/', 'refresh');
        }
        $page_data['page_name'] = 'system_settings';
        $page_data['page_title'] = get_phrase('system_settings');
        $page_data['settings'] = $this->db->get('crg_settings')->result_array();
        $this->load->view('index', $page_data);
    }

    // SMS settings.
    function sms_settings($param1 = '') {

        if ($this->session->userdata('admin_login') != 1)
            redirect(base_url() . 'index.php?login', 'refresh');

        if ($param1 == 'do_update') {
            $this->crud_model->update_sms_settings();
            $this->session->set_flashdata('message', get_phrase('settings_updated'));
            redirect(base_url() . 'index.php?aselsi/sms_settings/', 'refresh');
        }

        $page_data['page_name'] = 'sms_settings';
        $page_data['page_title'] = get_phrase('sms_settings');
        $this->load->view('index', $page_data);
    }

    /*     * ****MANAGE OWN PROFILE AND CHANGE PASSWORD** */

    function manage_profile($param1 = '', $param2 = '', $param3 = '') {
        if ($this->session->userdata('admin_login') != 1)
            redirect(base_url() . 'index.php?login', 'refresh');

        if ($param1 == 'update_profile_info') {
            $data['us_name'] = $this->input->post('name');
            $data['us_email'] = $this->input->post('email');
            $validation = email_validation_on_edit($data['email'], $this->session->userdata('login_user_id'), 'cdp_usuario');
            if ($validation == 1) {
              $returned_array = null_checking($data);
              $this->db->where('us_id', $this->session->userdata('login_user_id'));
              $this->db->update('cdp_usuario', $returned_array);
              $this->session->set_flashdata('message', get_phrase('profile_info_updated_successfuly'));
              redirect(base_url() . 'index.php?aselsi/manage_profile');
            }
            else{
              $this->session->set_flashdata('error_message', get_phrase('duplicate_email'));
              redirect(base_url() . 'index.php?aselsi/manage_profile');
            }

        }
        if ($param1 == 'change_password') {
            $current_password_input = sha1($this->input->post('password'));
            $new_password = sha1($this->input->post('new_password'));
            $confirm_new_password = sha1($this->input->post('confirm_new_password'));

            $current_password_db = $this->db->get_where('cdp_usuario', array('us_id' =>
                        $this->session->userdata('login_user_id')))->row()->password;

            if ($current_password_db == $current_password_input && $new_password == $confirm_new_password) {
                $this->db->where('us_id', $this->session->userdata('login_user_id'));
                $this->db->update('cdp_usuario', array('password' => $new_password));

                $this->session->set_flashdata('message', get_phrase('password_actualizacion_exitosa'));
                redirect(base_url() . 'index.php?aselsi/manage_profile');
            } else {
                $this->session->set_flashdata('message', get_phrase('password_actualizacion_fallida'));
                redirect(base_url() . 'index.php?aselsi/manage_profile');
            }
        }
        $page_data['page_name'] = 'manage_profile';
        $page_data['page_title'] = get_phrase('Edit_profile');
        $page_data['edit_data'] = $this->db->get_where('cdp_usuario', array('us_id' => $this->session->userdata('login_user_id')))->result_array();
        $this->load->view('index', $page_data);
    }

    // composicion
    function composicion($task = "", $composicion_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_composicion_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/composicion');
        }

        if ($task == "update") {
            $this->crud_model->update_composicion_info($composicion_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/composicion');
        }

        if ($task == "delete") {
            $this->crud_model->delete_composicion_info($composicion_id);
            redirect(base_url() . 'index.php?aselsi/composicion');
        }

        $data['composicion_info'] = $this->crud_model->select_composicion_info();
        $data['page_name'] = 'composicion/manage_composicion';
        $data['page_title'] = get_phrase('composicion');
        $this->load->view('index', $data);
    }

    // entradas
    function entradas($task = "", $entradas_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_entradas_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/entradas');
        }

        if ($task == "update") {
            $this->crud_model->update_entradas_info($entradas_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/entradas');
        }

        if ($task == "delete") {
            $this->crud_model->delete_entradas_info($entradas_id);
            redirect(base_url() . 'index.php?aselsi/entradas');
        }

        $data['entradas_info'] = $this->crud_model->select_entradas_info();
        $data['page_name'] = 'entradas/manage_entradas';
        $data['page_title'] = get_phrase('entradas');
        $this->load->view('index', $data);
    }

    // programa
    function programa($task = "", $programa_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_programa_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/programa');
        }

        if ($task == "update") {
            $this->crud_model->update_programa_info($programa_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/programa');
        }

        if ($task == "delete") {
            $this->crud_model->delete_programa_info($programa_id);
            redirect(base_url() . 'index.php?aselsi/programa');
        }

        $data['programa_info'] = $this->crud_model->select_programa_info();
        $data['page_name'] = 'programa/manage_programa';
        $data['page_title'] = 'programa';
        $this->load->view('index', $data);
    }

     // proveedor
    function proveedor($task = "", $proveedor_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_proveedor_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/proveedor');
        }

        if ($task == "update") {
            $this->crud_model->update_proveedor_info($proveedor_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/proveedor');
        }

        if ($task == "delete") {
            $this->crud_model->delete_proveedor_info($proveedor_id);
            redirect(base_url() . 'index.php?aselsi/proveedor');
        }

        $data['proveedor_info'] = $this->crud_model->select_proveedor_info();
        $data['page_name'] = 'proveedor/manage_proveedor';
        $data['page_title'] = 'proveedor';
        $this->load->view('index', $data);
    }

    // medicamento
    function medicamento($task = "", $medicamento_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_medicamento_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/medicamento');
        }

        if ($task == "update") {
            $this->crud_model->update_medicamento_info($medicamento_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/medicamento');
        }

        if ($task == "delete") {
            $this->crud_model->delete_medicamento_info($medicamento_id);
            redirect(base_url() . 'index.php?aselsi/medicamento');
        }

        $data['medicamento_info'] = $this->crud_model->select_medicamento_info();
        $data['page_name'] = 'medicamento/manage_medicamento';
        $data['page_title'] = 'medicamento';
        $this->load->view('index', $data);
    }

    // APROBACION SOLICITUD
    function aprobacion_sol($task = "", $aprobacion_sol_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_aprobacion_sol_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/aprobacion_sol');
        }

        if ($task == "update") {
            $this->crud_model->update_aprobacion_sol_info($aprobacion_sol_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/aprobacion_sol');
        }

        if ($task == "delete") {
            $this->crud_model->delete_aprobacion_sol_info($aprobacion_sol_id);
            redirect(base_url() . 'index.php?aselsi/aprobacion_sol');
        }

        $data['aprobacion_sol_info'] = $this->crud_model->select_aprobacion_sol_info();
        $data['page_name'] = 'aprobacion_sol/manage_aprobacion_sol';
        $data['page_title'] = get_phrase('approval_request');
        $this->load->view('index', $data);
    }

    // donante
    function donante($task = "", $donante_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_donante_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/donante');
        }

        if ($task == "update") {
            $this->crud_model->update_donante_info($donante_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/donante');
        }

        if ($task == "delete") {
            $this->crud_model->delete_donante_info($donante_id);
            redirect(base_url() . 'index.php?aselsi/donante');
        }

        $data['donante_info'] = $this->crud_model->select_donante_info();
        $data['page_name'] = 'donante/manage_donante';
        $data['page_title'] = get_phrase('donante');
        $this->load->view('index', $data);
    }

    // grupo
    function grupo($task = "", $grupo_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_grupo_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/grupo');
        }

        if ($task == "update") {
            $this->crud_model->update_grupo_info($grupo_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/grupo');
        }

        if ($task == "delete") {
            $this->crud_model->delete_grupo_info($grupo_id);
            redirect(base_url() . 'index.php?aselsi/grupo');
        }

        $data['grupo_info'] = $this->crud_model->select_grupo_info();
        $data['page_name'] = 'grupo/manage_grupo';
        $data['page_title'] = get_phrase('grupo');
        $this->load->view('index', $data);
    }

        // salida
    function salida($task = "", $salida_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_salida_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/salida');
        }

        if ($task == "update") {
            $this->crud_model->update_salida_info($salida_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/salida');
        }

        if ($task == "delete") {
            $this->crud_model->delete_salida_info($salida_id);
            redirect(base_url() . 'index.php?aselsi/salida');
        }

        $data['salida_info'] = $this->crud_model->select_salida_info();
        $data['page_name'] = 'salida/manage_salida';
        $data['page_title'] = get_phrase('salida');
        $this->load->view('index', $data);
    }
       // reporte
    function reporte_grafico() {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

       // $data['reporte_info'] = $this->crud_model->select_reporte_info();
        $data['page_name'] = 'reportes_grafico/reporte_grafico';
        $data['page_title'] = get_phrase('reporte');
        $this->load->view('index', $data);
    }


    // PRODUCTO
    function producto($task = "", $producto_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_producto_info();
            $this->session->set_flashdata('message', get_phrase('creacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/producto');
        }

        if ($task == "update") {
            $this->crud_model->update_producto_info($producto_id);
            $this->session->set_flashdata('message', get_phrase('actualizacion_exitosa'));
            redirect(base_url() . 'index.php?aselsi/producto');
        }

        if ($task == "delete") {
            $this->crud_model->delete_producto_info($producto_id);
            redirect(base_url() . 'index.php?aselsi/producto');
        }

        $data['producto_info'] = $this->crud_model->select_producto_info();
        $data['page_name'] = 'producto/manage_producto';
        $data['page_title'] = get_phrase('product');
        $this->load->view('index', $data);
    }



    function bed_allotment($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['bed_allotment_info'] = $this->crud_model->select_bed_allotment_info();
        $data['page_name'] = 'show_bed_allotment';
        $data['page_title'] = get_phrase('bed_allotment');
        $this->load->view('index', $data);
    }

    function blood_bank($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['blood_bank_info'] = $this->crud_model->select_blood_bank_info();
        $data['page_name'] = 'show_blood_bank';
        $data['page_title'] = get_phrase('blood_bank');
        $this->load->view('index', $data);
    }

    function blood_donor($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['blood_donor_info'] = $this->crud_model->select_blood_donor_info();
        $data['page_name'] = 'show_blood_donor';
        $data['page_title'] = get_phrase('blood_donor');
        $this->load->view('index', $data);
    }

    function medicine($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['medicine_info'] = $this->crud_model->select_medicine_info();
        $data['page_name'] = 'show_medicine';
        $data['page_title'] = get_phrase('medicine');
        $this->load->view('index', $data);
    }

    function operation_report($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['page_name'] = 'show_operation_report';
        $data['page_title'] = get_phrase('operation_report');
        $this->load->view('index', $data);
    }

    function birth_report($task = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        $data['page_name'] = 'show_birth_report';
        $data['page_title'] = get_phrase('birth_report');
        $this->load->view('index', $data);
    }

    function notice($task = "", $notice_id = "") {
        if ($this->session->userdata('admin_login') != 1) {
            $this->session->set_userdata('last_page', current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_notice_info();
            $this->session->set_flashdata('message', get_phrase('notice_info_saved_successfuly'));
            redirect(base_url() . 'index.php?aselsi/notice');
        }

        if ($task == "update") {
            $this->crud_model->update_notice_info($notice_id);
            $this->session->set_flashdata('message', get_phrase('notice_info_updated_successfuly'));
            redirect(base_url() . 'index.php?aselsi/notice');
        }

        if ($task == "delete") {
            $this->crud_model->delete_notice_info($notice_id);
            redirect(base_url() . 'index.php?aselsi/notice');
        }

        $data['notice_info'] = $this->crud_model->select_notice_info();
        $data['page_name'] = 'manage_notice';
        $data['page_title'] = get_phrase('noticeboard');
        $this->load->view('index', $data);





    //------------------------------------------------------------reportes en pdf
 // Se carga el modelo alumno
    $this->load->model('alumno_modelo');
    // Se carga la libreria fpdf
    $this->load->library('pdf');
 
    // Se obtienen los alumnos de la base de datos
    $alumnos = $this->alumno_modelo->obtenerListaAlumnos();
 
    // Creacion del PDF
 
    /*
     * Se crea un objeto de la clase Pdf, recuerda que la clase Pdf
     * heredó todos las variables y métodos de fpdf
     */
    $this->pdf = new Pdf();
    // Agregamos una página
    $this->pdf->AddPage();
    // Define el alias para el número de página que se imprimirá en el pie
    $this->pdf->AliasNbPages();
 
    /* Se define el titulo, márgenes izquierdo, derecho y
     * el color de relleno predeterminado
     */
    $this->pdf->SetTitle("Lista de alumnos");
    $this->pdf->SetLeftMargin(15);
    $this->pdf->SetRightMargin(15);
    $this->pdf->SetFillColor(200,200,200);
 
    // Se define el formato de fuente: Arial, negritas, tamaño 9
    $this->pdf->SetFont('Arial', 'B', 9);
    /*
     * TITULOS DE COLUMNAS
     *
     * $this->pdf->Cell(Ancho, Alto,texto,borde,posición,alineación,relleno);
     */
 
    $this->pdf->Cell(15,7,'NUM','TBL',0,'C','1');
    $this->pdf->Cell(25,7,'PATERNO','TB',0,'L','1');
    $this->pdf->Cell(25,7,'MATERNO','TB',0,'L','1');
    $this->pdf->Cell(25,7,'NOMBRE','TB',0,'L','1');
    $this->pdf->Cell(40,7,'FECHA DE NACIMIENTO','TB',0,'C','1');
    $this->pdf->Cell(25,7,'GRADO','TB',0,'L','1');
    $this->pdf->Cell(25,7,'GRUPO','TBR',0,'C','1');
    $this->pdf->Ln(7);
    // La variable $x se utiliza para mostrar un número consecutivo
    $x = 1;
    foreach ($alumnos as $alumno) {
      // se imprime el numero actual y despues se incrementa el valor de $x en uno
      $this->pdf->Cell(15,5,$x++,'BL',0,'C',0);
      // Se imprimen los datos de cada alumno
      $this->pdf->Cell(25,5,$alumno->paterno,'B',0,'L',0);
      $this->pdf->Cell(25,5,$alumno->materno,'B',0,'L',0);
      $this->pdf->Cell(25,5,$alumno->nombre,'B',0,'L',0);
      $this->pdf->Cell(40,5,$alumno->fec_nac,'B',0,'C',0);
      $this->pdf->Cell(25,5,$alumno->grado,'B',0,'L',0);
      $this->pdf->Cell(25,5,$alumno->grupo,'BR',0,'C',0);
      //Se agrega un salto de linea
      $this->pdf->Ln(5);
    }
    /*
     * Se manda el pdf al navegador
     *
     * $this->pdf->Output(nombredelarchivo, destino);
     *
     * I = Muestra el pdf en el navegador
     * D = Envia el pdf para descarga
     *
     */
    $this->pdf->Output("Lista de alumnos.pdf", 'I');
        
    }






}
