package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.CreatePersonDelegate;
	import com.dhakads.event.CreatePersonEvent;
	
	import mx.rpc.IResponder;

	public class CreatePersonCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var createPersonEvent:CreatePersonEvent = CreatePersonEvent (event);
			var createPersonDelegate:CreatePersonDelegate = CreatePersonDelegate (event);
			createPersonDelegate.create(createPersonEvent.person);
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}