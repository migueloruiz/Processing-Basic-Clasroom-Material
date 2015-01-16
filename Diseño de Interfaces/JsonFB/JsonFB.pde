/*********************************************************************************************************
**********************************************************************************************************

				     					 JsonFB.pde		
			      
				   					 	Processing Code  
						   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
	 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion: Ejercicio basico de JSON, con ayuda del facebook graph.
			 
***********************************************************************************************************
 		This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
 		International License. To view a copy of this license, visit: 
 		http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/
 

JSONObject jsonPage, jsonCover;
PImage photo;
int id ;
String web, fblink, about,name, category, description ;

/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Función de configuración. 
 ******************************************************************************************************/
 void setup(){
 	size(400, 550);
 	background(256);
	  jsonPage = loadJSONObject("https://graph.facebook.com/cocacola");
	  jsonCover = jsonPage.getJSONObject("cover");
	  photo = loadImage(jsonCover.getString("source"),"jpg");
	  name = jsonPage.getString("name");
	  web = jsonPage.getString("website");
	  fblink = jsonPage.getString("link");
	  about = jsonPage.getString("about");
	  category = jsonPage.getString("category");
	  description = jsonPage.getString("description");
	  textAlign(CENTER);
 }

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/
void draw(){
	background(0);
	image(photo, 0, 0, 400, 150);
	text(name, 200, 200);
	text("Categoria: "+ category , 200, 220);
	text("Web :" + web, 200, 240);
	text("Facebook :" + fblink, 200, 260);
	text(about, 30, 280, 350, 200);
	text(description, 30, 320, 350, 200);
}

