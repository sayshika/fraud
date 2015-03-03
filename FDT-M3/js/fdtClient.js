window.globalTnx = [];
fdtClient = new function(){

	this.createTable = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("POST","/analytics/"+ tableName , null ,function(data) {
			//console.log(data);
		});
	}

	this.deleteTable = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("DELETE","/analytics/"+ tableName , null ,function(data) {
			//console.log(data);
		});
	}

	this.checkTable = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/"+ tableName , null ,function(data) {
			console.log(data);
		});
	}

	this.listTables = function() {
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/tables", null ,function(data) {
			console.log(data);
		});
	}

	this.getRecords = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/records/"+tableName, null ,function(data) {
			$.each(data, function (index, val) {
				globalTnx.push(val.values);
    		});
    		initTable(globalTnx);
    		initFeatureCollection(globalTnx);
		});
		
	}

	this.getRecordsRange = function(tableName,from,to,start,count) {
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/records/"+tableName+"/"+from+"/"+to, null ,function(data) {
			$.each(data, function (index, val) {
				globalTnx.push(val.values);
    		});
    		initTable(globalTnx);
    		initFeatureCollection(globalTnx);
		});
	}
	
	this.getRecordsByIds = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("POST","/analytics/records/"+tableName, null ,function(data) {
			console.log(data);
		});
	}

	this.createRecords = function(id,tableName,timestamp,values) {
		var content = '{"tableName": "' +tableName+ '","id": "' +id+ '","timestamp": "' +timestamp+ '","values": ' +values+ '}';
		fdtRestRequestUtil.makeJsonRequest("POST","/analytics/records" , content ,function(data) {
			//console.log(data);
		});
	}

	this.deleteRecords = function(tableName,timeFrom,timeTo) {
		fdtRestRequestUtil.makeJsonRequest("DELETE","/analytics/records/"+tableName+"/"+timeFrom+"/"+timeTo, null ,function(data) {
			//console.log(data);
		});
	}

	this.updateRecords = function(id,tableName,timestamp,values) {
		var content = '{"tableName": "' +tableName+ '","id": "' +id+ '","timestamp": "' +timestamp+ '","values": ' +values+ '}';
		fdtRestRequestUtil.makeJsonRequest("PUT","/analytics/records" , content ,function(data) {
			//console.log(data);
		});
	}

	this.recordCount = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/count/"+ tableName , null ,function(data) {
			//console.log(data);
		});
	}

	this.createIndices = function(tableName, types) {
		var content = '{"types":'+types+'}';
		fdtRestRequestUtil.makeJsonRequest("GET","/analytics/indices/"+ tableName , content ,function(data) {
			//console.log(data);
		});
	}

	this.clearIndices = function(tableName) {
		fdtRestRequestUtil.makeJsonRequest("DELETE","/analytics/indices/"+ tableName , null ,function(data) {
			//console.log(data);
		});
	}

	this.searchRecords = function(tableName, language, query, start, count) {
		
		var content = '{"tableName": "' +tableName+ '","language": "' +language+ '","query": "' +query+ '","start": ' +start+ ',"count": ' +count+ '}';
		//console.log(content);
		fdtRestRequestUtil.makeJsonRequest("POST","/analytics/search", content ,function(data) {
			$.each(data, function (index, val) {
				globalTnx.push(val.values);
    		});
    		initTable(globalTnx);
    		initFeatureCollection(globalTnx);
		});
	}

}