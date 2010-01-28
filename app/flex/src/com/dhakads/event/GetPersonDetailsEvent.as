package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetPersonDetailsEvent extends CairngormEvent
	{
		public static const GET_PERSON_DETAILS:String = "getPersonDetails";
		private var _id:Number;
		
		public function GetPersonDetailsEvent(id:Number) {
			super(GET_PERSON_DETAILS);
			this._id = id;
		}

		public function get id():Number {
			return _id;
		}

		public function set id(value:Number):void {
			_id = value;
		}


		
	}
}