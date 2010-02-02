package com.dhakads.business
{
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.Pages;
	
	public class FaultHandler
	{
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function loginRequired():void {
			this.model.currentPage = Pages.HOME_PAGE;
		}
	}
}