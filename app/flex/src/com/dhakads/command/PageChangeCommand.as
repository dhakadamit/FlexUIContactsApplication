package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.event.PageChangeEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	
	public class PageChangeCommand implements ICommand
	{
		[Bindable]
		public var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function PageChangeCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var pageChangeEvent:PageChangeEvent = PageChangeEvent (event);
			this.model.currentPage = pageChangeEvent.pageNumber;
		}	
	}
}