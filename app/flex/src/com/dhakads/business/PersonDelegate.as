package com.dhakads.business
{
	import com.dhakads.model.Person;
	import com.dhakads.model.enums.WebServiceUrls;
	import com.dhakads.model.builders.PersonBuilder;
	import com.dhakads.utils.ServiceUtils;
	import com.dhakads.utils.UrlBuilder;
	
	import mx.rpc.IResponder;
	
	public class PersonDelegate
	{
		private var _responder:IResponder;
		
		public function PersonDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function create(person:Person):void {
			var json:String = new PersonBuilder().convertToJson(person);
			ServiceUtils.httpPost(WebServiceUrls.CREATE_PERSON, json, this._responder);
		}
		
		public function getDetails(id:Number):void {
			var requestUrl:String = new UrlBuilder()
										.withBaseUrl(WebServiceUrls.GET_PERSON_DETAILS + "/" + id + ".json")
										.build();
			ServiceUtils.httpGet(requestUrl, this._responder);							
		}
		
	}
}