@extends('layouts.master')
@section('content')
    <!-- Main content -->
    <section class="content">     
            

              <!-- /.card-header -->
              <div class="card-body">

                <button class="btn btn-success btn-sm mb-2">Tambah</button>
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nama Rekening</th>
                    <th>Nomor Rekening</th>
                    <th>Scrap ID</th>
                    <th>Bank</th>
                  </tr>
                  </thead>
                  <tbody>
                    @foreach($rekening as $row)
                      <tr>
                        <td>{{$row->id}}</td>
                        <td>{{$row->nama_rekening}}</td>
                        <td>{{$row->nomor_rekening}}</td>
                        <td>{{$row->scrap_id}}</td>
                        <td></td>
                      </tr>
          @endforeach
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>Nama Rekening</th>
                    <th>Nomor Rekening</th>
                    <th>Scrap ID</th>
                    <th>Bank</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>



    </section>
    <!-- /.content -->

@endsection