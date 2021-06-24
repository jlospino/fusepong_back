<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Project;
use App\Models\Company;

class ProjectController extends Controller
{
  /**
   * Obtener el listado de proyectos correspondientes a una compañia especifica
   *
   * @param  int  $company
   * @return \Illuminate\Http\Response
   */
  public function getProjects($company)
  {
    $projects = Project::orderBy('updated_at', 'desc')
    ->where('company_id', $company)
    ->get();

    return response()->json($projects);
  }

  /**
   * Obtener detalles de un proyecto especifico
   *
   * @param  int  $project
   * @return \Illuminate\Http\Response
   */
  public function showProject($project)
  {
    $project = Project::whereId($project)
    ->with('historys','historys.tickets')
    ->first();
    return response()->json($project);
  }
}
