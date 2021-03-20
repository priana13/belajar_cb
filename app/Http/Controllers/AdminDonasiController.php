<?php namespace App\Http\Controllers;

	use Session;
	use Illuminate\Http\Request;
	use DB;
	use CRUDBooster;

	class AdminDonasiController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = false;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = true;
			$this->table = "donasi";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Id","name"=>"id"];
			$this->col[] = ["label"=>"Tanggal","name"=>"created_at"];
			$this->col[] = ["label"=>"Campaigns","name"=>"campaigns_id","join"=>"campaigns,judul"];
			$this->col[] = ["label"=>"Donatur","name"=>"leads_id","join"=>"leads,nama"];
			$this->col[] = ["label"=>"Rekening","name"=>"rekening_id","join"=>"rekening,bank"];
			$this->col[] = ["label"=>"Nominal","name"=>"nominal"];
			$this->col[] = ["label"=>"Status","name"=>"status"];
			// $this->col[] = ["label"=>"ID Mutasi","name"=>"mutasi_bank_id","join"=>"mutasi_bank,id"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Campaigns','name'=>'campaigns_id','type'=>'select2','validation'=>'required|min:1|max:255','width'=>'col-sm-10','datatable'=>'campaigns,judul'];
			$this->form[] = ['label'=>'Leads/Donatur','name'=>'leads_id','type'=>'select2','validation'=>'required|min:1|max:255','width'=>'col-sm-10','datatable'=>'leads,nama'];
			// $this->form[] = ['label'=>'Mutasi Bank','name'=>'mutasi_bank_id','type'=>'select2','validation'=>'min:1|max:255','width'=>'col-sm-10','datatable'=>'mutasi_bank,id'];
			$this->form[] = ['label'=>'Nominal','name'=>'nominal','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Status','name'=>'status','type'=>'select','validation'=>'required|min:1|max:255','width'=>'col-sm-10','dataenum'=>'pending;Completed'];
			# END FORM DO NOT REMOVE THIS LINE

			/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
	        $this->sub_module = array();


	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */
	        $this->addaction = array();

	        
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
	        $this->index_button = array();



	        /* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
	        $this->table_row_color = array();     	          

	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
	        $this->index_statistic = array();
			$this->index_statistic[] = ['label'=>'Total Data','count'=>DB::table('donasi')->count(),'color'=>'danger','width'=>'col-md-4'];
			$this->index_statistic[] = ['label'=>'Pending','count'=>DB::table('donasi')->where('status','pending')->count(),'color'=>'warning','width'=>'col-md-4'];
			$this->index_statistic[] = ['label'=>'Completed','count'=>DB::table('donasi')->where('status','completed')->count(),'color'=>'success','width'=>'col-md-4'];
	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = "NULL";
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
	        $this->load_js = array();
	        
	        
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here
	            
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	    public function hook_query_index(&$query) {
	        //Your code here
	            
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */    
	    public function hook_row_index($column_index,&$column_value) {	        
	    	//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	    public function hook_after_add($id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_edit(&$postdata,$id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_edit($id) {
	        //Your code here 

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_delete($id) {
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }




		public function getIndex()
		{
			//First, Add an auth
			if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));

			//dd($status);
			//Create your own query 
			$data = [];
			$data['page_title'] = 'Halaman Donasi';

			$donasi = DB::table('donasi')
								->select(['donasi.*','rekening.bank','leads.nama','campaigns.judul'])
								->join('rekening','rekening_id','rekening.id')
								->join('leads','leads_id','leads.id')
								->join('campaigns','campaigns_id','campaigns.id');	
								

			$donasi = $donasi->paginate(10);

			$data['donasi'] = $donasi;


			$data['rekening'] =DB::table('rekening')->get();
			$data['campaigns'] =DB::table('campaigns')->get();
			
			return view('admin.donasi',$data);
		}



		public function postIndex(Request $request)
		{
			//First, Add an auth
			if(!CRUDBooster::isView()) CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
   
			$tanggal_awal = $request->input('tanggal_awal');
			$tanggal_akhir = $request->input('tanggal_akhir');
			$status = $request->input('status');
			$rekening = $request->input('rekening');
			$jenis_donasi = $request->input('jenis_donasi');

			//dd($status);
			//Create your own query 
			$data = [];
			$data['page_title'] = 'Halaman Donasi';

			$donasi = DB::table('donasi')
								->select(['donasi.*','rekening.bank','leads.nama','campaigns.judul'])
								->join('rekening','rekening_id','rekening.id')
								->join('leads','leads_id','leads.id')
								->join('campaigns','campaigns_id','campaigns.id')
								;	
								
			if($status!=null){
				$donasi = $donasi->where('donasi.status',$status);
			}
			if($tanggal_awal!=null){
				$donasi = $donasi->where('donasi.tanggal','>=',$tanggal_awal);
			}
			if($tanggal_akhir!=null){
				$donasi = $donasi->where('donasi.tanggal','<=',$tanggal_akhir);
			}

			if($rekening!=null){
				$donasi = $donasi->where('donasi.rekening_id',$rekening);
			}

			if($rekening!=null){
				$donasi = $donasi->where('jenis_campaigns_id',$jenis_donasi);
			}

			$donasi = $donasi->paginate(10);

			$data['donasi'] = $donasi;


			$data['rekening'] =DB::table('rekening')->get();
			$data['campaigns'] =DB::table('campaigns')->get();
			
			return view('admin.donasi',$data);
		}





	    //By the way, you can still create your own method in here... :) 


	}