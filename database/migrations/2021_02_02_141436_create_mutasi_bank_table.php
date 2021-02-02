<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMutasiBankTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mutasi_bank', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->date('tanggal');
            $table->string('keterangan',300);
            $table->integer('nominal');
            $table->string('type',10);
            $table->string('status',15);
            $table->timestamps();

             $table->unsignedBigInteger('rekening_id');
             $table->foreign('rekening_id')->references('id')->on('rekening');
        });



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mutasi_bank');
    }
}
