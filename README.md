<h1 align="center">SURFS</h1>
<p align="center" >
  A library for Gamemaker v2022.5+ that makes using surfaces easier than ever
 </p>
 <h2 align="center"><a href="https://github.com/ElectroDev1/Surfs/releases/tag/v1.0.0">Download the yymps </a></h2>
 
 <hr>
 
 # WHAT IS SURFS
 <p>
  Surfs is a library made for Gamemaker v2022.5+ that handles all the boring and monotonous parts of using surfaces in Gamemaker, with only a few functions and no need
  to use multiple events.
  <br><br>
  Here's what the library can do:
  <br>
  
  * Handle the creation of surfaces and recreation in case they are gone in a single function
  * All surfaces are saved in a global map and can be accessed with only a string, without the need to create new variables for every surface
  * You can define when a surface will be freed from memory the moment you create it with built in or custom methods
  * Freeing surfaces from memory in the draw event won't cause memory leaks to occour
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
  You can assign the surface to a variable, but it's not necessary when using Surf's built in functions.
  <br>
  Now you can use the surface's name as a reference to use the surface itself.
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
 <h3>Surfs_debug()</h3>
 <p>Draws informations related to Surfs
</p>

<hr>

# ABOUT AND CREDITS
Holemap is licensed under the <a href="https://github.com/ElectroDev1/Surfs/blob/main/LICENSE.md">MIT license</a>
<br><br>
Surfs made by <a href="https://github.com/ElectroDev1">Electro</a>
