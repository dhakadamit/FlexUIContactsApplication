package com.dhakads.business
{
	import com.dhakads.model.Person;
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.model.builders.PersonBuilder;
	import com.dhakads.utils.ServiceUtils;
	
	import mx.rpc.IResponder;
	
	public class CreatePersonDelegate
	{
		private var _responder:IResponder;
		
		public function CreatePersonDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function create(person:Person):void {
			var json:String = new PersonBuilder().convertToJson(person);
			ServiceUtils.httpPost(WebServiceUrls.CREATE_PERSON, json, this._responder);
		}

	}
}