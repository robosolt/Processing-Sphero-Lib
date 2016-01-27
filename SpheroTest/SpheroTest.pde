////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Written by Oscar ter Hofstede
//  Created on 24 May 2014
//
////////////////////////////////////////////////////////////////////////////////////////////////////

import processing.serial.*;

Sphero sphero;

/////////////////////////////////////////////////


void setup()
{
    frameRate (50);
    size(200, 200);
    
    sphero = new Sphero (this, Serial.list()[0]);
    sphero.Stop();
}


/////////////////////////////////////////////////

int demo = 0;
int heading = 0;
int backLED = 0;


void draw()
{
    sphero.Update();
    
    if (sphero.mLevel1Diagnostics != null)
    {
        println ("\n" + sphero.mLevel1Diagnostics + "\n");
        sphero.mLevel1Diagnostics = "";
    }
    
    switch (demo)
    {
        case 1:
            sphero.setRGBLED ((int)random(0,255), (int)random(0,255), (int)random(0,255));
            delay (200);
            break;
        
        case 2:
            backLED = 255 - backLED;
            sphero.setBackLED (backLED);
            demo = 0;
            break;
        
        case 3:
            sphero.SpinLeft (1000);
            demo = 0;
            break;
        
        case 4:
            sphero.SpinRight (255);
            demo = 0;
            break;
        
        case 5:
            sphero.setStabilization (true);
            sphero.setRoll (heading, 20, 1);
            heading = (heading + 60) % 360;
            delay (1000);
            break;
        
        case 6:
            sphero.mLevel1Diagnostics = null;
            sphero.getLevel1Diagnostics();
            
            while (sphero.mLevel1Diagnostics == null) {
                delay (100);
                sphero.Update();
            }
            
            println ("\n" + sphero.mLevel1Diagnostics + "\n");
            sphero.mLevel1Diagnostics = null;
            
            demo = 0;
            break;
    }
}


/////////////////////////////////////////////////


void keyPressed()
{
    switch (key)
    {
        case ' ': demo = 0; sphero.Stop(); break;
        case 's': demo = 0; sphero.Sleep(); break;
        
        default:
        {
            if (key >= '0' && key <= '9')
                demo = key - '0';
        }
    }
}


void exit()
{
  if (sphero != null)
      sphero.Finalize();
}


