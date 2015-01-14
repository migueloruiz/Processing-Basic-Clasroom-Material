import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import grafica.*; 
import de.bezier.data.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class GraficadorExel extends PApplet {


/*********************************************************************************************************
**********************************************************************************************************

                                             Graficador.pde   
                                  
                                            Processing Code  
                               By Miguelo A. Ruiz (2015).Visit: miguelo.me  
                        Creative Commons Attribution-ShareAlike4.0 Internacional License
       
**********************************************************************************************************

    Descripcion:Ejercicio basico para graficar un sensor usando la libreria grafica by Javier Graci\u00e1 Carpio
       
***********************************************************************************************************
    This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 
    International License. To view a copy of this license, visit: 
    http://creativecommons.org/licenses/by-nc-sa/4.0/.
**********************************************************************************************************
**********************************************************************************************************/




XlsReader reader;


int maxPoints = 26;
GPointsArray points; 
GPlot plot = new GPlot(this);
int index = 0;



/******************************************************************************************************
 *  Nombre:      Setup
 *  Retornos:    Nada
 *  Parametros:  Nada
 *  Descripcion: Funci\u00f3n de configuraci\u00f3n. 
 ******************************************************************************************************/
public void setup() {
  size(500, 350);
  background(150);

  points = new GPointsArray(maxPoints);
  reader = new XlsReader( this, "puntos.xls" );

  reader.firstRow();

  plot.setPos(0, 0);
  plot.setDim(400, 250);
  plot.setXLim(0, 25);
  plot.setYLim(0, 700);

  plot.setTitleText("Grafica Exel");
  plot.getYAxis().setAxisLabelText("Eje Y");
  plot.getXAxis().setAxisLabelText("Eje X");

  reader.firstRow();

  int index = 0;
  while ( reader.hasMoreRows() )    // loop thru rows
    {
      reader.nextRow();
      float x = reader.getFloat();
      reader.nextCell();
      float y = reader.getFloat();
      points.add(index ,x, y);
      index++;

    }

}

/******************************************************************************************************
 *  Nombre:      Loop
 *  Retorna:     Nada
 *  Parametros:  Nada
 *  Descripcion: Loop general.
 ******************************************************************************************************/

public void draw(){
  background(255);

  plot.setPoints(points);
  plot.defaultDraw();
}




  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "GraficadorExel" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
