package skins{ // Use unnamed package if this skin is not in its own package.
  // skins/ButtonStatesSkin.as
  // Import necessary classes here.
  import flash.display.Graphics;
  
  import mx.skins.ProgrammaticSkin;
  public class ProfileDetailsControlBarSkin extends ProgrammaticSkin {
     public var backgroundFillColor:Number;
     public var borderColor:Number;
     public var borderLineThickness:Number;
     
     // Constructor.
     public function ProfileDetailsControlBarSkin() {
        // Set default values.
        backgroundFillColor = 0x013e7d;
        borderLineThickness = 2;
        borderColor = 0x013e7d;
     }
     override protected function updateDisplayList(w:Number, h:Number):void {
        // Depending on the skin's current name, set values for this skin.
        switch (name) {
           
           case "upSkin":
           	setDisabledState();
            break;
           
           case "downSkin" :
            setDisabledState();
            break;
                
           case "overSkin":
            setRollOverState();
            break;
             
		   case "selectedUpSkin":
           	setSelectedState();
            break;
      
           case "selectedOverSkin":
            setSelectedState();
            break;
            
           case "selectedDownSkin" :
            setSelectedState();
            break; 
        }
        
        // Draw the box using the new values.
        
        var g:Graphics = graphics;
        g.clear();
        g.beginFill(backgroundFillColor,1.0);
        g.lineStyle(borderLineThickness, borderColor);
        g.drawRoundRect(0, 0, w, h, 10);
        g.endFill();
     }
     
     private function setDisabledState(): void {
 	    borderLineThickness = 2;
        backgroundFillColor = 0xC6C8C3;
        borderColor = 0xC6C8C3;
     }
     
     private function setRollOverState(): void {
 	    borderLineThickness = 2;
        backgroundFillColor = 0x565656;
        borderColor = 0x565656;
     }
     
     private function setSelectedState(): void {
       borderLineThickness = 2;
       backgroundFillColor = 0x013e7d;
       borderColor = 0x013e7d;
     }
  }
} // Close unnamed package.