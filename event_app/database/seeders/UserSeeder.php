<?php

namespace Database\Seeders;

use App\Models\User;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        for ($i = 0; $i < 6; $i++) {
            $user = new User();
            if ($i === 0) {
                $user->name = 'Admin' . ' ' . $faker->lastName;
                $user->email = 'admin@example.com';
                $user->password = Hash::make('admin123');
                $user->role = 1;
            } else {
                $user->name = 'User' . $i . ' ' . $faker->firstName . ' ' . $faker->lastName;
                $user->email = 'user' . $i . '@example.com';
                $user->password = Hash::make('user123');
                $user->role = 0;
            }
            $user->address = $faker->streetAddress;
            $user->place_of_birth = $faker->city;
            $user->date_of_birth = $faker->dateTimeThisCentury->format('Y-m-d');
            $user->phone_number = $faker->phoneNumber;
            $user->save();
        }
    }
}
