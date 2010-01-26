package com.dhakads.model
{
	public class Area
	{
		public static const SANTACRUZ:Area = new Area("Santacruz");		
		
		private static var _allDefinedEnums:ArrayCollection = new ArrayCollection();
		private var _name:String;
		
		public function Area(name:String)
		{
			this._name = name;
			Area._allDefinedEnums.addItem(this);
		}
		
		public function get name():String {
			return this._name;
		}
		
		public function getInstance(value:String):Enum {
			var Area:Area;
			for(i:int = 0; i < _allDefinedEnums.length ; i++) {
				Area = Area (Area.allDefinedEnums.getItemAt(0));
				if(Area.name == value) return Area;
			}
		}
		
		private static function get allDefinedEnums():ArrayCollection {
			return Area._allDefinedEnums;
		}

	}
}