package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSONDecoder;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.builders.PeopleBuilder;
	
	import mx.collections.ArrayCollection;
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
			directoryDelegate.getDirectory(getDirectoryEvent.alphabet, getDirectoryEvent.pageNumber); 
		}
		
		public function result(data:Object):void
		{
			var decoder:JSONDecoder = new JSONDecoder(data.result);
			var people:ArrayCollection = new PeopleBuilder().build(decoder.getValue() as Array);			
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}