package com.dhakads.business
{
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.enums.Pages;
	
	public class FaultHandler
	{
		[Bindable]
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		
		public function loginRequired():void {
			this.model.currentPage = Pages.HOME_PAGE;
		}
	}
}