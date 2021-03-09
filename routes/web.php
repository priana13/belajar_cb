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
Route::get('/terimakasih/{kode}','TransaksiController@terimakasih')->name('terimakasih');
Route::get('/transaksi/{kode}','TransaksiController@getNotif')->name('notif');

//front
Route::get('/{slug}', 'TransaksiController@create');

