package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.SessionDelegate;
	import com.dhakads.event.LoginEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.Pages;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class LoginCommand implements ICommand, IResponder
	{
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function LoginCommand()
		{
		}

		public function execute(event:CairngormEvent):void
		{
			var loginEvent:LoginEvent = LoginEvent (event);
			var sessionDelegate:SessionDelegate = new SessionDelegate(this);
			sessionDelegate.create(loginEvent.username, loginEvent.password);			
		}
		
		public function result(data:Object):void {
			this.model.pageToView = Pages.DIRECTORY_PAGE;
		}
		
		public function fault(data:Object):void {
			var statusCode:Number = data.statusCode;
			if(statusCode == 401) {
				model.serverError = "Invalid username or password. Please try again.";
				return;
			}
			model.serverError = "We have encountered an error. Sorry for the inconvenience. Please try again after some time.";
		}
		
	}
}