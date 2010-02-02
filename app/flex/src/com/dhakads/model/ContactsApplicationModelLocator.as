package com.dhakads.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ContactsApplicationModelLocator implements ModelLocator
	{   
		private static var modelLocator:ContactsApplicationModelLocator;
		public var currentPage:Number = Pages.DIRECTORY_PAGE;
		public var isLoggedIn:Boolean = false;
		public var serverError:String; 
		public var people:ArrayCollection;

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
				
	}
}