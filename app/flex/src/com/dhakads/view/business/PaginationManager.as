package com.dhakads.view.business
{
	import com.dhakads.event.GetDirectoryEvent;
	
	import mx.collections.ArrayCollection;
	
	public class PaginationManager
	{
		private static const TOTAL_RESULTS_PER_PAGE:Number = 3;
		private var _totalCount:Number = 0;
		private var _currentPage:Number = 1;
		private var _totalNumberOfPages:Number = 0;
		private var _displayingItemsFrom:Number = 0;
		private var _displayingItemsTo:Number = 0;
		
		[Bindable]
		public var displayString:String;
		
		public function PaginationManager(totalCount:Number)
		{
			this._totalCount = totalCount;
			this._totalNumberOfPages = calculateTotalNumberOfPages();
			updateDisplayString();
		}
		
		public function nextSetOfResults():void {
			if(this._currentPage < this._totalNumberOfPages) {
				++_currentPage;
				updateDisplayString();
			}			
		}
		
		public function previousSetOfResults():void {
			if(_currentPage > 1) {
				--_currentPage;
				updateDisplayString();
			}
		}
		
		private function updateDisplayString():void {
			if(this._currentPage == this._totalNumberOfPages) {
				this._displayingItemsFrom = this._displayingItemsTo + 1;
				this._displayingItemsTo = this._totalCount;				
			} 
			else {
				this._displayingItemsTo = this._currentPage * TOTAL_RESULTS_PER_PAGE;
				this._displayingItemsFrom = this._displayingItemsTo - TOTAL_RESULTS_PER_PAGE;
			}	
			this.displayString = this._displayingItemsFrom + '-' + this._displayingItemsTo + ' of ' + this._totalCount;
		}
		
		private function calculateTotalNumberOfPages():Number {
			var count:int = this._totalCount / TOTAL_RESULTS_PER_PAGE;
			if(this._totalCount % TOTAL_RESULTS_PER_PAGE != 0) {
				count++;
			}
			return count;
		}
		
	}
}