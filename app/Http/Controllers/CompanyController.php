<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Company;

class CompanyController extends Controller
{
    public function getCompanys(Request $request)
    {
        $companys = Company::orderBy('name', 'desc')->get();
        return response()->json($companys);
    }
}
