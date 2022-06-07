<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DestinasiController;
use App\Http\Controllers\AdminController;
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

//Test Upload Image
Route::post('/store', [DestinasiController::class, 'storeImage']);