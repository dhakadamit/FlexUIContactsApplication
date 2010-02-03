package com.dhakads.view.business
{
	
	public class PaginationManager
	{
		private static const TOTAL_RESULTS_PER_PAGE:Number = 3;
		private var _totalCount:Number = 0;
		private var _currentPage:Number = 1;
		private var _displayingItemsFrom:Number = 0;
		private var _displayingItemsTo:Number = 0;
		private var fetchNewResultSet:Function;
		private var resultSet:Function;
		
		[Bindable]
		public var displayString:String;
	
		public function PaginationManager(fetchNewResultSet:Function, resultSet:Function)
		{
			this.fetchNewResultSet = fetchNewResultSet;
			this.resultSet = resultSet;
		}
		
		public function firstSetOfResults():void {
			fetchNewResultSet(_currentPage);
			_totalCount = 9;
				
			updateDisplayString();
		}
		
		public function nextSetOfResults():void {
			if(_currentPage < calculateTotalNumberOfPages()) {
				++_currentPage;
				fetchNewResultSet(_currentPage);
//				_totalCount = resultSet().length;
				updateDisplayString();
			}			
		}
		
		public function previousSetOfResults():void {
			if(_currentPage > 1) {
				--_currentPage;
				fetchNewResultSet(_currentPage);
//				_totalCount = resultSet().length;
				updateDisplayString();
			}
		}
		
		private function updateDisplayString():void {
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