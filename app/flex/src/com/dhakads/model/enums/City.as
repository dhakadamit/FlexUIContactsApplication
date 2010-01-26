package com.dhakads.model
{
	import mx.collections.ArrayCollection;
	
	public class City extends Enum
	{
		public static const MUMBAI:City = new City("Mumbai");		
		
		private static var _allDefinedEnums:ArrayCollection = new ArrayCollection();
		private var _name:String;
		
		public function City(name:String)
		{
			this._name = name;
			City._allDefinedEnums.addItem(this);
		}
		
		public function get name():String {
			return this._name;
		}
		
		public function getInstance(value:String):Enum {
			var city:City;
			for(i:int = 0; i < _allDefinedEnums.length ; i++) {
				city = City (City.allDefinedEnums.getItemAt(0));
				if(city.name == value) return city;
			}
		}
		
		private static function get allDefinedEnums():ArrayCollection {
			return City._allDefinedEnums;
		}

	}
}