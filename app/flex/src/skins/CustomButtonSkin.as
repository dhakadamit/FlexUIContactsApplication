package skins{ 
	
  import flash.display.Graphics;
  
  import mx.skins.ProgrammaticSkin;
  
  public class CustomButtonSkin extends ProgrammaticSkin {
     public var backgroundFillColor:Number;
     public var borderColor:Number;
     public var borderLineThickness:Number;
     public var cornerRadius:Number;
     
     public function CustomButtonSkin() {
        backgroundFillColor = 0x013e7d;
        borderLineThickness = 2;
        borderColor = 0x013e7d;
        cornerRadius = 10;
     }
     
     override protected function updateDisplayList(w:Number, h:Number):void {
     	var fillColors:Array = getStyle("fillColors");
     	borderLineThickness = getStyle("borderThickness");
     	cornerRadius = getStyle("cornerRadius");
     	borderColor = getStyle("borderColor");

        switch (name) {
           
           case "upSkin":
           	setDisabledState(fillColors);
            break;
           
           case "downSkin":
            setDisabledState(fillColors);
            break;
           
           
           case "overSkin":
            setSelectedState(fillColors);
            break;
           
           
           case "disabledSkin":
            setDisabledState(fillColors);
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
        
        var g:Graphics = graphics;
        g.clear();
        g.beginFill(backgroundFillColor,1.0);
        g.lineStyle(borderLineThickness, borderColor);
        g.drawRoundRect(0, 0, w, h, cornerRadius);
        g.endFill();
     }
     
     private function setDisabledState(fillColors:Array): void {
 	    backgroundFillColor = fillColors[1];
     }
     
     private function setSelectedState(fillColors:Array): void {
       backgroundFillColor = fillColors[0];
     }
  }
} // Close unnamed package.