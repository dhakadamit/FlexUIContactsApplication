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
		
		public function getDirectory(alphabet:String = null, pageNumber:Number = 1):void {
//			var requestUrl:String = new UrlBuilder()
//										.withBaseUrl(WebServiceUrls.GET_DIRECTORY)
//										.withParameter("alphabet", alphabet)
//										.withParameter("page", String(pageNumber))
//										.build();
//			
			ServiceUtils.httpGet('http://localhost:3000/people/1.json', this._responder);
		}
		

	}
}