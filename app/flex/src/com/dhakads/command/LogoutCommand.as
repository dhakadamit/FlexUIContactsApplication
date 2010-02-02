package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.SessionDelegate;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.Pages;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class LogoutCommand implements ICommand, IResponder
	{
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var sessionDelegate:SessionDelegate = new SessionDelegate(this);
			sessionDelegate.destroy();
		}
		
		public function result(data:Object):void
		{
			this.model.isLoggedIn = false;
			this.model.currentPage = Pages.HOME_PAGE;
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}