<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Ticket;

class TicketController extends Controller
{
  public function getTickets($history)
  {
    $tickets = Ticket::where('history_id', $history)->get();
    return response()->json($tickets);
  }
    /**
     * Crear un nuevo ticket.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      $ticket = new Ticket();
      $ticket->name = $request->ticket;
      $ticket->history_id = $request->history_id;
      $ticket->state = 'activo';
      $ticket->save();

      return response()->json($ticket);
    }

    /**
     * Actualizar un ticket especifico en la base de datos.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $ticket = Ticket::find($id);
        $ticket->name = $request->name;
        $ticket->save();

        return response()->json($ticket);
    }

    /**
     * Cancelar un ticket especifico en la base de datos
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cancel($id)
    {
      $ticket = Ticket::find($id);
      $ticket->state = 'cancelado';
      $ticket->save();

      return response()->json($ticket);
    }
}
