<?php

namespace App\Http\Controllers;

use App\Models\Peliculas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PeliculasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return Peliculas::paginate(200);
        if($request->ajax()){
        }else{
            return view('home');
        }
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
        $pelicula = new Peliculas();
        $pelicula->nombres = $request->nombres;
        $pelicula->fecha_publicacion = $request->fecha_publicacion;
        $pelicula->estado = $request->estado;
        //return response()->json($pelicula);
        if($request->hasFile('imagen')){
            $pelicula->imagen=$request->file('imagen')->store('peliculas','public');
        }
        $pelicula->save();
        return $pelicula;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Peliculas  $peliculas
     * @return \Illuminate\Http\Response
     */
    public function show(Peliculas $peliculas)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Peliculas  $peliculas
     * @return \Illuminate\Http\Response
     */
    public function edit(Peliculas $peliculas)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Peliculas  $peliculas
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $campos=[
            'nombres' =>'required|string',
            'fecha_publicacion' =>'required|date'    
        ];
        if($request->hasFile('imagen')){
            $campos+=['imagen' =>'required|max:10000|mimes:jpg,jpeg,png'];
        }
        $Mensaje=['required'=>'El :attribute es requerido'];
        $this->validate($request,$campos,$Mensaje);

        $datosPeliculas = request()->except([]);

        if($request->hasFile('imagen')){
            $peliculas= Peliculas::find($id);
            Storage::delete("public/".$peliculas->imagen);
            $datosPeliculas['imagen']=$request->file('imagen')->store('peliculas','public');
        }
        Peliculas::where("id","=",$id)->update($datosPeliculas);

        return $datosPeliculas;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Peliculas  $peliculas
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $peliculas = Peliculas::find($id);
        Storage::delete("public/".$peliculas->imagen);
        $peliculas->delete();
    }
}
