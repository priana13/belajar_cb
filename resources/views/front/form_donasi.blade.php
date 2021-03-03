<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Formulir Donasi</title>
  </head>
  <body>
<div class="container">

    <div class="row mb-3"> <!-- row navbar -->
        <div class="col-md">
            <!-- Just an image -->
            <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <!-- Logo <img src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30" height="30" alt=""> -->
            <h2>Logo</h2>
            </a>
            </nav>
        </div>
    </div> <!-- akhir row navbar -->

    <div class="row"> <!-- awal row formulir -->
            
        </div>
        <div class="col-md">
            <h5>Anda akan berdonasi untuk Program:</h5>
            <h4 class="mb-3"><strong>#{{$campaign->judul}}</strong></h4>
            
            <form action="{{route('proses_transaksi')}}" method="POST">

                @csrf
                <!-- Jumlah Donasi input -->
                <input type="hidden" name="campaign_id" value="{{$campaign->id}}">
                <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Rp.</span>
                </div>
                <input type="text" name="nominal" class="form-control form-control-lg" placeholder="*Nominal Donasi">
                </div>

                <!-- Pilih Metode Donasi -->
                <div class="form-group">
                    <select class="form-control" name="rekening" id="rekening">
                    <option value="">*Pilih Metode Donasi</option>
                    @foreach($rekening as $row)
                    <option value="{{$row->id}}">{{$row->bank}}</option>
                    @endforeach

                    </select>
                </div>


                <br><br>                
                <!-- Nama input -->
                <div class="form-outline mb-4">
                <input name="nama" class="form-control" type="text" placeholder="*Nama">
                </div>

                <!-- Nama input -->
                <div class="form-outline mb-4">
                <input name="hp" class="form-control" type="text" placeholder="*No HP">
                </div>



                <!-- Message input -->
                <div class="form-outline mb-4">
                    <textarea name="doa" class="form-control" id="doa" rows="4" placeholder="Harapan dan Do'a"></textarea>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-danger btn-lg btn-block mb-4">Donasi Sekarang</button>
                </form>



        </div>  <!-- akhir md-8 -->
    </div> <!-- akhir row formulir -->


</div><!-- akhir div container -->




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>