package com.business
{
	import mx.rpc.IResponder;
	
	
		
	public class GetPeopleDetailsDelegate
	{
		private var responder : IResponder;
		
		public function GetPeopleDetailsDelegate( responder : IResponder )
		{
			this.responder = responder;
		}
		
		public function execute() : void {
			var people : XML = 
				<people>
					<person>
			            <name>Christina Coenraets</name>
			            <area>555-219-2270</area>
			            <business>ccoenraets@fictitious.com</business>
			        </person>
			        <person>
			            <name>Joanne Wall</name>
			            <area>555-219-2012</area>
			            <business>jwall@fictitious.com</business>
			        </person>
			        <person>
			            <name>Maurice Smith</name>
			            <area>555-219-2012</area>
			            <business>maurice@fictitious.com</business>
			        </person>
			        <person>
			            <name>Mary Jones</name>
			            <area>555-219-2000</area>
			            <business>mjones@fictitious.com</business>
			        </person>
		        </people>;
			
			this.responder.result(people);
		}

	}
}