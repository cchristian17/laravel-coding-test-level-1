<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EventController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::prefix('v1')->group(function () {
    Route::post('login', [AuthController::class, 'login'])->name('api.auth.login');
    Route::post('register', [AuthController::class, 'register'])->name('api.auth.login');

    Route::prefix('events')->group(function () {
        Route::get('', [EventController::class, 'index'])->name('api.event.index');
        Route::get('active-events', [EventController::class, 'activeEvents'])
            ->name('api.event.active-events');
        Route::get('{id}', [EventController::class, 'show'])->name('api.event.show');

        // Only Admin can CREATE, UPDATE, DELETE Event
        Route::group(['middleware' => 'auth:api'], function () {
            Route::post('', [EventController::class, 'store'])->name('api.event.store');
            Route::patch('{id}', [EventController::class, 'edit'])->name('api.event.patch');
            Route::put('{id}', [EventController::class, 'update'])->name('api.event.update');
            Route::delete('{id}', [EventController::class, 'destroy'])->name('api.event.delete');
        });
    });

    Route::group(['middleware' => 'auth:api'], function () {
        Route::get('logout', [AuthController::class, 'logout'])->name('api.auth.logout');
        Route::get('user-token', [AuthController::class, 'userToken'])->name('api.auth.user-token');
    });
});
