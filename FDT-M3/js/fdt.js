fdt = new function(){

	this.createNewTable = function () {
	//console.log("Clicked on createNewTable");
	var tableName = {};
	fdtClient.createTable(tableName);
}

this.deleteTable = function () {
	//console.log("Clicked on deleteTable");
	var tableName = {};
	fdtClient.deleteTable(tableName);
}

this.checkForTable = function () {
	//console.log("Clicked on checkForTable");
	var tableName = {};
	fdtClient.checkTable(tableName);
}

this.listAllTables = function () {
	//console.log("Clicked on listAllTables");
	fdtClient.listTables();
}

this.getRecordsFromtable = function () {
	//console.log("Clicked on getRecordsFromtable");
	var tableName = "bar6";
	fdtClient.getRecords(tableName);
	
}

this.getRecordsInRange = function (f,t) {
	//console.log("Clicked on getRecordsInArange");
	var tableName = "bar6";
	var from = f; //converting UNIX timestap to seconds
	var to = t;
	var start = 0;
	var count = 10;
	fdtClient.getRecordsRange(tableName,from,to,start,count);
}

this.getRecordsFromTableByIds = function () {
	//console.log("Clicked on getRecordsFromTableByIds");
	var tableName = "bar5";
	fdtClient.getRecordsByIds(tableName);
}

this.createNewRecords = function () {
	//console.log("Clicked on createNewRecords");
	var id = {};
	var tableName = {};
	var timestamp = {};
	var values = {
		"columnName1" : value1,
		"columnName2" : value2
	};
	fdtClient.createRecords(id,tableName,timestamp,values);
}

this.deleteRecords = function () {
	//console.log("Clicked on deleteRecords");
	var tableName = {};
	var timeFrom = {};
	var timeTo = {};
	fdtClient.deleteRecords(tableName,timeFrom,timeTo);
}

this.updateRecords = function () {
	//console.log("Clicked on updateRecords");
	var id = {};
	var tableName = {};
	var timestamp = {};
	var values = {
		"columnName1" : value1,
		"columnName2" : value2
	};
	fdtClient.updateRecords(id,tableName,timestamp,values);
}

this.getRecordCount = function () {
	//console.log("Clicked on getRecordCount");
	var tableName = {};
	fdtClient.recordCount(tableName);
}

this.createNewIndices = function () {
	//console.log("Clicked on createNewIndices");
	var tableName = {};
	var types = {
		"indexColumnName1" : TYPE1,
		"indexColumnName2" : TYPE2
	};
	fdtClient.createIndices(tableName, types);
}

this.getIndicesFrom = function () {
	//console.log("Clicked on getIndicesFrom");
	var tableName = {};
	fdtClient.getIndices(tableName);
}

this.clearIndicesFrom = function () {
	//console.log("Clicked on clearIndicesFrom");
	var tableName = {};
	fdtClient.clearIndices(tableName);
}

this.searchRecordsFrom = function () {
	var cardId = loadData("wsDataLocal");
	var tableName = "bar6";
	var language = "lucene";
	var query = "payload_cardnum:" +cardId.event.payloadData.cardnum;
	var start = 0;
	var count = 100;
	fdtClient.searchRecords(tableName, language, query, start, count);
}

this.filterRecords = function (query) {	
	var tableName = "bar6";
	var language = "lucene";
	var start = 0;
	var count = 100;
	
	fdtClient.searchRecords(tableName, language, query, start, count);
}

}