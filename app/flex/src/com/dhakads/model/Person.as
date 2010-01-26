package com.dhakads.model
{
	public class Person
	{
		private var _firstName:String;
		private var _lastName:String;
		
		public function Person(firstName:String, lastName:String)
		{			
			this._firstName = firstName;
			this._lastName = lastName;
		}
		
		public function get firstName():String {
			return this._firstName;
		}
		
		public function get lastName():String {
			return this._lastName;
		}
		
		public function set firstName(value:String):void {
			this._firstName = value;
		}
		
		public function set lastName(value:String):void {
			this._lastName = value;
		}
		
		public static function constructFromObject(object:Object):Person {
			var person:Person = new Person(object.person.first_name, object.person.last_name);
			return person;
		}

	}
}