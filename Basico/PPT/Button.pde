/*********************************************************************************************************
**********************************************************************************************************

					     					 Button.pde		
				      
					   					 	Processing Code  
							   By Miguelo A. Ruiz (2015).Visit: miguelo.me	
		 			  Creative Commons Attribution-ShareAlike4.0 Internacional License
			 
**********************************************************************************************************

 		Descripcion: Clase para botones.
			 
***********************************************************************************************************
**********************************************************************************************************/
 
class Boton { 
  
  PImage[] buttonImgs = new PImage[3];
  int x, y;
  int d;
  int index = 0;

  Boton(int posx, int posy, int diametro) {  
    x = posx; 
    y = posy; 
    d = diametro;
  } 

  void loadImages( PImage[] arrayImgs ){
  	buttonImgs[0] = arrayImgs[0];
    buttonImgs[1] = arrayImgs[1];
    buttonImgs[2] = arrayImgs[2];
  }

  int bottonDraw() { 

  	int r = int(dist(x, y, mouseX, mouseY));  

    if( r < d/2){
    	if (mousePressed) {
    		index = 2;
    	}else {
    		index = 1;
    	}
    }else {
    	index = 0;
    }

  	pushMatrix();
    imageMode(CENTER);
  	image(buttonImgs[index], x, y, d, d);
  	popMatrix();

  	return index;

  } 
}
