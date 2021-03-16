<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')

  <!-- Your html goes here -->
  <div class='panel panel-default'>
    <div class='panel-heading'>Configurasi Global</div>
    <div class='panel-body'>
      <form method='post' action="{{CRUDBooster::mainpath($slug='data')}}">

      {{ csrf_field() }}

        <div class='form-group'>
          <label>Moota Key</label>
          <input type='text' name='moota' required class='form-control' value="{{$api_moota->value}}" id="moota" />
        </div>
         
        <div class='form-group'>
          <label>Woo-wa Key</label>
          <input type='text' name='woo_wa' required class='form-control' value="{{$api_woo->value}}" id="woo_wa" />
        </div>

        <div class='form-group'>
          <label>Facebook Pixel ID</label>
          <input type='text' name='pixel_id' required class='form-control' value="{{$pixel_id->value}}" id="pixel_id" />
        </div>

        <div class='panel-footer'>        
        <input type='submit' class='btn btn-primary' value='Simpan' id="simpan"/>
        </div>
      </form>

    </div>


  </div>

<script>



      $(function(){
				alert('ok');
			});
				


</script>
@endsection