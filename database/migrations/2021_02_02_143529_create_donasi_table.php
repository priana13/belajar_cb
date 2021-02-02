<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDonasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('donasi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('nominal');
            $table->string('status',10);
            $table->timestamps();

            $table->unsignedBigInteger('campaigns_id');
            $table->foreign('campaigns_id')->references('id')->on('campaigns');

            $table->unsignedBigInteger('leads_id');
            $table->foreign('leads_id')->references('id')->on('leads');

            $table->unsignedBigInteger('mutasi_bank_id');
            $table->foreign('mutasi_bank_id')->references('id')->on('mutasi_bank');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('donasi');
    }
}
