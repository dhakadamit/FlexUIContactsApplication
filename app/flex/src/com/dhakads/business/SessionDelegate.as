package com.dhakads.business
{
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	
	import mx.rpc.IResponder;
	
	public class SessionDelegate
	{
		private var _responder:IResponder;
		
		public function SessionDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function create(username:String, password:String) {
			ServiceUtils.post(WebServiceUrls.CREATE_SESSION, {login:username, password:password}, this._responder);  
		}

	}
}