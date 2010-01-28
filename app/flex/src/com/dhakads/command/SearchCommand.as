package com.dhakads.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSONDecoder;
	import com.dhakads.business.SearchDelegate;
	import com.dhakads.event.SearchEvent;
	import com.dhakads.model.builders.PeopleBuilder;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class SearchCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var searchEvent:SearchEvent = SearchEvent (event);
			var searchDelegate:SearchDelegate = new SearchDelegate(this);
			searchDelegate.search(searchEvent.query, searchEvent.filter, searchEvent.pageNumber);
		}
		
		public function result(data:Object):void
		{
			var decoder:JSONDecoder = new JSONDecoder(data.result);
			var people:ArrayCollection = new PeopleBuilder().build(decoder.getValue() as Array);
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}