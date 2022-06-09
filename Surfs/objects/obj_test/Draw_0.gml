var name = "testsurfname";

Surfs(name,room_width/3,room_height/3,[function(){return Surfs_width("testsurfname")>400},-1]);

surfw=Surfs_width(name);
surfh=Surfs_height(name);


Surfs_set_target(name);

#region Draw the surface content
	draw_clear_alpha(c_red,0.2);

	draw_circle(surfw/2+sin(current_time*0.01)*40,
	surfh/2+cos(current_time*0.01)*40,40,0);

	surface_reset_target();
#endregion

Surfs_draw(name,room_width/3-(surfw-room_width/3)/2,room_height/3-(surfh-room_height/3)/2);

draw_rectangle(room_width/2-200,room_height/2-room_height/6-200,
room_width/2+200,room_height/2+room_height/6+200,1);


//Test resizing
if(keyboard_check(vk_up)){
   surfw++; surfh++;
   Surfs_resize(name,max(surfw,1),max(surfh,1));
}

if(keyboard_check(vk_down)){
   surfw--; surfh--;
   Surfs_resize(name,max(surfw,1),max(surfh,1));
}

if(keyboard_check_pressed(vk_space)){Surfs_free(name);}
if(keyboard_check_pressed(vk_escape)){instance_destroy();}