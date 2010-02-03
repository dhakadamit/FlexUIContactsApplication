package com.dhakads.business
{
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	import com.dhakads.utils.UrlBuilder;
	
	import mx.rpc.IResponder;
	
	public class DirectoryDelegate
	{
		private var _responder:IResponder;
		
		public function DirectoryDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function getDirectory(pageNumber:Number = 1, alphabet:String = null):void {
			var requestUrl:String = new UrlBuilder()
										.withBaseUrl(WebServiceUrls.GET_DIRECTORY)
										.withParameter("alphabet", alphabet)
										.withParameter("page", String(pageNumber))
										.build();
			
			ServiceUtils.httpGet(requestUrl, this._responder);
		}
		
		
		public function searchDirectory(query:String, filter:String, pageNumber:Number):void {
			var requestUrl:String = new UrlBuilder()
										.withBaseUrl(WebServiceUrls.SEARCH)
										.withParameter("query", query)
										.withParameter("filter", filter)
										.withParameter("page", pageNumber)
										.build();
			
			ServiceUtils.httpGet(requestUrl, this._responder);
		}
		

	}
}