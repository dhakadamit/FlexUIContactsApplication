package com.dhakads.business
{
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	import com.dhakads.utils.UrlBuilder;
	
	import mx.rpc.IResponder;
	
	public class SearchDelegate
	{
		private var _responder:IResponder;
		
		public function SearchDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function search(query:String, filter:String, pageNumber:Number):void {
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