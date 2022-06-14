/*
Functions used to operate Surfs

Note: Functions marked with an 'X' should not be used
*/

function Surfs_map_exists(){
    return variable_global_exists("SurfsMap") && ds_exists(SurfsMap,ds_type_map);	
}

function Surfs_check(){
    if(!Surfs_map_exists()){
	   show_error("\nSurfs Map does not exist.\n",true);	
	}
}

function Surf_struct(width,height,garbageMethod) constructor { //'X'
    	surf = surface_create(width,height);
		MyGarbage = garbageMethod;
		exists = true;
		surfw=width;
		surfh=height;
}

function Surfs(name,width,height,garbageMethod){
	
	//Check if the entry in the data structure exists or if a struct is defined in it
	if(!ds_map_exists(SurfsMap,name) || !is_struct(SurfsMap[? name])){
		
		//Add a new entry to the data structure with a struct containing the surface
		ds_map_add(SurfsMap,name, new Surf_struct(width,height,garbageMethod) );

	}else{
		
	   //Recreate the surface if it's somehow gone
	   if(!surface_exists(SurfsMap[? name].surf)){
		   SurfsMap[? name].surf = surface_create(width,height);   
	   }
	   
	}
	
	return SurfsMap[? name].surf;
	
}

function Surfs_set_GargabeMethod(name,garbageMethod){
   	if(ds_map_exists(SurfsMap,name) && is_struct(SurfsMap[? name])){
		SurfsMap[? name].MyGarbage = garbageMethod;
	}
}
	
function Surfs_free(name){
    if(ds_map_exists(SurfsMap,name) && is_struct(SurfsMap[? name])){
	   if(surface_exists(SurfsMap[? name].surf)){
		   
		  surface_free(SurfsMap[? name].surf);
		  SurfsMap[? name].exists=false;
		  delete SurfsMap[? name];
		  ds_map_delete(SurfsMap,name);
		   
	   }
	}
}

function Surfs_exists(name){
   return SurfsMap[? name].exists;
}

function Surfs_get(name){
   if(!Surfs_exists(name)){exit;}
   return SurfsMap[? name].surf;
}

function Surfs_width(name){
   return SurfsMap[? name].surfw;
}

function Surfs_height(name){
   return SurfsMap[? name].surfh;
}

function Surfs_set_target(name){
   return surface_set_target(Surfs_get(name));
}

function Surfs_draw(name,x,y){
   draw_surface(Surfs_get(name),x,y);	
}

function Surfs_resize(name,width,height){
   surface_resize(Surfs_get(name),width,height);
   SurfsMap[? name].surfw=width;
   SurfsMap[? name].surfh=height;
}

function Surfs_debug(){
    draw_set_valign(fa_top);draw_set_halign(fa_left);
	draw_text(10,10,"Surfs v1.0 by Electro\n\nSurfs created: "+string(ds_map_size(SurfsMap)));
	
	draw_set_halign(fa_right);
	
	var names = ds_map_keys_to_array(SurfsMap);
	
	for(var a=0; a<ds_map_size(SurfsMap); a++){
	    draw_text(room_width-10,10+12*a,"'"+names[a]+"' :Surf "+string(a+1));
	}
}
	
function Surfs_get_texture(name){
	return surface_get_texture(Surfs_get(name));
}