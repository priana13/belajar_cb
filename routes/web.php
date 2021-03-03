<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::post('/proses_transaksi', 'TransaksiController@store')->name('proses_transaksi');
Route::get('/terimakasih','TransaksiController@terimakasih')->name('terimakasih');;

// // Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');
// Route::get('/rekening', 'RekeningController@index');
// Route::get('/rekening/create', 'RekeningController@create');

//front
Route::get('/{slug}', 'TransaksiController@create');

