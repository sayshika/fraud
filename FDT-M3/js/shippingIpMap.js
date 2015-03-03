
function shippingIpMapFunc(featureCollection,featureCollectionIp){
	
	var MB_ATTR = 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
				'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery © <a href="http://mapbox.com">Mapbox</a>';
	var MB_URL = 'http://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png';

	shippingIpMap = L.map('shipping-ip-map',{
		center: [0.00, 0.00],
        //layers: [grayscale],
        zoom: 2
        
    });

	

	L.tileLayer(MB_URL, {
		maxZoom: 18,
		attribution: MB_ATTR,
		id: 'examples.map-20v6611k'
	}).addTo(shippingIpMap);

 	var grayscale = L.tileLayer(MB_URL, {attribution: MB_ATTR, id: 'examples.map-20v6611k'});
	var streets = L.tileLayer(MB_URL, {attribution: MB_ATTR, id: 'examples.map-i875mjb7'});

	


	//shippingIpMap.addLayer(locationsGroup);
	//shippingIpMap.addLayer(ipGroup);


	function onEachFeature1(feature, layer) {
		//console.log("inside onEachFeature1");
		var popupContent = "";
		if (feature.properties && feature.properties.popupContent) {
			popupContent += feature.properties.popupContent;
		}
		layer.bindPopup(popupContent);
	} 

	var ipArray = [];
	var uniqueIpArray = [];
	function onEachFeature2(feature, layer) {
		//console.log("inside onEachFeature2: " + feature.geometry.coordinates);
		
		var popupContent = "";
		if (feature.properties && feature.properties.popupContent) {
			popupContent += feature.properties.popupContent;
		}
		layer.bindPopup(popupContent);
	}

	//var locationsGroup = new L.layerGroup();
	var locationsGroup = L.geoJson([featureCollection], {
		style: function (feature) {
			return feature.properties && feature.properties.style;
		},
		onEachFeature: onEachFeature1,
		pointToLayer: function (feature, latlng) {
        
        var LocationIcon = L.MakiMarkers.icon({
			icon: "building",
			color: "#" +feature.properties.markerColor,
			size: "m"
		});
        return L.marker(latlng, {icon: LocationIcon});
    	}
	});
	locationsGroup.addTo(shippingIpMap);
	

	//var ipGroup = new L.layerGroup();
	var ipGroup = L.geoJson([featureCollectionIp], {
		style: function (feature) {
			return feature.properties && feature.properties.style;
		},
		onEachFeature: onEachFeature2,
		pointToLayer: function (feature, latlng) {
        //console.log("Ip color " +feature.properties.markerColor);
        ipArray.push(feature.geometry.coordinates);
		uniqueIpArray.push($.unique(ipArray));
		//console.log("ip: " + ipArray.length+ " unique: " + uniqueIpArray.length);

		var IpIcon = L.MakiMarkers.icon({
			icon: "triangle",
			color: "#" +feature.properties.markerColor,
			size: "m"
		});

        return L.marker(latlng, {icon: IpIcon});
    	}
	});
	ipGroup.addTo(shippingIpMap);

	var overlayMaps = {
		"Shipping Locations": locationsGroup,
		"IP Locations":  ipGroup
	};
	var baseLayers = {
		"Streets": streets,
		"Grayscale": grayscale
	};
	L.control.layers(baseLayers,overlayMaps).addTo(shippingIpMap);
	L.control.scale().addTo(shippingIpMap);


}