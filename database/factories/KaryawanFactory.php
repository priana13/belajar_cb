<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Karyawan;
use Faker\Generator as Faker;

$factory->define(Karyawan::class, function (Faker $faker) {
    return [
        'nama' => $faker->name(),
        'alamat' => $faker->address(),
        'hp' => $faker->phoneNumber(),
        'jk' => 'Laki-laki'
    ];
});
