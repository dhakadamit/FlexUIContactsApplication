package com.dhakads.model.builders
{
	import com.dhakads.model.ContactDetail;
	
	import mx.collections.ArrayCollection;
	
	public class ContactDetailBuilder
	{

		public function build(object:Object):ContactDetail{
			if(object == null) {
				return new ContactDetail();
			}
			
			var contactDetail:ContactDetail = new ContactDetail();
			contactDetail.streetAddress = object.street_address;
			contactDetail.area = object.area;
			contactDetail.city = object.city;
			contactDetail.state = object.state;
			contactDetail.pincode = object.pincode;
			contactDetail.phoneNumbers = buildPhoneNumbers(object.phone_numbers as Array)
			return contactDetail;
		}
		
		private function buildPhoneNumbers(array:Array):ArrayCollection {
			if(array == null) {
				return new ArrayCollection();
			}
			
			var phoneNumbers:ArrayCollection = new ArrayCollection();
			for(var i:int = 0 ; i<array.length ; i++) {
				phoneNumbers.addItem(array[i].number);
			}
			return phoneNumbers;
		}
		
	}
}