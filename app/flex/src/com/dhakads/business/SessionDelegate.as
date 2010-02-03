package com.dhakads.business
{
	import com.dhakads.model.enums.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	
	import mx.rpc.IResponder;
	
	public class SessionDelegate
	{
		private var _responder:IResponder;
		
		public function SessionDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function create(username:String, password:String):void {
			ServiceUtils.httpPost(WebServiceUrls.CREATE_SESSION, {login:username, password:password}, this._responder);  
		}
		
		public function destroy():void {
			ServiceUtils.httpDestroy(WebServiceUrls.DELETE_SESSION, this._responder);
		}


	}
}