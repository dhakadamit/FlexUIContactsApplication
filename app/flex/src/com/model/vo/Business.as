package com.model.vo
{
	[Bindable]
	public class Business
	{
		private var name : String;
		private var contactDetail : ContactDetail;
		
		public function Business()
		{
			name = new String();
			contactDetail = new ContactDetail();
		}

	}
}