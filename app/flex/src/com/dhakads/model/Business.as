package com.dhakads.model
{
	public class Business
	{
		
		private var _id:Number;
		private var _name:String;
		private var _description:String;
		private var _contactDetail:ContactDetail;

		public function get id():Number {
			return _id;
		}

		public function set id(value:Number):void {
			_id = value;
		}

		public function get contactDetail():ContactDetail {
			return _contactDetail;
		}

		public function set contactDetail(value:ContactDetail):void {
			_contactDetail = value;
		}

		public function get name():String {
			return _name;
		}

		public function set name(value:String):void {
			_name = value;
		}

		public function get description():String {
			return _description;
		}

		public function set description(value:String):void {
			_description = value;
		}


	}
}