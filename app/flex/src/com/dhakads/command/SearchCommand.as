package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSON;
	import com.dhakads.business.DirectoryDelegate;
	import com.dhakads.business.FaultHandler;
	import com.dhakads.event.SearchEvent;
	import com.dhakads.model.ContactsApplicationModelLocator;
	import com.dhakads.model.SearchRequest;
	import com.dhakads.model.builders.PeopleBuilder;
	import com.dhakads.model.enums.Pages;
	
	import mx.rpc.IResponder;

	public class SearchCommand implements ICommand, IResponder
	{
		[Bindable]
		private var model:ContactsApplicationModelLocator = ContactsApplicationModelLocator.getInstance();
		private var _callback:Function;
		
		public function execute(event:CairngormEvent):void
		{
			var searchEvent:SearchEvent = SearchEvent (event);
			this._callback = searchEvent.callback;
		
			var directoryDelegate:DirectoryDelegate = new DirectoryDelegate(this);
			directoryDelegate.searchDirectory(searchEvent.query, searchEvent.filter, searchEvent.pageNumber);
			model.searchRequest = new SearchRequest(searchEvent.query, searchEvent.filter);
		}
		
		public function result(data:Object):void
		{
			var decodedValue:Object = JSON.decode(data.result);
			model.people = new PeopleBuilder().build(JSON.decode(decodedValue.people) as Array);
			model.totalCount = JSON.decode(decodedValue.total_count); 
			model.currentPage = Pages.SEARCH_PAGE;
			this._callback();	
		}
		
		public function fault(info:Object):void
		{
			var statusCode:Number = info.statusCode;
			if(statusCode == 401) {
				new FaultHandler().loginRequired();
			}
		}
		
	}
}