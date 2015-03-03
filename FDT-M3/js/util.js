fdtRestRequestUtil = new function() {

  this.makeJsonRequest = function(type, u, d, callback) {

    //console.log("util called....");
    //var bamUrl = "http://10.100.5.97:9763" + u;
    var bamUrl = "http://localhost:9763" + u;
    $.ajax({
      type: type,
      url: bamUrl,
      data: d,
      contentType: "application/json",  
      dataType: "json",
      success: callback
    });
  };

}


//preloader plugin
(function( $ ) {

  $.fn.preloader = function( action ) {

    if ( action === 'show') {
      this.html('<div class="preloaderContainer">Loading Map Data</div>');
      $(".preloaderContainer").addClass('preloader');
    }

    if ( action === 'hide' ) {
      $(".preloaderContainer").remove();
    }

    return this;

  };

}( jQuery ));


fdtRestWsUtil = new function() {
  this.startWs = function(){
    console.log("web Socket started... ");
    //var url = 'ws://localhost:9764/FDT-M3/ws_server.jag';
    var url = 'ws://localhost:9768/outputwebsocket/WebsocketOutputAdaptor/fraudevent';
    //var url = 'ws://10.100.5.46:9763/outputwebsocket/WebsocketOutputAdaptor/fraud';
    var ws = new WebSocket(url);
    var wsData;
    var msgCount = 0;
    ws.onopen = function() {
      console.log("web Socket onopen. ");
      $("#fraudMsg").hide();
      $("#fraudMsgOk").show();
      $("#fraudulent-data-panel").hide();
      $("#initial-data-panel").hide();
    };
    //event handler for the message event in the case of text frames
    ws.onmessage = function(e) {
      console.log("web Socket Onmessage from Server. " + e.data);
      var d = JSON.parse(e.data);
      bindWsContent(d,msgCount);
      

    };
    ws.onclose = function() {
      console.log("web Socket onclose. ");
    };

  }

}

function bindWsContent(wsData,msgCount){
      //3714496353984310
      //wsData = {"event":{"payloadData":{"txnid":"I001","cardnum":"3782822463100050","txnamt":"400.0","currency":"$","email":"thusitha32@yahoo.com","shippingaddress":"23,rooasdad,colombo","billingaddress":"23,rooasdad,colombo","ip":"12.3.4.55","itemNo":"33","qty":"1","timestamp":"1423574452095","fraudflag":"1"}}};  
      var cardId = wsData.event.payloadData.cardnum;
      //console.log("ws started....");
      $("#fraudMsg strong").text("CEP has detected a possible fraudulent transaction for " + wsData.event.payloadData.cardnum);
      
      $("#cardNumberDisplay").text(wsData.event.payloadData.cardnum);
      $("#appendContainerL,#appendContainerR").html("");
      if("1" == wsData.event.payloadData.fraudflag){
        $("#fraudMsg small").text("Detection details > Generic Rule : Abnormal Quantity");
        $("#detectionMethod").text("Generic Rule : Abnormal Quantity");
        $("#appendContainerR").append('<div class="form-group"><label for="input" class="control-label col-xs-6">Item Qty</label><div class="col-xs-6"><p class="form-control-static">'+wsData.event.payloadData.qty+'</p></div></div>');
        $("#appendContainerR").append('<div class="form-group"><label for="input" class="control-label col-xs-6">Threshold Value</label><div class="col-xs-6"><p class="form-control-static">'+wsData.event.payloadData.threshold+'</p></div></div>');
      }else if("2" == wsData.event.payloadData.fraudflag){
        $("#fraudMsg small").text("Detection details > High fraud score");
        $("#detectionMethod").text("High fraud score");
        $("#appendContainerR").append('<div class="form-group"><label for="input" class="control-label col-xs-6">Transaction Score</label><div class="col-xs-6"><p class="form-control-static">'+wsData.event.payloadData.transactionScore+'</p></div></div>');
        $("#appendContainerR").append('<div class="form-group"><label for="input" class="control-label col-xs-6">Threshold Score</label><div class="col-xs-6"><p class="form-control-static">'+wsData.event.payloadData.thresholdScore+'</p></div></div>');
      }else{

      }
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Transaction ID</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.txnid+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Transaction Ammount</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.txnamt+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Transaction currency</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.currency+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Email</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.email+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Shipping Address</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.shippingaddress+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">IP</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.ip+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Item Number</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.itemNo+'</p></div></div>');
      $("#appendContainerL").prepend('<div class="form-group"><label for="input" class="control-label col-xs-4">Item Qty</label><div class="col-xs-8"><p class="form-control-static">'+wsData.event.payloadData.qty+'</p></div></div>');

      $("#fraudMsg,#fraudulent-data-panel,#initial-data-panel").show();
      $("#fraudMsgOk").hide();
      saveData("wsDataLocal",wsData);

      msgCount++;
      if(msgCount == 0){
        $("#alertDd").hide();
      }else{
        $("#alertDd .dropdown-menu").prepend('<li><a id="'+wsData.event.payloadData.txnid+'" href="#">possible fraudulent transaction for <span class="label label-danger">'+wsData.event.payloadData.cardnum+'</span> <span class="text-muted">'+wsData.event.payloadData.fraudflag+'</span></a></li>');
        $("#fdCount").text(msgCount);
        $("#alertDd").show("slow");
      }
      console.log("msg count: "+ msgCount);
    }


//data normalization for intensities
fdtNormalizeUtil = new function() {
  this.normalizeArray = function(a){
    //var numbers = [3, 8, 45, 74, 123000],
    ratio = Math.max.apply(Math, a) / 100,
    //console.log("rat: " + ratio);
    $.each(a,function(index,value){
      a[index] = Math.round( a[index] / ratio );
    });

    return a;
  }
}


function saveData(objName,obj){
  var objO = JSON.stringify(obj);
  localStorage.setItem(objName, objO);
}

function loadData(objName){
  var objO = localStorage.getItem(objName);
  if(objO) objO = JSON.parse(objO);
  //console.log(objO);
  return objO;
  //localStorage.removeItem('objName');
}
