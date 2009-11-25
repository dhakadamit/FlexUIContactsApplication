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
           	setDisabledState(fillColors[1]);
            break;
           
           case "downSkin":
            setDisabledState(fillColors[1]);
            break;
           
           
           case "overSkin":
            setSelectedState(fillColors[0]);
            break;
           
           
           case "disabledSkin":
            setDisabledState(fillColors[1]);
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
     
     private function setDisabledState(fillColor:String): void {
 	    backgroundFillColor = fillColor;
     }
     
     private function setSelectedState(fillColor:String): void {
       backgroundFillColor = fillColor;
     }
  }
} // Close unnamed package.