package com.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.command.GetPeopleDetailsCommand;
	import com.event.GetDirectoryEvent;

	public class FamilyTreeController extends FrontController
	{
		public function FamilyTreeController()
		{
			initializeCommands();
		}
		
		public function initializeCommands() : void{
			addCommand(GetDirectoryEvent.EVENT_GET_PEOPLE_DETAILS, GetPeopleDetailsCommand);
		}
		
		
	}
}