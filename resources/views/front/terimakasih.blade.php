<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Terimakasih</title>

    <script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '{{$pixel_id}}');
    fbq('track', 'PageView');
    fbq('trackCustom', 'Thank You Page');
  </script>



  </head >
  <body class="bg-light">
 <div class="bg-light">

     <div class="row mb-3"> <!-- row navbar -->
            <div class="col-md">
                <!-- Just an image -->
                <nav class="navbar navbar-light bg-white">
                <a class="navbar-brand" href="#">
                    <!-- Logo <img src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30" height="30" alt=""> -->
                <h2>Logo</h2>
                </a>
                </nav>
            </div>
        </div> <!-- akhir row navbar -->


    <div class="container">
        <div class="bg-white text-center p-3">
        <hr class="border border-warning">
        
            <h4 class="h4">Alhamdulillah, Tinggal satu langkah lagi.. </h4>
            <p class="text mb-5">No. Invoice : INV-{{$transaksi->id}}</p>
            

            <p class="text mb-0 pb-0">Silahkan transfer ke rekening <strong>{{$transaksi->bank}}</strong> a/n</p>
        <h5 class="h5 mt-0 pt-0">{{$transaksi->nama_rekening}}</h5>

            <div class="flex border border-gray rounded bg-gray-600 items-center p-3 mt-3 mb-3">
              <p><strong>{{$transaksi->nomor_rekening}}</strong></p>
             </div>


            <p>Transfer sesuai nominal berikut ya Kak.</p>
            <h3 class ="text-base">Rp. {{number_format($transaksi->nominal,0)}}</h3>


            <div class="alert alert-warning" role="alert">
                <span class="oi oi-info"></span>
                <p class="text"><strong>PENTING!</strong> Mohon Transfer tepat <strong>3 Digit Terakhir</strong> yang tertera agar bisa di cek oleh system</p>
            </div>


            <div >
                <table class="table table-price rounded border border-gray bg-gray p-3">
                  <tr>
                    <td>Donasi</td>
                    <td>{{number_format($transaksi->nominal-$transaksi->kode_unik,0)}}</td>
                  </tr>
                  <tr>
                    <td>Kode Unik</td>
                    <td>{{number_format($transaksi->kode_unik,0)}}</td>
                  </tr>
                </table>
            </div>

            <p class="text text-small"><i>*Kode Unik akan didonasikan</i></p>


            <hr class="border border-warning">



        <button class="btn btn-primary btn-block btn-lg" >Share ke Facebook</button>
        <button class="btn btn-success btn-block btn-lg">Share ke Whatsapp</button>
        

          </div>


    </div>
 
 </div> 



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>

              function kirim(){
                  //  alert('ok');
                  $.ajax({
                    type: 'GET',
                    url: "<?= url('/').'/transaksi/'.$transaksi->kode_transaksi;?>", 
                    data: {
                        
                    },
                    success: function(result){
                      //alert('berhasil terkirim');
                  }}); 

              }

              kirim();



    </script>
  
  
  
  </body>
</html>