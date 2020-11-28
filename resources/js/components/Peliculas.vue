<template>
    <div class="container">
        <div class="alert alert-success" role="alert" v-if="optionmensaje">
            <h5>{{mensaje}} Correctamente</h5>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-md-10">

                <div v-if="controller=='peliculas'">

                    <div class="col-xs-12 col-md-12 row" v-if="vista=='lista'">
                        <h3 class="col-xs-12 col-md-8"><strong>Peliculas</strong></h3>
                        <div class="col-xs-12 col-md-4">
                            <a href="#" class="btn btn-success pull-right col-md-12" @click="VistaForm('peliculas','','form','cancel')"><i class="fa fa-plus"></i> Agregar Nuevo</a>
                        </div>
                    </div>
                    <br>
                    <div v-if="vista=='form'">
                        <form @submit.prevent="editarPelicula(pelicula)" v-if="modoEditar">
                            <h3>Editar Pelicula</h3>
                            <div class="form-group row">
                                <input type="hidden" class="form-control" id="idpelicula" name="idpelicula" v-model="pelicula.id">

                                <label for="nombres" class="col-sm-3 col-form-label">Nombre de la Pelicula</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="nombres" name="nombres" v-model="pelicula.nombres">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="fecha_publicacion" class="col-sm-3 col-form-label">Fecha Publicacion</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="fecha_publicacion" name="fecha_publicacion" v-model="pelicula.fecha_publicacion">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="imagen" class="col-sm-4 col-form-label">Imagen</label>
                                
                                
                                <div class="col-xs-12 col-md-12">
                                    <input type="file" @change="ObtenetImagen" class="form-control-file" id="imagen" name="imagen" accept="image/gif, image/jpeg, image/png">
                                    
                                </div>
                                <figure v-if="imagenMiniatura!=''">
                                    <img alt="Foto Pelicula" width="200" height="200" :src="imagen">
                                </figure>
                                <figure v-if="imagenMiniatura==''">
                                    
                                    <img alt="Foto Pelicula 1" width="400" height="200" :src="'peliculas/'+pelicula.imagen">
                                    <input type="text" width="2000" :value="'../../../storage/peliculas/eAPAXdD0wS9G8noVxtaKvwHEWgOM3fo0arUAaHZr.jpeg'">
                                </figure>
                                
                            </div>
                            <div class="form-group row">
                                <label for="estado" class="col-sm-3 col-form-label">Estado</label>
                                <div class="col-sm-5">
                                    <input type="checkbox" id="estado" name="estado" v-model="pelicula.estado">
                                </div>
                            </div>
                            <button class="btn btn-warning" type="submit">Editar</button>
                            <button class="btn btn-danger" type="submit" 
                                @click="VistaForm('peliculas','','lista','cancel')">Cancelar</button>
                        </form>
                        
                        
                    
                        <form @submit.prevent="agregar" enctype="multipart/form-data" v-else>
                            <h3>Agregar Pelicula</h3>
                            <div class="form-group row">
                                <label for="nombres" class="col-sm-3 col-form-label">Nombre de la Pelicula</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="nombres" name="nombres" v-model="pelicula.nombres">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="fecha_publicacion" class="col-sm-3 col-form-label">Fecha Publicacion</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="fecha_publicacion" name="fecha_publicacion" v-model="pelicula.fecha_publicacion">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="imagen" class="col-sm-4 col-form-label">Imagen</label>
                                
                                
                                <div class="col-xs-12 col-md-12">
                                    <input type="file" @change="ObtenetImagen" class="form-control-file" id="imagen" name="imagen" accept="image/gif, image/jpeg, image/png">
                                    
                                </div>
                                <figure v-if="imagenMiniatura!=''">
                                    <img alt="Foto Pelicula" width="200" height="200" :src="imagen">
                                </figure>
                            </div>
                            <div class="form-group row">
                                <label for="estado" class="col-sm-3 col-form-label">Estado</label>
                                <div class="col-sm-5">
                                    <input type="checkbox" id="estado" name="estado" v-model="pelicula.estado">
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Agregar</button>
                            <button class="btn btn-info" @click="VistaForm('peliculas','','lista','cancel')" type="button">Cancelar</button>
                        </form>
                        <hr>
                    </div>

                    <div v-if="vista=='lista'">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Pelicula</th>
                                    <th>F. Publicacion</th>
                                    <th>Estado</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in peliculas" :key="index">
                                    <td>{{item.id}}</td>
                                    <td>{{item.nombres}}</td>
                                    <td>{{item.fecha_publicacion}}</td>
                                    <td>
                                        <span v-if="item.estado=='true'"> Activo</span>
                                        <span v-if="item.estado=='false'"> Inactivo</span>

                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-link" 
                                            @click="EditarFormulario(item),VistaForm('peliculas','','form','cancel')"><i class="fa fa-pencil"></i></button>
                                        <button class="btn btn-sm btn-link" 
                                            @click="VistaForm('turnos',item.id,'lista','cancel')"><i class="fa fa-bars"></i></button>
                                        <!--a class="btn btn-link" :href="'/peliculas/' + item.id + '/edit'"><i class="fa fa-pencil"></i></a-->
                                        <a v-if="item.estado=='true'" class="btn btn-link" href="#"><i class="fa fa-lock"></i></a>
                                        <a v-if="item.estado=='false'" class="btn btn-link" href="#"><i class="fa fa-unlock-alt"></i></a>
                                        <a class="btn btn-link" href="#" @click="eliminarPelicula(item, index)"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div v-if="controller=='turnos'">
                    <div class="col-xs-12 col-md-12 row" v-if="vista=='lista'">
                        <h3 class="col-xs-12 col-md-8"><strong>Turnos</strong></h3>
                        <div class="col-xs-12 col-md-4">
                            <a href="#" class="btn btn-success pull-right col-md-12" @click="VistaForm('turnos',idpeliculageneral,'form','cancel')"><i class="fa fa-plus"></i> Agregar Nuevo</a>
                        </div>
                    </div>
                    <br>
                    <div v-if="vista=='form'">
                        <form @submit.prevent="editarTurno(turno)" v-if="modoEditar">
                            <h3>Editar Turno</h3>
                            <input type="hidden" class="form-control" id="id" name="id" v-model="turno.id" v-text="turno.id">
                            <input type="hidden" class="form-control" id="peliculas_id" name="peliculas_id" v-model="turno.peliculas_id" v-text="turno.peliculas_id">
                            <div class="form-group row">
                                <label for="turno" class="col-sm-3 col-form-label">Turno</label>
                                <div class="col-sm-5">
                                    <input type="time" class="form-control" id="turno" name="turno" v-model="turno.turno">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="estado" class="col-sm-3 col-form-label">Estado</label>
                                <div class="col-sm-5">
                                    <input type="checkbox" id="estado" name="estado" v-model="turno.estado">
                                </div>
                            </div>
                            <button class="btn btn-warning" type="submit">Editar</button>
                            <button class="btn btn-danger" type="submit" 
                                @click="VistaForm('turnos',idpeliculageneral,'lista','cancel')">Cancelar</button>
                        </form>
                        
                        
                    
                        <form @submit.prevent="agregarTurno" enctype="multipart/form-data" v-else>
                            <h3>Agregar Turno</h3>
                            <input type="hidden" class="form-control" id="peliculas_id" name="peliculas_id" v-model="turno.peliculas_id" v-text="turno.peliculas_id">
                            <div class="form-group row">
                                <label for="turno" class="col-sm-3 col-form-label">Turno</label>
                                <div class="col-sm-5">
                                    <input type="time" class="form-control" id="turno" name="turno" v-model="turno.turno">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="estado" class="col-sm-3 col-form-label">Estado</label>
                                <div class="col-sm-5">
                                    <input type="checkbox" id="estado" name="estado" v-model="turno.estado">
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Agregar</button>
                            <button class="btn btn-info" @click="VistaForm('turnos',idpeliculageneral,'lista','cancel')" type="button">Cancelar</button>
                        </form>
                        <hr>
                    </div>

                    <div v-if="vista=='lista'">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Idpeliculas</th>
                                    <th>Turno</th>
                                    <th>Estado</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(item, index) in turnos" :key="index">
                                    <td>{{item.id}}</td>
                                    <td>{{item.peliculas_id}}</td>
                                    <td>{{item.turno}}</td>
                                    <td>
                                        <span v-if="item.estado=='true'"> Activo</span>
                                        <span v-if="item.estado=='false'"> Inactivo</span>

                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-link" 
                                            @click="EditarFormularioTurno(item),VistaForm('turnos',idpeliculageneral,'form','cancel')"><i class="fa fa-pencil"></i></button>
                                        
                                        <a v-if="item.estado=='true'" class="btn btn-link" href="#"><i class="fa fa-lock"></i></a>
                                        <a v-if="item.estado=='false'" class="btn btn-link" href="#"><i class="fa fa-unlock-alt"></i></a>
                                        <a class="btn btn-link" href="#" @click="eliminarTurno(item, index)"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                imagenMiniatura:'',
                peliculas: [],
                turnos: [],
                controller:'peliculas',
                optionmensaje:false,
                mensaje:'',
                modoEditar: false,
                vista: 'lista',
                idpeliculageneral:'',
                pelicula: {idpelicula:'',nombres: '',fecha_publicacion:'',imagen:'', estado: 'true'},
                turno: { peliculas_id:'',id:'',turno: '', estado: 'true'}
            }
        },
        computed:{
            imagen(){
                return this.imagenMiniatura;
            }
        },
        created(){
            axios.get('/peliculas').then(res=>{
                this.peliculas = res.data.data;
            })
        },
        methods:{
            VistaForm(controll,idpeli,vist,option){
                if(controll=='peliculas'){
                    this.vista=vist;
                    if(vist=='lista'){
                        this.modoEditar=false;
                        this.pelicula= {idpelicula:'',nombres: '',fecha_publicacion:'',imagen:'', estado: 'true'};
                    }
                    if(vist=='lista' && option!='cancel'){
                        this.optionmensaje=true;
                        if(option=='create'){this.mensaje='Pelicula Agregado';}
                        if(option=='update'){this.mensaje='Pelicula Actualizado';}
                        if(option=='delete'){this.mensaje='Pelicula Borrado';}
                        
                    }else{
                        this.optionmensaje=false;
                        
                    }
                    
                }else{
                    this.controller=controll;
                    this.vista=vist;
                    this.turno.peliculas_id=idpeli;
                    this.idpeliculageneral=idpeli;
                    //console.log('id: '+idpeli);
                    if(vist=='lista'){
                        this.modoEditar=false;
                        this.turno = { peliculas_id:idpeli,id:'',turno: '', estado: 'true'}
                    }
                    if(vist=='lista' && option!='cancel'){
                        this.optionmensaje=true;
                        if(option=='create'){this.mensaje='Turno Agregado';}
                        if(option=='update'){this.mensaje='Turno Actualizado';}
                        if(option=='delete'){this.mensaje='Turno Borrado';}
                    }else{
                        this.optionmensaje=false;
                    }

                    axios.get('/turnos/'+idpeli).then(res=>{
                        this.turnos = res.data;
                        //console.log(res.data);
                    })
                }
                

            },
            ObtenetImagen(e){
                let file =e.target.files[0];
                //console.log(file)
                this.pelicula.imagen = file;
                this.GargarImagen(file);
            },
            GargarImagen(file){
                let reader = new FileReader();
                reader.onload = (e)=>{
                    this.imagenMiniatura = e.target.result;
                }
                reader.readAsDataURL(file)
            },
            agregar(){
                if(this.pelicula.nombres.trim() === ''){
                    alert('Debes completar todos los campos antes de guardar');
                    return;
                }
                let formdata = new FormData();
                formdata.append('nombres',this.pelicula.nombres);
                formdata.append('fecha_publicacion',this.pelicula.fecha_publicacion);
                formdata.append('imagen',this.pelicula.imagen);
                formdata.append('estado',this.pelicula.estado);
                //const PeliculaNueva = this.pelicula;
                this.pelicula = {nombres: '',fecha_publicacion:'',imagen:'', estado: 'true'}; 
                axios.post('/peliculas', formdata)
                    .then((res) =>{
                    const PeliculaServidor = res.data;
                    //console.log(PeliculaServidor)
                    this.VistaForm('peliculas','','lista','create');
                    this.peliculas.push(PeliculaServidor);
                })
            },
            EditarFormulario(item){
                this.pelicula.id = item.id;
                this.pelicula.nombres = item.nombres;
                this.pelicula.fecha_publicacion = item.fecha_publicacion;
                this.pelicula.imagen = item.imagen;
                this.pelicula.estado = item.estado;
                this.modoEditar = true;
                //console.log(this.pelicula.imagen);
            },
            editarPelicula(pelicula){
                const params ={nombres:pelicula.nombres ,fecha_publicacion:pelicula.fecha_publicacion,imagen:pelicula.imagen, estado: pelicula.estado};
                let formdata = new FormData();
                formdata.append('id',pelicula.id);
                formdata.append('nombres',pelicula.nombres);
                formdata.append('fecha_publicacion',pelicula.fecha_publicacion);
                formdata.append('imagen',this.pelicula.imagen);
                formdata.append('estado',pelicula.estado);
                
                axios.put(`/peliculas/${pelicula.id}`, params)
                    .then(res=>{
                    //console.log(res.data);
                    this.modoEditar = false;
                    this.vista = 'lista';
                    this.VistaForm('peliculas','','lista','update');
                    //const index = this.peliculas.findIndex(item => item.id === pelicula.id);
                    //this.peliculas[index] = res.data;
                    axios.get('/peliculas').then(res=>{
                        this.peliculas = res.data.data;
                    })
                })
                
            },
            eliminarPelicula(pelicula, index){
                const confirmacion = confirm(`Eliminar Pelicula ${pelicula.nombres}`);
                if(confirmacion){
                    axios.delete(`/peliculas/${pelicula.id}`)
                    .then(()=>{
                        this.peliculas.splice(index, 1);
                        this.VistaForm('peliculas','','lista','delete');
                    })
                }

            },
            cancelarEdicion(){
                this.modoEditar = false;
                this.pelicula = {idpelicula:'',nombres: '',fecha_publicacion:'',imagen:'', estado: 'true'};
            },
            agregarTurno(){
                if(this.turno.turno.trim() === ''){
                    alert('Debes completar todos los campos antes de guardar');
                    return;
                }

                const TurnoNueva = this.turno;
                this.turno = { peliculas_id:this.turno.peliculas_id,idturno:'',turno: '', estado: 'true'}; 
                axios.post('/turnos', TurnoNueva)
                    .then((res) =>{
                    const TurnoServidor = res.data;
                    //console.log(res.data)
                    this.VistaForm('turnos',TurnoServidor.peliculas_id,'lista','create');
                    //this.peliculas.push(TurnoServidor);
                })
            },
            EditarFormularioTurno(item){
                this.turno.id = item.id;
                this.turno.turno = item.turno;
                this.turno.estado = item.estado;
                this.modoEditar = true;
            },
            editarTurno(turno){
                const params = { peliculas_id:turno.peliculas_id,id:turno.id,turno: turno.turno, estado: turno.estado};
                axios.put(`/turnos/${turno.id}`, params)
                    .then(res=>{
                    this.modoEditar = false;
                    this.vista = 'lista';
                    this.VistaForm('turnos',res.data.peliculas_id,'lista','update');
                    //const index = this.peliculas.findIndex(item => item.id === pelicula.id);
                    //this.peliculas[index] = res.data;
                    
                })
                
            },
            eliminarTurno(turno, index){
                const confirmacion = confirm(`Eliminar Turno a las ${turno.turno}`);
                if(confirmacion){
                    axios.delete(`/turnos/${turno.id}`)
                    .then(()=>{
                        this.turnos.splice(index, 1);
                        this.VistaForm('turnos',turno.peliculas_id,'lista','delete');
                    })
                }

            },
        }
    }
</script>