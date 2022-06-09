
globalvar SurfsMap;
SurfsMap = ds_map_create();

show_debug_message("")
show_debug_message("Surfs v1.0 - by Electro")
show_debug_message("")


//This is the frame interval for each check, increase it if the library is affectin performance
#macro GARBAGE_TIME room_speed/60

globalvar GarbageTimeSource;
GarbageTimeSource = time_source_create(time_source_global,GARBAGE_TIME,
time_source_units_frames,

function(){
	
	//Garbage collector
	
	Surfs_check();
	var mapnames = ds_map_keys_to_array(SurfsMap);
    var a=0;
	
	while(a<array_length(mapnames)){
	
	   var entry = SurfsMap[? mapnames[a]];
	  
	   var garbageCond = entry.MyGarbage;
	   
	   if(!is_array(garbageCond)){
		  show_error("\nGargabe Method should be an array.\n",true);   
	   }else{
		
		   if(array_length(garbageCond)<2){
			  show_error("\nGarbage Methods need at least two entries.\n",true);   
		   }
		   
		   var define = garbageCond[0];
		   var args = garbageCond[1];
		   
		   if(is_method(define)){
			   
			  if(is_array(args)){ 
			     var b = script_execute_ext(define,args); 
			  }else{
				 var b = define(args);  
			  }
			  
			 if(b){ Surfs_free(mapnames[a]); }
			 
		   }else if(is_string(define)){
			   
			   switch(define){
				
					default: show_error("\nGarbage Method specified doesn't exist, check for a list of them in __surfs_init or use a custom defined method.\n",true); break;
					
					case "obj": //Free when one or more objects don't exist
					   if(!is_array(args)){
						  if(!instance_exists(args)){ Surfs_free(mapnames[a]); }   
					   }else{
						
						  var _insts = array_length(args);
						  
						  for(var i=0; i<array_length(args); i++){ if(!instance_exists(args[i])){_insts--;} }
						  
						  if(_insts<=0){ Surfs_free(mapnames[a]); }
						
					   }
					break;
					
					case "region":
					   if(array_length(garbageCond)<3){
							show_error("\nGarbage Method 'region' needs three entries.\n",true);   
						}
						var inside = garbageCond[2];
						
						if(!is_array(args) || array_length(args)<6){
						   show_error("\nGarbage Method's second entry must be a an array with 6 values.\n",true);
						}else{
						   var surfx = args[0]; var surfy = args[1];
						   var x1=args[2]; var y1=args[3]; var x2=args[4]; var y2=args[5];
						   
						   
						     var is =  surfx>x2 || surfy>y2 || 
							 surfx+surface_get_width(SurfsMap[? mapnames[a]].surf)<x1
							 || surfy+surface_get_height(SurfsMap[? mapnames[a]].surf)<y1;
						   	 
						   if(!inside){
						    if(is){Surfs_free(mapnames[a]);}
						   }else if(!is){Surfs_free(mapnames[a]);}
						 
						}
					break;
				   
			   }
			   
		   }
		   
		   
		
	   }
	
	
		 a++;
	}
	
},[],-1);

time_source_start(GarbageTimeSource);