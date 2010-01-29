package com.dhakads.model.builders
{
	import com.dhakads.model.Business;
	import com.dhakads.model.ContactDetail;
	
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
		
		public function build(name:String, description:String, contactDetail:ContactDetail):Business{
			var business:Business = new Business();
			business.name = name;
			business.description = description;
			business.contactDetail = contactDetail;
			return business;
		}
		
		public function convertToJson(business:Business):String {
			var json:String = "{" + 
						      	"name:" + business.name + ", "
							  	"description:" + business.description + ", "
								new ContactDetailBuilder().convertToJson(business.contactDetail) +
							  "}";
								
			return json;					  		
		}

	}
}