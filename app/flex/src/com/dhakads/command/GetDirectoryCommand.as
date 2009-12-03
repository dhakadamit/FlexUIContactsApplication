package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.model.ContactsApplicationModelLocator;
	
	import mx.rpc.IResponder;

	public class GetDirectoryCommand implements ICommand, IResponder
	{
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function GetDirectoryCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var directoryDelegate:DirectoryDelegate = new DirectoryDelegate(this); 
//			this.model.people = new ArrayCollection();
//			this.model.people.addItem({name:"amit", area:"mumbai", profession:"IT"});	
//			this.model.people.addItem({name:"dhakad", area:"mumbai", profession:"IT"});
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}