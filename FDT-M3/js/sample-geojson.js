//location data
    var geometryType = '"Point"';
    var coordinatesLat = 79.871;
    var coordinatesLng = 6.936;
    var coordinates = [];
    var layerName = '"location"';
    var popupContent = '"Intensity 1"';
    var intensity = 10;
    var id = 0;

    //trasaction data
    var itemNo = "test";
    var billingaddress = "test";
    var txnamt = 0;
    var timestamp = "test";
    var shippingaddress = "test";
    var txnid = "test";
    var qty = 0;
    var email = "test";
    var currency = "test";
    var cardnum = 0;
    var ip = "test";
    var ver = "test";
    var mcolor = "test";

    var featureHead = '{"type": "FeatureCollection","features": [';
    var featureFoot = ']}';

function initFeatureCollection(featureData){ 


    //get lat lng
    var length = featureData.length;
    $.each(featureData, function (index, val) {
        getLatLng(val.payload_shippingaddress,val.payload_ip,index,length);
        //console.log("1: " + coordinates[index]);
    });
    
}



function getLatLng(address,ip,iteration,length){
    var lat;
    var lng;
    var latLng;
    var request_addr = $.ajax({
      //url: 'http://nominatim.openstreetmap.org/search?format=json&limit=1&q=' + address,
      url: 'https://maps.googleapis.com/maps/api/geocode/json?address=' +address+ '&key=AIzaSyAE5HNqYSWEsBuskseqJDRtgIyg3603aQw',
      dataType: 'json',
      beforeSend: function() {
            $("#shipping-ip-map,#intensity-map,#sequance-map").preloader("show");
            $(".dataSave").html("");
            $('#reportrange').hide();
            //console.log("before send....");
      }
    });
    request_addr.fail(function() {
        console.log("Address retreival failed...");
    });
    request_addr.done(function(data) {

        var request_ip = $.ajax({
          url: 'http://ipinfo.io/' + ip,
          dataType: 'jsonp'
        });
        request_ip.fail(function() {
                console.log("IP retreival failed...");
        });
        request_ip.done(function(data) {
            //console.log("ip loc: " +data.loc);
            var swap = data.loc;
            var a = swap.split(",");
            var str = a[1] +","+ a[0];
            //console.log("Reversed Ips: " +str+ " I: " +iteration);
            $(".dataSave").append("<span id='dataSaveSpanIp-"+iteration+"' class='class"+iteration+"'>"+str+"</span>");
             //console.log("LatLng IP: " + str);

             //console.log("I: " + iteration + " L: " + (length-1));
            if(iteration == (length-1)){
                $('#reportrange').show();
                setTimeout(constructString,2000);
            }
             
        });
        
        if(data.status == "ZERO_RESULTS" || data.status == "OVER_QUERY_LIMIT"){
            console.log("0 results for this location..." + address);
        }else if(typeof data.results[0] === 'undefined'){
            console.log("undefined...." + address);
        }else{
            lat = data.results[0].geometry.location.lat;
            lng = data.results[0].geometry.location.lng;
            //console.log(data.results[0]);
            //console.log("passing addresses: " +address);
            var latLng = lng+","+lat;
            $(".dataSave").append("<span id='dataSaveSpan-"+iteration+"' class='class"+iteration+"'>"+latLng+"</span>");
        }

    });
}


function constructString(){

    var features = '';
    var featuresIp = '';
    var featureData = globalTnx;
    var colorArray = ["CC66CC","993399","660066","000066","009966","99FFCC","66CC99","339966","006633","CCCC99","999966",
    "FFCCFF","CC99CC","996699","660099","CC99FF","9966CC","663399","330066","6666FF","3333CC","000099","993366","660033",
    "FF66CC","CC3399","990066","999999","666666","9999FF","6666CC","333399","666633","333300","CC0000","FF6666","CC3333",
    "990000","FF9999","CC6666","993333","660000","993366","660033","FF66CC","CC3399","990066","999999","666666","333333"];

    //normalization for intensity map
    var intensityArr = [];
    $.each(featureData, function (index, val) {
        intensityArr.push(val.payload_txnamt);
    });
    ratio = Math.max.apply(Math, intensityArr) / 50,
    $.each(intensityArr,function(index,value){
      intensityArr[index] = Math.round( intensityArr[index] / ratio );
    });

    $.each(featureData, function (index, val) {
        var comma = (index != 0 ? "," : "");
        var current = $("#dataSaveSpan-"+index).attr("id");
        var currentIp = $("#dataSaveSpanIp-"+index).attr("id");

        if((typeof current === 'undefined') || (typeof currentIp === 'undefined')){
            //console.log("1 or both undefined...");
        }else{
            //console.log("both have data...");
            var currentId =  current.substr(13, 2);
            var currentIpId =  currentIp.substr(15, 2);
            //console.log("id: " + currentId + "  IpId: " + currentIpId);
                if(index == currentId){
                    coordinates = $(".dataSave #dataSaveSpan-"+index).text();
                    console.log(coordinates);
                }
                if(index == currentIpId){
                    coordinatesIp = $(".dataSave #dataSaveSpanIp-"+index).text();
                }
                var latLngRet = $("#dataSave .class"+index).text();
                itemNo = '"'+val.payload_itemNo+'"';
                billingaddress = val.payload_billingaddress;
                //popupContent = "Intensity: " +val.payload_txnamt+ "Location: " +val.payload_billingaddress;
                popupContent = val.payload_shippingaddress;
                txnamt = val.payload_txnamt;
                intensity = intensityArr[index];
                timestamp = val.payload_timestamp;
                shippingaddress = val.payload_shippingaddress;
                txnid = val.payload_txnid;
                qty = val.payload_qty;
                email = '"'+val.payload_email+'"';
                currency = '"'+val.payload_currency+'"';
                cardnum = val.payload_cardnum;
                ip = '"'+val.payload_ip+'"';
                ver = '"'+val.Version+'"';
                //var rand = Math.floor(Math.random()*colorArray.length);
                mcolor = '"'+colorArray[index]+'"';
                
                features += ''+comma+'{"geometry": {"type":' +geometryType+',"coordinates": ['+coordinates+']},"type": "Feature","properties": {"layer": ' +layerName+ ',"popupContent": ' +popupContent+ ',"markerColor": ' +mcolor+ ',"intensity":' +intensity+ ',"payload_itemNo": ' +itemNo+ ',"payload_billingaddress": ' +billingaddress+ ',"payload_txnamt": ' +txnamt+ ',"payload_timestamp": ' +timestamp+ ',"payload_shippingaddress": ' +shippingaddress+ ',"payload_txnid": ' +txnid+ ',"payload_qty": ' +qty+ ',"payload_email": ' +email+ ',"payload_currency": ' +currency+ ',"payload_cardnum": ' +cardnum+ ',"payload_ip": ' +ip+ ',"Version": ' +ver+ '},"id": ' +index+ ',"feature_count": ' +featureData.length+ '}';
                featuresIp += ''+comma+'{"geometry": {"type":' +geometryType+',"coordinates": ['+coordinatesIp+']},"type": "Feature","properties": {"layer": ' +layerName+ ',"popupContent": ' +ip+ ',"markerColor": ' +mcolor+ ',"intensity":' +intensity+ ',"payload_itemNo": ' +itemNo+ ',"payload_billingaddress": ' +billingaddress+ ',"payload_txnamt": ' +txnamt+ ',"payload_timestamp": ' +timestamp+ ',"payload_shippingaddress": ' +shippingaddress+ ',"payload_txnid": ' +txnid+ ',"payload_qty": ' +qty+ ',"payload_email": ' +email+ ',"payload_currency": ' +currency+ ',"payload_cardnum": ' +cardnum+ ',"payload_ip": ' +ip+ ',"Version": ' +ver+ '},"id": ' +index+ ',"feature_count": ' +featureData.length+ '}';
                //console.log("features: " + features);

            }
        });

        var jsonString1 = featureHead+features+featureFoot;
        var jsonString2 = featureHead+featuresIp+featureFoot;
        var jsonStringAdd = JSON.parse(jsonString1);
        var jsonStringIp = JSON.parse(jsonString2);
        //console.log("features1: " + jsonString1);
        $("#shipping-ip-map,#intensity-map,#sequance-map").preloader("hide");
        shippingIpMapFunc(jsonStringAdd,jsonStringIp);
        initIntensityMapFunc(jsonStringAdd);
        sequanceMapFunc(jsonStringAdd);

    }

    

