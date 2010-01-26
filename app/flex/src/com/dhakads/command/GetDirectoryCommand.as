package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSONDecoder;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.Person;
	
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
			var json:String = "{\"person\":{\"first_name\":\"amit\",\"last_name\":\"kanhaiyalal\"}}";
			var decoder:JSONDecoder = new JSONDecoder(json);
			var person:Person = Person.constructFromObject(decoder.getValue());
//			Alert.show(person.);
//			var people:ArrayCollection = new ArrayCollection(decoder.getValue());			
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}