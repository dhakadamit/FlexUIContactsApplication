package com.dhakads.model.builders
{
	import com.dhakads.model.Person;
	
	public class PersonBuilder
	{
		public function build(object:Object):Person{
			var person:Person = new Person();
			person.firstName = object.first_name;
			person.lastName = object.last_name;
			person.middleName = object.middle_name;
			person.education = object.education;
			person.sex = object.sex;
			person.dob = object.dob;
			person.contactDetail = object.contact_detail;
			person.father = object.father;
			person.mother = object.mother;
			person.businesses = object.businesses;
			return person;
		}

		
	}
}