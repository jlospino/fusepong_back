<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class UserController extends Controller
{
  /**
   * Registrar un nuevo usuario
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
    public function register(Request $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->company_id = $request->company_id;
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json($user);
    }

    /**
     * Obtener un usuario especifico, se obtiene el id del token
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getUser(Request $request)
    {
      $user = User::whereId($request->user()->id)
      ->with('company')
      ->first();
      return response()->json($user);
    }

}
