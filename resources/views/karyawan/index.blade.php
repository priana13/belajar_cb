@extends('crudbooster::admin_template')
@section('content')

<h2>Halaman Index Karyawan</h2>

<div class="table-reponsive">
    <table class="table">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nama</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($karyawan as $row)
            <tr>
                <td>{{ $row->id }}</td>
                <td>{{ $row->nama }}</td>
                <td>
                   <a href="" class="btn btn-sm btn-primary">Edit</a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

@endsection