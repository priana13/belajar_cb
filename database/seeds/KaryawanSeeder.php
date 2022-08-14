<?php

use Illuminate\Database\Seeder;
use App\Karyawan;

class KaryawanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Karyawan::class, 50)->create();
    }
}
