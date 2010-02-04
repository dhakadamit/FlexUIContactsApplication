package com.dhakads.utils
{
	
	public class PaginationManager
	{
		private static const TOTAL_RESULTS_PER_PAGE:Number = 3;
		private var _totalCount:Number = 0;
		private var _currentPage:Number = 1;
		private var _displayingItemsFrom:Number = 0;
		private var _displayingItemsTo:Number = 0;
		private var fetchNewResultSet:Function;
		private var fetchTotalCount:Function;
		
		[Bindable]
		public var displayString:String;
	
		public function PaginationManager(fetchNewResultSet:Function, fetchTotalCount:Function)
		{
			this.fetchNewResultSet = fetchNewResultSet;
			this.fetchTotalCount = fetchTotalCount;
		}
		
		public function firstSetOfResults(event:Event = null):void {
			fetchNewResultSet(_currentPage, updateDisplayString);
		}
		
		public function nextSetOfResults(event:Event = null):void {
			if(_currentPage < calculateTotalNumberOfPages()) {
				++_currentPage;
				fetchNewResultSet(_currentPage, updateDisplayString);
			}			
		}
		
		public function previousSetOfResults(event:Event = null):void {
			if(_currentPage > 1) {
				--_currentPage;
				fetchNewResultSet(_currentPage);
				
				updateDisplayString();
			}
		}
		
		private function updateDisplayString():void {
			_totalCount = fetchTotalCount();
			
			if(_currentPage == calculateTotalNumberOfPages()) {
				_displayingItemsFrom = _displayingItemsTo + 1;
				_displayingItemsTo = _totalCount;				
			} 
			else {
				_displayingItemsTo = _currentPage * TOTAL_RESULTS_PER_PAGE;
				_displayingItemsFrom = _displayingItemsTo - TOTAL_RESULTS_PER_PAGE;
			}	
			displayString = _displayingItemsFrom + '-' + _displayingItemsTo + ' of ' + _totalCount;
		}
		
		private function calculateTotalNumberOfPages():Number {
			var count:int = _totalCount / TOTAL_RESULTS_PER_PAGE;
			if(_totalCount % TOTAL_RESULTS_PER_PAGE != 0) {
				count++;
			}
			return count;
		}
		
	}
}