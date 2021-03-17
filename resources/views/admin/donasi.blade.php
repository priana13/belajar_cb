@extends('crudbooster::admin_template')
@section('content')


<div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="box">



                <div id="example1_filter" class="">
                        <label>Search:
                            <input type="search" class="form-control input-sm" placeholder="" aria-controls="example1">
                        </label>
                    </div>






                <div class="box-header">
                <h3 class="box-title">Data Table Donasi</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th style="width: 10px">ID</th>
                        <th>Tanggal</th>
                        <th>Form</th>
                        <th>Donatur</th>
                        <th>Rekening</th>
                        <th>Nominal</th>
                        <th>Status</th>
                        <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($donasi as $row)
                        <tr>
                        <td>{{$row->id}}</td>
                        <td>{{$row->created_at}}</td>
                        <td>{{$row->judul}}</td>
                        <td>{{$row->nama}}</td>
                        <td>{{$row->bank}}</td>
                        <td>{{number_format($row->nominal,0)}}</td>
                        <td>{{$row->status}}</td>
                        <td>
                            <a class="btn btn-success btn-sm" href="{{CRUDBooster::mainpath($slug='edit')}}/{{$row->id}}">edit</a>
                            <a class="btn btn-danger btn-sm" href="{{CRUDBooster::mainpath($slug='delete')}}/{{$row->id}}">delete</a>
                        </td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <th style="width: 10px">ID</th>
                        <th>Tanggal</th>
                        <th>Campaigns</th>
                        <th>Donatur</th>
                        <th>Rekening</th>
                        <th>Nominal</th>
                        <th>Status</th>
                        <th></th>
                        </tr>
                    </tfoot>
                </table>
                </div>



        <!-- ADD A PAGINATION -->
        <p>{!! urldecode(str_replace("/?","?",$donasi->appends(Request::all())->render())) !!}</p>

                <!-- /.box-body -->
            </div>
            <!-- /.box -->


        </div>           
    </div>
</div>



@endsection