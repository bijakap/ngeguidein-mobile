<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DestinasiController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AkunController;
use App\Http\Controllers\KomenController;
use Illuminate\Support\Facades\Response;
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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

//get Data
Route::get('/testdestinasi', [DestinasiController::class, 'index']);
Route::get('/pilihan', [DestinasiController::class, 'pilihan']);
Route::get('/pilihan/{id}', [DestinasiController::class, 'destinasi']);
Route::get('/komentar/{id}', [KomenController::class, 'tampilKomentar']);

// Route::get('profile', [AkunController::class, 'index']);
Route::get('profile/edit/{id}', [AkunController::class, 'tampilkan_data']);
Route::post('profile/edit/{id}/post', [AkunController::class, 'ubah']);

//Test Upload Image
Route::post('/store', [DestinasiController::class, 'storeImage']);

//komentar
Route::post('/komentar/{id}/post_komen/{id_user}', [KomenController::class, 'index']);

