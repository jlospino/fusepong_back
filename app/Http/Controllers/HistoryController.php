<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\History;
use App\Models\Ticket;

class HistoryController extends Controller
{
  /**
     * Crear una nueva historia de usuario con su respectivo ticket por defecto
     *
     * @param  \Illuminate\Http\Requests\Request  $request
     * @return \App\Models\History
     */
    public function create(Request $request)
    {
      DB::beginTransaction();
      try {
        $history = new History();
        $history->name = $request->name;
        $history->project_id = $request->project_id;
        $history->user_id = $request->user()->id;
        $history->save();

        $ticket = new Ticket();
        $ticket->name = $request->ticket;
        $ticket->history_id = $history->id;
        $ticket->state = 'activo';
        $ticket->save();

        DB::commit();
        return response()->json($history);

      } catch (\Throwable $e) {
        $e->getMessage();
        DB::rollback();
      }


    }
}
