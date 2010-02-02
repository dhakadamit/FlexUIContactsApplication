package com.dhakads.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.dhakads.command.PageChangeCommand;
	import com.dhakads.command.CreatePersonCommand;
	import com.dhakads.command.GetDirectoryCommand;
	import com.dhakads.command.GetPersonDetailsCommand;
	import com.dhakads.command.LoginCommand;
	import com.dhakads.command.LogoutCommand;
	import com.dhakads.command.SearchCommand;
	import com.dhakads.event.CreatePersonEvent;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.event.GetPersonDetailsEvent;
	import com.dhakads.event.LoginEvent;
	import com.dhakads.event.LogoutEvent;
	import com.dhakads.event.PageChangeEvent;
	import com.dhakads.event.SearchEvent;

	public class ContactsApplicationController extends FrontController
	{
		public function ContactsApplicationController()
		{
			initialiseCommands();
		}
		
		public function initialiseCommands():void {
			addCommand(PageChangeEvent.PAGE_CHANGE_EVENT, PageChangeCommand);
			addCommand(LoginEvent.LOGIN_EVENT, LoginCommand);
			addCommand(LogoutEvent.LOGOUT_EVENT, LogoutCommand);
			addCommand(GetDirectoryEvent.GET_DIRECTORY_EVENT, GetDirectoryCommand);
			addCommand(SearchEvent.SEARCH_EVENT, SearchCommand);
			addCommand(GetPersonDetailsEvent.GET_PERSON_DETAILS, GetPersonDetailsCommand);
			addCommand(CreatePersonEvent.CREATE_PERSON, CreatePersonCommand);
		}
		
	}
}