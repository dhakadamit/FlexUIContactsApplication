package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.FaultHandler;
	import com.dhakads.business.PersonDelegate;
	import com.dhakads.event.CreatePersonEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class CreatePersonCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var createPersonEvent:CreatePersonEvent = CreatePersonEvent (event);
			var personDelegate:PersonDelegate = new PersonDelegate(this);
			personDelegate.create(createPersonEvent.person);
		}
		
		public function result(data:Object):void
		{
			Alert.show(data.result.toString());
		}
		
		public function fault(info:Object):void
		{
			var statusCode:Number = info.statusCode;
			if(statusCode == 401) {
				new FaultHandler().loginRequired();
			}
		}
		
	}
}