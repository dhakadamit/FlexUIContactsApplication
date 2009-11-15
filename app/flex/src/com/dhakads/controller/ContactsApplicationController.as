package com.dhakads.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.dhakads.command.ChangePageCommand;
	import com.dhakads.event.PageChangeEvent;

	public class ContactsApplicationController extends FrontController
	{
		public function ContactsApplicationController()
		{
			initialiseCommands();
		}
		
		public function initialiseCommands():void {
			addCommand(PageChangeEvent.PAGE_CHANGE_EVENT, ChangePageCommand);
		}
		
	}
}