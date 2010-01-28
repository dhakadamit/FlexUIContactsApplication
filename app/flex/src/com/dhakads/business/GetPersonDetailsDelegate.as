package com.dhakads.business
{
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	import com.dhakads.utils.UrlBuilder;
	
	import mx.rpc.IResponder;
	
	public class GetPersonDetailsDelegate
	{
		private var _responder:IResponder;
		
		public function GetPersonDetailsDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function getDetails(id:Number):void {
			var requestUrl:String = new UrlBuilder()
										.withBaseUrl(WebServiceUrls.GET_PERSON_DETAILS + "/" + id + ".json")
										.build();
			ServiceUtils.httpGet(requestUrl, this._responder);							
		}

	}
}