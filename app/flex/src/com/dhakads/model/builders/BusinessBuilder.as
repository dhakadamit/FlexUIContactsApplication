package com.dhakads.model.builders
{
	import com.dhakads.model.Business;
	
	public class BusinessBuilder
	{
		public function buildFromJson(object:Object):Business{
			if(object == null) {
				return new Business();
			}
			
			var business:Business = new Business();
			business.name = object.name;
			business.description = object.description;
			business.contactDetail = new ContactDetailBuilder().buildFromJson(object.contactDetail);
			return business;
		}
	}
}