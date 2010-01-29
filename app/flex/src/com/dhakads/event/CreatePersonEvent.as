package com.dhakads.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.model.Person;

	public class CreatePersonEvent extends CairngormEvent
	{
		public static const CREATE_PERSON:String = "createPerson";
		private var _person:Person;

		public function CreatePersonEvent(person:Person)
		{
			super(CREATE_PERSON);
			this._person = person;
		}
		
		public function get person():Person {
			return _person;
		}
	}
}