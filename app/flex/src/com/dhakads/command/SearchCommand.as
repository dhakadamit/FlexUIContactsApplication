package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSONDecoder;
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
		
		public function execute(event:CairngormEvent):void
		{
			var searchEvent:SearchEvent = SearchEvent (event);
			var directoryDelegate:DirectoryDelegate = new DirectoryDelegate(this);
			directoryDelegate.searchDirectory(searchEvent.query, searchEvent.filter, searchEvent.pageNumber);
			model.mostRecentSearchRequest = new SearchRequest(searchEvent.query, searchEvent.filter);
		}
		
		public function result(data:Object):void
		{
			var decoder:JSONDecoder = new JSONDecoder(data.result);
			model.people = new PeopleBuilder().build(decoder.getValue() as Array);
			model.currentPage = Pages.SEARCH_PAGE;
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