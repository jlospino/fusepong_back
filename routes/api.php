<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\TicketController;

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

Route::middleware('cors')->post('/register_user', [UserController::class, 'register'])->name('register_user');
Route::middleware('cors')->get('/companys', [CompanyController::class, 'getCompanys'])->name('companys');

Route::middleware(['auth:api', 'cors'])->group(function () {
  Route::get('/projects/{company_id}', [ProjectController::class, 'getProjects'])->name('projects');
  Route::get('/project/{id}', [ProjectController::class, 'showProject']);

  Route::post('addHistory', [HistoryController::class, 'create']);
  Route::post('addTicketHistory', [TicketController::class, 'store']);

  Route::put('updateTicket/{id}', [TicketController::class, 'update']);
  Route::put('cancelTicket/{id}', [TicketController::class, 'cancel']);
  Route::get('/getTickets/{history}', [TicketController::class, 'getTickets']);

  Route::get('/user', [UserController::class, 'getUser'])->name('user');
});

Route::middleware(['auth:api', 'cors'])->get('/logout', function (Request $request) {
    $request->user()->token()->revoke();
});
