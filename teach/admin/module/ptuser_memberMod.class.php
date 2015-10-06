<?php
//用户管理
class ptuser_memberMod extends commonMod {

	public function __construct()
    {
        parent::__construct();
    }
    //排序
    public function common_list_where()
    {
        //排序
		$where='type=1';
        $sequence=intval($_GET['sequence']);
		print_r($sequence);
		if($sequence==0){$sequence=1;}
        switch ($sequence) {
            case '1':
                $order='regtime DESC';
                $where_url='1';
                break;
            case '2':
                $order='regtime ASC';
                $where_url='2';
                break;
            case '3':
                $order='point DESC';
                $where_url='3';
                break;
            case '4':
                $order='point ASC';
                $where_url='4';
                break;
            case '5':
                $order='logintime DESC';
                $where_url='5';
                break;
            case '6':
                $order='logintime ASC';
                $where_url='6';
                break;
            case '7':
                $order='loginnum DESC';
                $where_url='7';
                break;
            case '8':
                $order='loginnum ASC';
                $where_url='8';
                break;
        }
        if(!empty($order)){
			$order=$order;
			$where_url='-sequence-'.$where_url;
        }

        //状态
        $status=intval($_GET['status']);
        switch ($status) {
            case '1':
                $where=$where.' AND status=1';
                $where_url='1';
                break;
            case '2':
                $where=$where.' AND status=0';
                $where_url='2';
                break;
        }
        if(!empty($status)){
			$where_url='-status-'.$where_url;
        }

        //搜索
        $search=in(urldecode($_GET['search']));
        if(!is_utf8($search)){
            $search=auto_charset($search);
        }
        if(!empty($search)){
        $where=' AND A.title like "%' . $search . '%"';
        $where_url='-search-'.urlencode($search);
        }

        //推荐位
        $position=intval($_GET['position']);
        if(!empty($position)){
            $where=' AND D.pid='.$position;
            $where_url='-position-'.$position;
        }
        return array(
            'order'=>$order,
            'where'=>$where,
            'url'=>$where_url,
            'sequence'=>$sequence,
            );

    }
    public function common_list()
    {
        $position_list=model('position')->position_list();
        $category_list=model('category')->category_list();
        $model_info=module('content_category')->get_model();
        $data['position_list']=$position_list;
        $data['category_list']=$category_list;
        $data['model_info']=$model_info;
        //权限部分
        if(model('user_group')->model_power('content','past')){
            $data['past_power']=true;
        }
        if(model('user_group')->model_power('content','cancel')){
            $data['cancel_power']=true;
        }
        if(model('user_group')->model_power('content','del')){
            $data['del_power']=true;
        }
        if(model('user_group')->model_power('content','edit')){
            $data['edit_power']=true;
        }
        return $data;
    }

	public function index() {
        //$this->list=model('ptuser_member')->admin_list();  // 不分页列数据  add by jameskid 2015.10.6
		// print_r($this->list);die; 打印列表数据
    	//$id=intval($_GET['id']);

        //$this->alert_str($id,'int');
        //获取公共信息条件
        $condition=$this->common_list_where();
        $this->view()->assign($this->common_list());
        //栏目信息
        //$this->class_info = model('ptuser_member')->info($id);
        //分页信息
        $listRows=20;
        $url = __URL__ . '/index/page-{page}'.$where['url'].'.html?sequence='.$condition['sequence']; //分页基准网址
        $limit=$this->pagelimit($url,$listRows);
        //内容列表
        //$this->list=model('ptuser_member')->content_list($id,$limit,$where['where'],$where['order']);
		$condition['limit']=$limit;
        $this->list=model('ptuser_member')->admin_list($condition);
        $count=model('ptuser_member')->count($condition);
        $this->page=$this->page($url, $count, $listRows);
		$this->show();
	}

	//用户添加
	public function add() {
        $this->user_group=model('user_group')->admin_list();
		$this->action_name='添加';
        $this->action='add';
        $this->show('ptuser_member/info');
	}

	public function add_save() {
        if($_POST['password']<>$_POST['password2']){
            $this->msg('两次密码输入不同！',0);
            return;
        }
        $_POST['regtime']=time();
        $_POST['logintime']=time();
        $_POST['type']=1;
        if(model('ptuser_member')->count($_POST['ptuser_member'])){
            $this->msg('帐号不能重复！',0);
            return;
        }
        $_POST['password']=md5($_POST['password']);
        //录入模型处理
        model('ptuser_member')->add($_POST);
        $this->msg('用户添加成功！',1);
	}

    //用户修改
    public function edit() {
        $id=$_GET['id'];
        $this->alert_str($id,'int');
        $this->user_group=model('user_group')->admin_list();
        $this->info=model('ptuser_member')->info($id);
        $this->info_group=model('user_group')->info($this->info['gid']);
        $user=model('user')->current_user();
        if($this->info_group['grade']<$user['grade']){
            $this->msg('越权操作！',0);
        }
        $this->action_name='编辑';
        $this->action='edit';
        $this->show('ptuser_member/info');
    }

    //修改资料
    public function edit_info() {
        $id=$_GET['id'];
        $this->alert_str($id,'int');
        $this->info=model('ptuser_member')->info($id);
        $this->info_group=model('user_group')->info($this->info['gid']);
        $user=model('user')->current_user();
        if($this->info_group['grade']<$user['grade']){
            $this->msg('越权操作！',0);
        }
        $this->action_name='编辑';
        $this->action='edit';
        $this->show('ptuser_member/edit_info');
    }

    //用户修改
    public function edit_save() {

        if (!empty($_POST['password']))
        {
            if (empty($_POST['password2']))
            {
               $this->msg('未填写确认密码！',0);
               return;
            }
            if($_POST['password']<>$_POST['password2']){
                $this->msg('两次密码输入不同！',0);
                return;
            }
            if(model('ptuser_member')->count($_POST['ptuser_member'],$_POST['id'])){
                $this->msg('帐号不能重复！',0);
                return;
            }
            $_POST['password']=md5($_POST['password']);
        }else{
            unset($_POST['password']);
        }
        
        //录入模型处理
        model('ptuser_member')->edit($_POST);
        $this->msg('用户修改成功! ',1);
    }

    //用户删除
    public function del() {
        $id=intval($_POST['id']);
        $this->alert_str($id,'int',true);
        $info=model('ptuser_member')->info($id);
		/*
        if($info['keep']==1){
            $this->msg('内置管理员无法删除！',0);
        }
		 */
        $info_group=model('user_group')->info($info['gid']);
        $user=model('user')->current_user();
        if($info_group['grade']<$user['grade']){
            $this->msg('越权操作！',0);
        }
        //录入模型处理
        model('ptuser_member')->del($id);
        $this->msg('用户删除成功！',1);
    }
    //用户假式删除
    public function ndel() {
        $id=intval($_POST['id']);
        $this->alert_str($id,'int',true);
        $info=model('ptuser_member')->info($id);
		/*
        if($info['keep']==1){
            $this->msg('内置管理员无法删除！',0);
        }
		 */
        $info_group=model('user_group')->info($info['gid']);
        $user=model('user')->current_user();
        if($info_group['grade']<$user['grade']){
            $this->msg('越权操作！',0);
        }
        //录入模型处理
        model('ptuser_member')->ndel($id);
        $this->msg('用户删除成功！',1);
    }

}
