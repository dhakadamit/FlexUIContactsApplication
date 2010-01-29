package com.dhakads.model.builders
{
	import com.dhakads.model.ContactDetail;
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
			person.dob = object.dob;
			person.contactDetail = new ContactDetailBuilder().buildFromJson(object.contact_detail);
			person.father = new PersonBuilder().buildFromJson(object.father);
			person.mother = new PersonBuilder().buildFromJson(object.mother);
			person.businesses = buildBusinesses(object.businesses as Array);
			return person;
		}
		
		public function build(firstName:String, middleName:String, sex:String, dob:String,
							  contactDetail:ContactDetail, father:Person, mother:Person,
							  businesses:ArrayCollection, education:String,
							  lastName:String = "Dhakad"):Person{
			var person:Person = new Person();
			person.firstName = firstName;
			person.lastName = lastName;
			person.middleName = middleName;
			person.education = education;
			person.sex = sex;
			person.dob = dob;
			person.contactDetail = contactDetail;
			person.father = father;
			person.mother = mother;
			person.businesses = businesses;
			return person;
		}
		
		public function convertToJson(person:Person):String {
			var json:String = "{person:{" + 
									"mother_id:" + person.father.id;
									"father_id:" + person.mother.id;
									"dob:" + person.dob;
									"sex:" + person.sex;
									"first_name:" + person.firstName;
									"last_name:" + person.lastName;
									"middle_name:" + person.middleName;
									"education:" + person.education;
									convertBusinessesToJson(person.businesses) +
									new ContactDetailBuilder().convertToJson(person.contactDetail) + 
								"}";
			return json;
		}
		
		private function convertBusinessesToJson(businesses:ArrayCollection):String {
			var builder:BusinessBuilder = new BusinessBuilder();
			var json:String = "businesses:[";
			
			for(var i:int=0; i<(businesses.length-1) ; i++) {
				json += builder.convertToJson(businesses[i]) + ", ";
			}
			 
			json += builder.convertToJson(businesses[i]);
			json += "]";
			return json;
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