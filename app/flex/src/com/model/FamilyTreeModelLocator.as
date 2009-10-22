package com.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.model.People;
	import com.model.vo.Person;
	
	[Bindable]
	public class FamilyTreeModelLocator implements ModelLocator
	{
		private static var modelLocator : FamilyTreeModelLocator;
		
		public var person : Person;
		public var people : People;
		
		
      	public static function getInstance() : FamilyTreeModelLocator
	      {
	      	if ( modelLocator == null )
	      	{
	      		modelLocator = new FamilyTreeModelLocator();
	      	}
	      		
	      	return modelLocator;
	      }
      
	      
        public function FamilyTreeModelLocator() 
	      {	
	        if ( modelLocator != null )
	        {
	        	throw new Error( "Only one FamilyTreeModelLocator instance should be instantiated" );	
	        }
	        
	        person = new Person();
	        people = new People();
	        
	      }
	}
}