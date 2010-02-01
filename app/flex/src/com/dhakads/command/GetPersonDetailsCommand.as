package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSONDecoder;
	import com.dhakads.business.GetPersonDetailsDelegate;
	import com.dhakads.event.CreatePersonEvent;
	import com.dhakads.event.GetPersonDetailsEvent;
	import com.dhakads.model.Person;
	import com.dhakads.model.builders.PersonBuilder;
	
	import mx.rpc.IResponder;

	public class GetPersonDetailsCommand implements ICommand, IResponder
	{
		private var _responder:IResponder;
		
		public function execute(event:CairngormEvent):void
		{
			var getPersonDetailsEvent:GetPersonDetailsEvent = GetPersonDetailsEvent (event);
			var getPersonDetailsDelegate:GetPersonDetailsDelegate = new GetPersonDetailsDelegate(this);
			getPersonDetailsDelegate.getDetails(getPersonDetailsEvent.id);
		}
		
		public function result(data:Object):void
		{
			var decoder:JSONDecoder = new JSONDecoder(data.result);
			var person:Person = new PersonBuilder().buildFromJson(decoder.getValue().person);
			var json:String = new PersonBuilder().convertToJson(person);
			
			// testing
			new CreatePersonEvent(person).dispatch();
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}