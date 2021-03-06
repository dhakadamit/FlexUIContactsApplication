package com.dhakads.model
{
	import mx.collections.ArrayCollection;
	
	public class ContactDetail
	{
		
		private var _id:String;
		private var _streetAddress:String;
		private var _area:String;
		private var _city:String;
		private var _state:String;
		private var _pincode:String;
		private var _phoneNumbers:ArrayCollection = new ArrayCollection();

		public function get id():String {
			return _id;
		}

		public function set id(value:String):void {
			_id = value;
		}

		public function get phoneNumbers():ArrayCollection {
			return _phoneNumbers;
		}

		public function set phoneNumbers(value:ArrayCollection):void {
			_phoneNumbers = value;
		}

		public function get streetAddress():String {
			return _streetAddress;
		}

		public function set streetAddress(value:String):void {
			_streetAddress = value;
		}

		public function get area():String {
			return _area;
		}

		public function set area(value:String):void {
			_area = value;
		}

		public function get city():String {
			return _city;
		}

		public function set city(value:String):void {
			_city = value;
		}

		public function get state():String {
			return _state;
		}

		public function set state(value:String):void {
			_state = value;
		}

		public function get pincode():String {
			return _pincode;
		}

		public function set pincode(value:String):void {
			_pincode = value;
		}

	}
}