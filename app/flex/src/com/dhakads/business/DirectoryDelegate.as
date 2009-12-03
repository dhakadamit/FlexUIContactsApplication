package com.dhakads.business
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.dhakads.event.GetDirectoryEvent;
	import com.dhakads.model.WebServiceUrls;
	import com.dhakads.utils.ServiceUtils;
	
	import mx.rpc.IResponder;
	
	public class DirectoryDelegate
	{
		private var _responder:IResponder;
		
		public function DirectoryDelegate(responder:IResponder)
		{
			this._responder = responder;
		}
		
		public function getDirectory(event:CairngormEvent):void {
			var getDirectoryEvent:GetDirectoryEvent = GetDirectoryEvent (event);
			ServiceUtils.httpGet(WebServiceUrls.GET_DIRECTORY, this._responder);
		}
		

	}
}