@extends('layouts.master')
@section('content')

<div class="container">
	<div class="col-md-8">
		

            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Form</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">

                 <div class="form-group">
                    <label for="bank">Bank</label>
                    <select  class="form-control" id="bank" >
                    	<option>Mandiri</option>
                    	<option>BCA</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="nama_rekening">Nama Rekening</label>
                    <input type="text" class="form-control" id="nama_rekening" placeholder="Rekening atas nama">
                  </div>

                  <div class="form-group">
                    <label for="nomor_rekening">Nomor Rekening</label>
                    <input type="text" class="form-control" id="nomor_rekening" placeholder="nomor rekening">
                  </div>

                  <div class="form-group">
                    <label for="scrap_id">Scrap ID</label>
                    <input type="text" class="form-control" id="scrap_id" placeholder="id scrap moota">
                  </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Tambah Data</button>
                </div>
              </form>
            </div>
            <!-- /.card -->

	</div>
</div>



@endsection