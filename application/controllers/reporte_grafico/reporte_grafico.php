<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Crud_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function clear_cache() {
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
    }

    function get_type_name_by_id($type, $type_id = '', $field = 'name') {
        $this->db->where($type . '_id', $type_id);
        $query = $this->db->get($type);
        $result = $query->result_array();
        foreach ($result as $row)
            return $row[$field];
        //return	$this->db->get_where($type,array($type.'_id'=>$type_id))->row()->$field;
    }

    //////system settings//////
    function update_system_settings() {
        $data['se_descripcion'] = $this->input->post('system_name');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'system_name');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('system_title');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'system_title');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('address');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'address');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('phone');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'phone');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('paypal_email');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'paypal_email');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('currency');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'currency');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('system_email');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'system_email');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('buyer');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'buyer');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('system_name');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'system_name');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('purchase_code');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'purchase_code');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('language');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'language');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('text_align');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'text_align');
        $this->db->update('crg_settings', $returned_array);
    }

    // SMS crg_settings.
    function update_sms_settings() {

        $data['se_descripcion'] = $this->input->post('clickatell_user');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'clickatell_user');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('clickatell_password');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'clickatell_password');
        $this->db->update('crg_settings', $returned_array);

        $data['se_descripcion'] = $this->input->post('clickatell_api_id');
        $returned_array = null_checking($data);
        $this->db->where('se_type', 'clickatell_api_id');
        $this->db->update('crg_settings', $returned_array);
    }

    ////////IMAGE URL//////////
    function get_image_url($type = '', $id = '') {
        if (file_exists('uploads/' . $type . '_image/' . $id . '.jpg'))
            $image_url = base_url() . 'uploads/' . $type . '_image/' . $id . '.jpg';
        else
            $image_url = base_url() . 'uploads/user.jpg';

        return $image_url;
    }
    //composicion
    function save_composicion_info()
    {
        $data['com_nombre'] 		= $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_composicion',$returned_array);
    }

    function select_composicion_info()
    {
        return $this->db->get('cdp_composicion')->result_array();
    }

    function update_composicion_info($composicion_id)
    {
        $data['com_nombre'] 		= $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->where('com_id',$composicion_id);
        $this->db->update('cdp_composicion',$returned_array);
    }

    function delete_composicion_info($composicion_id)
    {
        $this->db->where('com_id',$composicion_id);
        $this->db->delete('com_composicion');
    }

    /// programas--------------------------------------------------------------------------------
    function save_programa_info()
    {
        $data['progra_nombre']      = $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_programa',$returned_array);
    }

    function select_programa_info()
    {
        return $this->db->get('cdp_programa')->result_array();
    }

    function update_programa_info($programa_id)
    {
        $data['progra_nombre']      = $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->where('progra_id',$programa_id);
        $this->db->update('cdp_programa',$returned_array);
    }

    function delete_programa_info($programa_id)
    {
        $this->db->where('progra_id',$programa_id);
        $this->db->delete('cdp_programa');
    }
    /// proveedors--------------------------------------------------------------------------------
    function save_proveedor_info()
    {
        $data['pro_nombre']      = $this->input->post('nombre');
        $data['pro_direccion']      = $this->input->post('direccion');
        $data['pro_telefono']      = $this->input->post('telefono');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_proveedor',$returned_array);
    }

    function select_proveedor_info()
    {
        return $this->db->get('cdp_proveedor')->result_array();
    }

    function update_proveedor_info($proveedor_id)
    {
        $data['pro_nombre']      = $this->input->post('nombre');
        $data['pro_direccion']      = $this->input->post('direccion');
        $data['pro_telefono']      = $this->input->post('telefono');
        $returned_array = null_checking($data);
        $this->db->where('pro_codigo',$proveedor_id);
        $this->db->update('cdp_proveedor',$returned_array);
    }

    function delete_proveedor_info($proveedor_id)
    {
        $this->db->where('pro_codigo',$proveedor_id);
        $this->db->delete('cdp_proveedor');
    }

    /// entradas--------------------------------------------------------------------------------
    function save_entradas_info()
    {
        $data['en_fecha_add']      = $this->input->post('fecha_add');
        $data['en_fecha_expiracion']      = $this->input->post('fecha_ven');
        $data['en_num_factura']      = $this->input->post('factura');
        $data['en_costo']      = $this->input->post('costo');
        $data['en_cantidad']      = $this->input->post('cantidad');
        $data['en_bonificacion']      = $this->input->post('bonificacion');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_entradas',$returned_array);
    }

    function select_entradas_info()
    {
        return $this->db->get('cdp_entradas')->result_array();
    }

    function update_entradas_info($entradas_id)
    {
        $data['en_fecha_add']      = $this->input->post('fecha_add');
        $data['en_fecha_expiracion']      = $this->input->post('fecha_ven');
        $data['en_num_factura']      = $this->input->post('factura');
        $data['en_costo']      = $this->input->post('costo');
        $data['en_cantidad']      = $this->input->post('cantidad');
        $data['en_bonificacion']      = $this->input->post('bonificacion');
        $returned_array = null_checking($data);
        $this->db->where('en_id',$entradas_id);
        $this->db->update('cdp_entradas',$returned_array);
    }

    function delete_entradas_info($entradas_id)
    {
        $this->db->where('en_id',$entradas_id);
        $this->db->delete('cdp_entradas');
    }



    /// medicamento
    function save_medicamento_info()
    {
        $data['me_codigo']      = $this->input->post('codigo');
        $data['me_nombre'] = $this->input->post('nombre');
        $data['me_com_id'] = $this->input->post('composicion');
        $data['me_gru_id'] = $this->input->post('grupo');
        $data['me_pro_id'] = $this->input->post('proveedor');
        $data['me_en_id'] = $this->input->post('entradas');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_medicamento',$returned_array);

    }

    function select_medicamento_info()
    {
        $this->db->select('me_codigo,me.me_nombre,en.en_costo,comp.com_nombre,gru.gru_nombre,pro.pro_nombre,en.en_cantidad,en.en_fecha_expiracion');
        $this->db->from('cdp_medicamento as me');
        $this->db->join('cdp_composicion as comp','me.me_com_id = comp.com_id');
        $this->db->join('cdp_grupo as gru','gru.gru_id = me.me_gru_id');
        $this->db->join('cdp_proveedor as pro','pro.pro_codigo = me.me_pro_id');
        $this->db->join('cdp_entradas as en','en.en_id = me.me_en_id');
        $query = $this->db->get();
        return $query->result_array();
       // return $this->db->get('cdp_medicamento')->result_array();
    }

    function update_medicamento_info($medicamento_id)
    {
        $data['me_codigo']      = $this->input->post('codigo');
        $data['me_nombre'] = $this->input->post('nombre');
        $data['me_com_id'] = $this->input->post('composicion');
        $data['me_gru_id'] = $this->input->post('grupo');
        $data['me_pro_id'] = $this->input->post('proveedor');
        $data['me_en_id'] = $this->input->post('entradas');
        $returned_array = null_checking($data);
        $this->db->where('me_id',$medicamento_id);
        $this->db->update('cdp_medicamento',$returned_array);
    }

    function delete_medicamento_info($medicamento_id)
    {
        $this->db->where('me_id',$medicamento_id);
        $this->db->delete('cdp_medicamento');
    }

 /// Salidas
    function save_salida_info()
    {
        $data['sal_me_id']      = $this->input->post('medicamento');
        $data['sal_progra_id'] = $this->input->post('programa');
        $data['sal_cantidad'] = $this->input->post('cantidad');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_salida',$returned_array);
    }

    function select_salida_info()
    {
        $this->db->select('me.me_nombre,pro.progra_nombre,en.en_costo,sal.sal_cantidad,(sal.sal_cantidad * en.en_costo) as subtotal');
        $this->db->from('cdp_salida sal');
        $this->db->join('cdp_medicamento me','sal.sal_me_id = me.me_id');
        $this->db->join('cdp_entradas en','me.me_en_id = en.en_id');
        $this->db->join('cdp_programa pro','pro.progra_id = sal.sal_progra_id');
        $query = $this->db->get();
        return $query->result_array();
       // return $this->db->get('cdp_salida')->result_array();
    }

    function update_salida_info($salida_id)
    {
        $data['sal_me_id']      = $this->input->post('codigo');
        $data['sal_progra_id'] = $this->input->post('nombre');
        $data['sal_cantidad'] = $this->input->post('cantidad');
        $returned_array = null_checking($data);
        $this->db->where('me_id',$salida_id);
        $this->db->update('cdp_salida',$returned_array);
    }

    function delete_salida_info($salida_id)
    {
        $this->db->where('me_id',$salida_id);
        $this->db->delete('cdp_salida');
    }
   
    /// donante
    function save_donante_info()
    {
        $data['don_nombre'] = $this->input->post('nombre');
        $data['don_direccion'] = $this->input->post('direccion');
        $data['don_telefono'] = $this->input->post('telefono');
        $data['don_fecha'] = $this->input->post('fecha');
        $data['don_cantidad'] = $this->input->post('cantidad');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_donante',$returned_array);
    }

    function select_donante_info()
    {
        return $this->db->get('cdp_donante')->result_array();
    }

    function update_donante_info($donante_id)
    {
        $data['don_nombre'] = $this->input->post('nombre');
        $data['don_direccion'] = $this->input->post('direccion');
        $data['don_telefono'] = $this->input->post('telefono');
        $data['don_fecha'] = $this->input->post('fecha');
        $data['don_cantidad'] = $this->input->post('cantidad');
        $returned_array = null_checking($data);
        $this->db->where('don_id',$donante_id);
        $this->db->update('cdp_donante',$returned_array);
    }

    function delete_donante_info($donante_id)
    {
        $this->db->where('don_id',$donante_id);
        $this->db->delete('cdp_donante');
    }

    /// grupos
    function save_grupo_info()
    {
        $data['gru_nombre'] = $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->insert('cdp_grupo',$returned_array);
    }

    function select_grupo_info()
    {
        return $this->db->get('cdp_grupo')->result_array();
    }

    function update_grupo_info($grupo_id)
    {
        $data['gru_nombre'] = $this->input->post('nombre');
        $returned_array = null_checking($data);
        $this->db->where('gru_id',$grupo_id);
        $this->db->update('cdp_grupo',$returned_array);
    }

    function delete_grupo_info($grupo_id)
    {
        $this->db->where('gru_id',$grupo_id);
        $this->db->delete('cdp_grupo');
    }


/// reportes

    function select_reporte_info()
    {
        return $this->db->get('cdp_grupo')->result_array();
    }


//---------------------------------ejemplo de fpdf-----------
      function obtener_grupo()
    {
      $this->load->database();
        $alumnos = $this->db->get('cdp_grupo');
        return $alumnos->result();
    }

    /// PRODUCTO
    function save_producto_info()
    {
        $data['pro_nombre'] = $this->input->post('pnombre');
        $data['pro_monto_maximo'] = $this->input->post('pmontom');
        $data['pro_plazo_maximo'] = $this->input->post('pplazom');
        $data['pro_tasa'] = $this->input->post('ptasa');
        $returned_array = null_checking($data);
        $this->db->insert('crg_producto',$returned_array);
    }

    function select_producto_info()
    {
        return $this->db->get('crg_producto')->result_array();
    }

    function update_producto_info($producto_id)
    {
        $data['pro_id']      = $this->input->post('pidpro');
        $data['pro_nombre'] = $this->input->post('pnombre');
        $data['pro_monto_maximo'] = $this->input->post('pmontom');
        $data['pro_plazo_maximo'] = $this->input->post('pplazom');
        $data['pro_tasa'] = $this->input->post('ptasa');
        $returned_array = null_checking($data);
        $this->db->where('pro_id',$producto_id);
        $this->db->update('crg_producto',$returned_array);
    }

    function delete_producto_info($producto_id)
    {
        $this->db->where('pro_id',$producto_id);
        $this->db->delete('crg_producto');
    }

    ////////private message//////
    function send_new_private_message() {
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));

        $reciever   = $this->input->post('reciever');
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        //check if the thread between those 2 users exists, if not create new thread
        $num1 = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->num_rows();
        $num2 = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->num_rows();
        if ($num1 == 0 && $num2 == 0) {
            $message_thread_code                        = substr(md5(rand(100000000, 20000000000)), 0, 15);
            $data_message_thread['message_thread_code'] = $message_thread_code;
            $data_message_thread['sender']              = $sender;
            $data_message_thread['reciever']            = $reciever;
            $this->db->insert('message_thread', $data_message_thread);
        }
        if ($num1 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->row()->message_thread_code;
        if ($num2 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->row()->message_thread_code;


        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);

        return $message_thread_code;
    }

    function send_reply_message($message_thread_code) {
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);
    }

    function mark_thread_messages_read($message_thread_code) {
        // mark read only the oponnent messages of this thread, not currently logged in user's sent messages
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $this->db->where('sender !=', $current_user);
        $this->db->where('message_thread_code', $message_thread_code);
        $this->db->update('message', array('read_status' => 1));
    }

    function count_unread_message_of_thread($message_thread_code) {
        $unread_message_counter = 0;
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $messages = $this->db->get_where('message', array('message_thread_code' => $message_thread_code))->result_array();
        foreach ($messages as $row) {
            if ($row['sender'] != $current_user && $row['read_status'] == '0')
                $unread_message_counter++;
        }
        return $unread_message_counter;
    }
    
}