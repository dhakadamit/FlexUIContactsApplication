package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSON;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.business.FaultHandler;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.builders.PeopleBuilder;
	
	import mx.rpc.IResponder;

	public class GetDirectoryCommand implements ICommand, IResponder
	{
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function GetDirectoryCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var getDirectoryEvent:GetDirectoryEvent = GetDirectoryEvent (event);
			var directoryDelegate:DirectoryDelegate = new DirectoryDelegate(this);
			directoryDelegate.getDirectory(getDirectoryEvent.pageNumber, getDirectoryEvent.alphabet); 
		}
		
		public function result(data:Object):void
		{
			var decodedValue:Object = JSON.decode(data.result);
			model.people = new PeopleBuilder().build(JSON.decode(decodedValue.people) as Array);
			model.totalCount = JSON.decode(decodedValue.total_count);
		}
		
		public function fault(info:Object):void
		{
				new FaultHandler().loginRequired();
		}
		
	}
}