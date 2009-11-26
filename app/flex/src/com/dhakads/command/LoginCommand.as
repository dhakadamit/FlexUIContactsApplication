package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.business.SessionDelegate;
	import com.dhakads.event.LoginEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class LoginCommand implements ICommand, IResponder
	{
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
			ContactsApplication.debug("Result: " + data.toString());
			Alert.show(data.result.toString());
		}
		
		public function fault(data:Object):void {
			ContactsApplication.debug("CreateSessionCommand#fault: " + data);
            Alert.show("Login Failed", "Error");
		}
		
	}
}