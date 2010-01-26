package com.dhakads.model
{
	public class State
	{
		public static const MAHARASHTRA:State = new State("Maharashtra");		
		
		private static var _allDefinedEnums:ArrayCollection = new ArrayCollection();
		private var _name:String;
		
		public function State(name:String)
		{
			this._name = name;
			State._allDefinedEnums.addItem(this);
		}
		
		public function get name():String {
			return this._name;
		}
		
		public function getInstance(value:String):Enum {
			var State:State;
			for(i:int = 0; i < _allDefinedEnums.length ; i++) {
				State = State (State.allDefinedEnums.getItemAt(0));
				if(State.name == value) return State;
			}
		}
		
		private static function get allDefinedEnums():ArrayCollection {
			return State._allDefinedEnums;
		}

	}
}