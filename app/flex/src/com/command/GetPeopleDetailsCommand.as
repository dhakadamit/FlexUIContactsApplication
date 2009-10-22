package com.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.business.GetPeopleDetailsDelegate;
	import com.event.GetDirectoryEvent;
	import com.model.FamilyTreeModelLocator;
	
	import mx.rpc.IResponder;

	public class GetPeopleDetailsCommand implements ICommand, IResponder
	{
		private var modelLocator : FamilyTreeModelLocator = FamilyTreeModelLocator.getInstance();
		
		public function GetPeopleDetailsCommand()
		{
		}

		public function execute( event : CairngormEvent ):void
		{
			var getDirectoryEvent : GetDirectoryEvent = GetDirectoryEvent (event);
			var getPeopleDetailsDelegate : GetPeopleDetailsDelegate = new GetPeopleDetailsDelegate(this);
			getPeopleDetailsDelegate.execute();
		}
		
		public function result( object : Object) : void {
			modelLocator.people.details = XML (object);	
		}
		
		public function fault( object : Object ) : void {
			
		}
				
	}
}