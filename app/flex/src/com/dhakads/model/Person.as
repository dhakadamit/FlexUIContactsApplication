package com.dhakads.model
{
	import mx.collections.ArrayCollection;
	
	public class Person
	{
		
		private var _id:String;
		private var _firstName:String;
		private var _lastName:String;
		private var _middleName:String;
		private var _education:String;
		private var _sex:String;
		private var _dob:String;
		private var _contactDetail:ContactDetail;
		private var _father:Person;
		private var _mother:Person;
		private var _businesses:ArrayCollection = new ArrayCollection();

		public function get id():String {
			return _id;
		}

		public function set id(value:String):void {
			_id = value;
		}

		public function get firstName():String {
			return (_firstName == null) ? "" : _firstName;
		}

		public function set firstName(value:String):void {
			_firstName = value;
		}

		public function get lastName():String {
			return _lastName;
		}

		public function set lastName(value:String):void {
			_lastName = value;
		}

		public function get middleName():String {
			return (_middleName == null) ? "" : _middleName;
		}

		public function set middleName(value:String):void {
			_middleName = value;
		}

		public function get education():String {
			return _education;
		}

		public function set education(value:String):void {
			_education = value;
		}

		public function get sex():String {
			return _sex;
		}

		public function set sex(value:String):void {
			_sex = value;
		}

		public function get dob():String {
			return _dob;
		}

		public function set dob(value:String):void {
			_dob = value;
		}

		public function get contactDetail():ContactDetail {
			return _contactDetail;
		}

		public function set contactDetail(value:ContactDetail):void {
			_contactDetail = value;
		}

		public function get father():Person {
			return _father;
		}

		public function set father(value:Person):void {
			_father = value;
		}

		public function get mother():Person {
			return _mother;
		}

		public function set mother(value:Person):void {
			_mother = value;
		}

		public function get businesses():ArrayCollection {
			return _businesses;
		}

		public function set businesses(value:ArrayCollection):void {
			_businesses = value;
		}

	}
}