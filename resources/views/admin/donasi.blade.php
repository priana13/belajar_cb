@extends('crudbooster::admin_template')
@section('content')


<div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="box">

            <br>


                <div class="box-header">

                <!-- widget 1 -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>{{$Completed}}</h3>
                                <p>Completed</p>
                            </div>
                            <div class="icon">
                                <i class=""></i>
                            </div>
                        </div>
                    </div>


                <!-- widget 2 -->

                    <div class="col-md-4">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>{{$pending}}</h3>
                                <p>Pending</p>
                            </div>
                            <div class="icon">
                                <i class=""></i>
                            </div>
                        </div>
                    </div>


                <!-- widget 3 -->

                    <div class="col-md-4">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>{{$canceled}}</h3>
                                <p>Cenceled</p>
                            </div>
                            <div class="icon">
                                <i class=""></i>
                            </div>
                        </div>
                    </div>
                </div>

                <br>



                    <!-- form filtering -->
                    <form class="form-inline" action="{{route('data_donasi')}}"  method="POST" id="formulir">

                            @csrf
                            <div class="form-group">
                                <label class="" for="jenis_donasi">Form Donasi</label>
                                <select type="text" class="form-control" id="jenis_donasi" name="jenis_donasi">  
                                         @foreach($campaigns as $row)
                                            <option value="{{$row->id}}">{{$row->judul}}</option>
                                        @endforeach
                                </select>
                            </div>


                            <div class="form-group">
                                <label class="sr" for="tanggal_awal">Tanggal</label>
                                <input type="date" class="form-control" id="tanggal_awal" name="tanggal_awal">  
                                <input type="date" class="form-control" id="tanggal_akhir" name="tanggal_akhir"> 
                            </div>


                            <div class="form-group">
                                <label class="" for="status">Status</label>
                                <select type="text" class="form-control" id="status" name="status">  
                                        <option value="Completed">Completed</option>
                                        <option value="pending">Pending</option>
                                        <option value="expired">Expired</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="" for="rekening">Rekening</label>
                                <select type="text" class="form-control" id="rekening" name="rekening">  
                                        @foreach($rekening as $row)
                                        <option value="{{$row->id}}">{{$row->bank}}</option>
                                        @endforeach
                                </select>
                            </div>




                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg">Cari</button>
                            </div>                            

                        </form>

               
                </div>
                <!-- /.box-header -->

                <hr>
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