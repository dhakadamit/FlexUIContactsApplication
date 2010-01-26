package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	
	import mx.controls.Alert;
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
			var data:Object = data;
			Alert.show(data.result);
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}