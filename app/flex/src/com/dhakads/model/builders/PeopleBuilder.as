package com.dhakads.model.builders
{
	import mx.collections.ArrayCollection;
	
	public class PeopleBuilder
	{
		public function build(personArray:Array):ArrayCollection {
			if(personArray == null) {
				return new ArrayCollection();
			}
			
			var people:ArrayCollection = new ArrayCollection();
			var personBuilder:PersonBuilder = new PersonBuilder();
			for(var i:int=0 ; i<personArray.length ; i++) {
				people.addItem(personBuilder.build(personArray[i].person));
			}
			return people;
		}
	}
}