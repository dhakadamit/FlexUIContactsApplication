package com.dhakads.model
{
	import com.adobe.cairngorm.model.ModelLocator;

	[Bindable]
	public class ContactsApplicationModelLocator implements ModelLocator
	{   
		private static var modelLocator:ContactsApplicationModelLocator;
		public var pageToView:Number = Pages.HOME_PAGE;
		public var serverError:String; 


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