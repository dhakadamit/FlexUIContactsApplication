package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.event.PageChangeEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	
	public class ChangePageCommand implements ICommand
	{
		[Bindable]
		public var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function ChangePageCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var pageChangeEvent:PageChangeEvent = PageChangeEvent (event);
			this.model.currentPage = pageChangeEvent.pageNumber;
		}	
	}
}