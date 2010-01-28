package com.dhakads.model.builders
{
	import com.dhakads.model.Person;
	
	import mx.collections.ArrayCollection;
	
	public class PersonBuilder
	{
		public function buildFromJson(object:Object):Person{
			if(object == null) {
				return new Person();
			}
			
			var person:Person = new Person();
			person.firstName = object.first_name;
			person.lastName = object.last_name;
			person.middleName = object.middle_name;
			person.education = object.education;
			person.sex = object.sex;
			person.dob = object.dob as Date;
			person.contactDetail = new ContactDetailBuilder().buildFromJson(object.contact_detail);
			person.father = new PersonBuilder().buildFromJson(object.father);
			person.mother = new PersonBuilder().buildFromJson(object.mother);
			person.businesses = buildBusinesses(object.businesses as Array);
			return person;
		}
		
		private function buildBusinesses(businessesArray:Array):ArrayCollection {
			if(businessesArray == null) {
				return new ArrayCollection();
			}
			
			var businesses:ArrayCollection = new ArrayCollection();
			for(var i:int=0 ; i < businessesArray.length ; i++) {
				businesses.addItem(new BusinessBuilder().buildFromJson(businessesArray[i]));
			}
			return businesses;
		}

		
	}
}