package com.dhakads.model.builders
{
	import com.dhakads.model.ContactDetail;
	
	import mx.collections.ArrayCollection;
	
	public class ContactDetailBuilder
	{

		public function buildFromJson(object:Object):ContactDetail{
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
		
		public function build(streetAddress:String, area:String, city:String,
							  state:String, pincode:Number,
							  phoneNumbers:ArrayCollection):ContactDetail{
			var contactDetail:ContactDetail = new ContactDetail();
			contactDetail.streetAddress = streetAddress;
			contactDetail.area = area;
			contactDetail.city = city;
			contactDetail.state = state;
			contactDetail.pincode = pincode;
			contactDetail.phoneNumbers = phoneNumbers;
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