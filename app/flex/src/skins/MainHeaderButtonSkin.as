package skins{ // Use unnamed package if this skin is not in its own package.
  // skins/ButtonStatesSkin.as
  // Import necessary classes here.
  import flash.display.Graphics;
  
  import mx.skins.ProgrammaticSkin;
  public class MainHeaderButtonSkin extends ProgrammaticSkin {
     public var backgroundFillColor:Number;
     public var borderColor:Number;
     public var borderLineThickness:Number;
     public var textColor:Number;
     
     // Constructor.
     public function MainHeaderButtonSkin() {
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
           
           case "downSkin":
            setDisabledState();
            break;
           
           
           case "overSkin":
            setSelectedState();
            break;
           
           
           case "disabledSkin":
            setDisabledState();
            break;
           
             
//		   case "selectedUpSkin":
//           	setSelectedState();
//            break;
//           
//           case "selectedDownSkin":
//            setSelectedState();
//            break;
//           
//           case "selectedOverSkin":
//            setSelectedState();
//            break;
//           
//           case "selectedDisabledSkin":
//            setSelectedState();
//            break; 
//                 
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
        backgroundFillColor = 0x013e7d;
     }
     
     private function setSelectedState(): void {
       borderLineThickness = 2;
       backgroundFillColor = 0xFFFFFF;
     }
     
     private function setFocusState(): void {
       borderLineThickness = 3;
       borderColor = 0x013e7d;
       backgroundFillColor = 0xFFFFFF;
     }
  }
} // Close unnamed package.