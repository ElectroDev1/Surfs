/*
Functions used to operate Surfs
*/

/// @description	Creates a new surface and assigns it to the global map as a Surfs, only if a Surfs with the same name doesn't exist.
function Surfs(name,width,height,garbageMethod,slapMethod=-4){
	
	//Check if the entry in the data structure exists or if a struct is defined in it
	if(!ds_map_exists(SurfsMap,name) || !is_struct(SurfsMap[? name])){
		
		//Add a new entry to the data structure with a struct containing the surface
		ds_map_add(SurfsMap,name, new Surf_struct(width,height,garbageMethod,slapMethod) );

	}else if(!surface_exists(SurfsMap[? name].surf)){
		
			SurfsMap[? name].surf = surface_create(width,height);   
		   	
			if(is_method(slapMethod)){
				
			   surface_set_target(SurfsMap[? name].surf);
	   
			   slapMethod();
	   
			   surface_reset_target();
			}
	   
	   
	}

	return SurfsMap[? name].surf;
	
}
/// @description	Edit an existing Surfs' Garbage method
function Surfs_set_GargabeMethod(name,garbageMethod){
   	if(ds_map_exists(SurfsMap,name) && is_struct(SurfsMap[? name])){
		SurfsMap[? name].MyGarbage = garbageMethod;
	}
}

/// @description	Free a Surfs from memory
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

/// @description	Check if a Surfs exists in memory
function Surfs_exists(name){
   return SurfsMap[? name].exists;
}

/// @description	Get the surface ID of a Surfs
function Surfs_get(name){
   if(!Surfs_exists(name)){exit;}
   return SurfsMap[? name].surf;
}

/// @description	Get the width of the surface ID of a Surfs
function Surfs_width(name){
   return SurfsMap[? name].surfw;
}

/// @description	Get the height of the surface ID of a surfs
function Surfs_height(name){
   return SurfsMap[? name].surfh;
}

/// @description	Set the surface ID of a Surfs as the drawing target
function Surfs_set_target(name){
   return surface_set_target(Surfs_get(name));
}

/// @description	Draw a Surfs' surface
function Surfs_draw(name,x,y){
   draw_surface(Surfs_get(name),x,y);	
}

/// @description	Resize a Surfs' size
function Surfs_resize(name,width,height){
   surface_resize(Surfs_get(name),width,height);
   SurfsMap[? name].surfw=width;
   SurfsMap[? name].surfh=height;
}

/// @description	Draw some information about Surfs
function Surfs_debug(){
    draw_set_valign(fa_top);draw_set_halign(fa_left);
	draw_text(10,10,"Surfs v1.0 by Electro\n\nSurfs created: "+string(ds_map_size(SurfsMap)));
	
	draw_set_halign(fa_right);
	
	var names = ds_map_keys_to_array(SurfsMap);
	
	for(var a=0; a<ds_map_size(SurfsMap); a++){
	    draw_text(room_width-10,10+12*a,"'"+names[a]+"' :Surf "+string(a+1));
	}
}

/// @description	Get the texture of a Surf's surface
function Surfs_get_texture(name){
	return surface_get_texture(Surfs_get(name));
}