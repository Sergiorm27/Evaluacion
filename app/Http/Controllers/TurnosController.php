<?php

namespace App\Http\Controllers;

use App\Models\Turnos;
use Illuminate\Http\Request;

class TurnosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Turnos::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $turnos = new Turnos();
        $turnos->turno = $request->turno;
        $turnos->peliculas_id = $request->peliculas_id;
        $turnos->estado = $request->estado;
        //$pelicula->user_id = auth()->id();
        //return response()->json($turnos);

        $turnos->save();
        return $turnos;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Turnos  $turnos
     * @return \Illuminate\Http\Response
     */
    public function show(Turnos $turnos,$id)
    {
        return Turnos::where("peliculas_id","=",$id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Turnos  $turnos
     * @return \Illuminate\Http\Response
     */
    public function edit(Turnos $turnos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Turnos  $turnos
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $campos=[
            'turno' =>'required|string'
        ];
        $Mensaje=['required'=>'El :attribute es requerido'];
        $this->validate($request,$campos,$Mensaje);

        $datosTurnos = request()->except([]);

        Turnos::where("id","=",$id)->update($datosTurnos);
        return $datosTurnos;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Turnos  $turnos
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $turnos = Turnos::find($id);
        $turnos->delete();
    }
}
