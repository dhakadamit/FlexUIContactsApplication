package skins{ // Use unnamed package if this skin is not in its own package.
  // skins/ButtonStatesSkin.as
  // Import necessary classes here.
  import flash.display.Graphics;
  
  import mx.skins.ProgrammaticSkin;
  public class TabNavigatorTabSkin extends ProgrammaticSkin {
     public var backgroundFillColor:Number;
	 public var new_width:Number;
	 public var new_height:Number;
	 public var xpos:Number;
	 public var ypos:Number;
	      
     // Constructor.
     public function TabNavigatorTabSkin() {
     	new_width = 100;
     	new_height = 40;
     	xpos = 0;
     	ypos = 0;
     }
     override protected function updateDisplayList(w:Number, h:Number):void {
        // Depending on the skin's current name, set values for this skin.
        switch (name) {
           
           case "upSkin":
           	setDisabledState();
            break;
                    
           case "overSkin":
            setOverState();
            break;           
           
           case "disabledSkin":
            setDisabledState();
            break;
             
		   case "selectedUpSkin":
           	setSelectedState();
            break;
           
           case "selectedOverSkin":
            setSelectedState();
            break;
                 
        }
        
        // Draw the box using the new values.
        
        var g:Graphics = graphics;
        g.clear();
        g.beginFill(backgroundFillColor,1.0);
        g.drawRoundRect(xpos, ypos, new_width, new_height, 30);
        g.beginFill(backgroundFillColor,1.0);
        g.drawRect(xpos+30, ypos, new_width-32, new_height);
        g.beginFill(0x3274d0,1.0);
        g.drawRect(100-4, ypos, 4, new_height);
        g.endFill();        
     }
     
     private function setDisabledState(): void {
 	    backgroundFillColor = 0x3274d0;
 	    new_width = 100;
 	    new_height = 40;
 	    xpos = 0;
 	    ypos = 0;
     }
     
     private function setSelectedState(): void {
        backgroundFillColor = 0x013e7d;
        new_width = 150;
 	    new_height = 40;
 	    xpos = -50;
 	    ypos = 0;
     }
     
     private function setOverState(): void {
        backgroundFillColor = 0x013e7d;
        new_width = 100;
 	    new_height = 40;
 	    xpos = 0;
 	    ypos = 0;
     }
  }
} // Close unnamed package.