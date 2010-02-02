package com.dhakads.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.dhakads.dev.DebugMessage;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ContactsApplicationModelLocator implements ModelLocator
	{   
		private static var modelLocator:ContactsApplicationModelLocator;
		private static const LOGIN:String = "Login";
		private static const LOGOUT:String = "Logout";
		private var _isLoggedIn:Boolean = false;
		
		public var currentPage:Number = Pages.HOME_PAGE;
		public var serverError:String; 
		public var people:ArrayCollection;
		public var buttonsInMainControlBar:ArrayCollection = new ArrayCollection([LOGIN, "Directory"]);

        public static function getInstance():ContactsApplicationModelLocator{
            if (modelLocator == null) {
                modelLocator = new ContactsApplicationModelLocator();
            }
            return modelLocator;
        }

		public function ContactsApplicationModelLocator()
		{
			if (modelLocator != null) {
                throw new Error("Only one PomodoModelLocator instance may be instantiated.");
            }
		}
		
		public function set isLoggedIn(value:Boolean):void {
			this._isLoggedIn = value;
			updateButtonsInMainControlBar();
		}
		
		private function updateButtonsInMainControlBar():void {
			if(this._isLoggedIn) {
				buttonsInMainControlBar.setItemAt(LOGOUT, 0);			
			} 
			else {
				buttonsInMainControlBar.setItemAt(LOGIN, 0);
			}
		}
		
		public function get isLoggedIn():Boolean {
			return _isLoggedIn;
		}
				
	}
}