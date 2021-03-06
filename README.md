<p align="center">
  <img src="https://github.com/ElectroDev1/Surfs/blob/main/logo.png" style="display:block; margin:auto; width:300px">
</p>
<h1 align="center">SURFS</h1>
<p align="center" >
  A library for Gamemaker v2022.5+ that makes using surfaces easier than ever
 </p>
 <h2 align="center"><a href="https://github.com/ElectroDev1/Surfs/releases/tag/v1.0.0">Download the yymps </a></h2>
 
 <hr>
 
 # WHAT IS SURFS
 <p>
  Surfs is a library made for Gamemaker v2022.5+ that handles all the boring and monotonous parts of using surfaces in Gamemaker, with only a few simple functions and no need
  to use multiple events or extra variables.
  <br><br>
  Here's what the library can do:
  <br>
  
  * Handle the creation of surfaces and recreation in case they are gone in a single function
  * All surfaces are saved in a global map and can be accessed with only a string, without the need to create new variables for every surface
  * You can define when a surface will be freed from memory the moment you create it with built in or custom methods
  * Freeing surfaces from memory in the draw event won't cause memory leaks to occur
  * The library contains many functions to quickly handle surfaces
  </p>
 <hr>
 
 # SETUP AND USAGE
 <p>
 Setting up Surfs is super easy, simply <a href="https://github.com/ElectroDev1/Surfs/releases/tag/v1.0.0">download the yymps </a>, 
  open your project, drag the yymps into Gamemaker and import everything, and you're done! Surfs automatically initialises itself right before the game starts.
  <br>
  To create a surface with Surfs, you'll need to use the Surfs() function.
  <br>
</p>  

 ```gml
Surfs(surface name,surface width,surface height,[destroy method,args]);
```
<p>
  
  * surface name {string} : the name you'll assign to the surface
  * surface width {real} : the width of the surface
  * surface height {real} : the height of the surface
  * destroy method {string, function} :
  this determines when the surface will be freed from memory, it can either be a <a>built in Surfs method</a>, a built in Gamemaker method, or a custom function.
  * args {any}: this can either be one value or an array of values, these are the arguments that will be used by the destroy method
  
  This function can be put right before you draw the surface, the surface will only be created when it doesn't exist.
  <br>
  Surfs comes with many built-in functions where you only need to the surface's name to use it, but you can always use ```Surfs_get(surface name) ``` in case you need to use the surface in other parts of your code.
 </p>
 <hr>
 
 # BUILT IN FUNCTIONS
 <p>Note: this does not contain all the functions present within Surfs, but only the ones that should be used.</p>
<br>
 <h3>Surfs(surface name,surface width,surface height,[destroy method,args...])</h3>
 <p>Creates a new surface and assigns it to the global map if it doesn't exist.
  
  * surface name {string} : the name you'll assign to the surface
  * surface width {real} : the width of the surface
  * surface height {real} : the height of the surface
  * destroy method {string, function} :
  this determines when the surface will be freed from memory, it can either be a <a>built in Surfs method</a>, a built in Gamemaker method, or a custom function.
  * args {any}: this can either be one value or an array of values, these are the arguments that will be used by the destroy method
</p>
 <br>
 <h3>Surfs_set_GargabeMethod(surface name,[destroy method,args...])</h3>
 <p>Assigns a new destroy method to an existing surface.

   * surface name {string} : the name assigned to the surface
   * destroy method {string, function} :
  this determines when the surface will be freed from memory, it can either be a <a>built in Surfs method</a>, a built in Gamemaker method, or a custom function.
  * args {any}: this can either be one value or an array of values, these are the arguments that will be used by the destroy method
</p>
 <br>
 <h3>Surfs_free(surface name)</h3>
 <p>Frees a surface from memory and removes it from the global map.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_exists(surface name)</h3>
 <p>Checks if a saved surface exists.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_get(surface name)</h3>
 <p>Returns the saved surface.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_width(surface name)</h3>
 <p>Returns the saved surface's width.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_height(surface name)</h3>
 <p>Returns the saved surface's height.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_set_target(surface name)</h3>
 <p>Sets the saved surface as the drawing target.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_draw(surface name)</h3>
 <p>Draws the saved surface.

  * surface name {string} : the name assigned to the surface
</p>
 <br>
 <h3>Surfs_resize(surface name)</h3>
 <p>Resizes the saved surface.

  * surface name {string} : the name assigned to the surface
</p>
<br>
<h3>Surfs_get_texture(surface name)</h3>
<p>Returns the surface texture's pointer.
  
  * surface name {string} : the name assigned to the surface
 </p>
 <br>
 <h3>Surfs_debug()</h3>
 <p>Draws informations related to Surfs.
</p>

<hr>

# DESTROY METHODS

<p>Surfs features a couple of destroy methods to tell when to free a surface, but it suggested to use your own custom methods.
  </p>
 <br>
 <h3>"obj", object/[object1,object2..]</h3>
 <p>Checks if one or more objects exist, and if they don't, the surface is freed.</p>
 <br>
 <h3>"region", [surface x,surface y,left,top,right,bottom],inside</h3>
 <p>Checks if the surface can fit inside a specific region, its rigth and bottom positions are calculated automatically.</p>
 <br>
<h3>Gamemaker's/Custom methods</h3>
<p>You can assign any kind of function as a destroy method, the surface will be freed if the method returns true.</p>

<hr>

# SLAP METHODS

<p>Slap methods let you apply things to a Surf right after it's created, this is useful for surfaces that are mostly static.
<br>
However, because of how surfaces work, it's recommended to only use it on surfaces with non moving elements, so be mindful about that.
</p>

<br>

# ABOUT AND CREDITS
Surfs is licensed under the <a href="https://github.com/ElectroDev1/Surfs/blob/main/LICENSE.md">MIT license</a>
<br><br>
Surfs made by <a href="https://github.com/ElectroDev1">Electro</a>
