
function initIntensityMapFunc(featureCollection){


    intensityMap = L.map('intensity-map',{
        center: [0.00, 0.00],
        zoom: 2
    });

    L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
        id: 'examples.map-20v6611k'
    }).addTo(intensityMap);

    
    function onEachFeature(feature, layer) {
        //console.log("inside onEachFeature");
        var popupContent = "<b>Ammount: </b>" +feature.properties.payload_currency+ " " +feature.properties.payload_txnamt+ " * " +feature.properties.payload_qty+ "<br/>";
        if (feature.properties && feature.properties.popupContent) {
            popupContent += "<b>Shipped to: </b>" +feature.properties.popupContent;
        }
        layer.bindPopup(popupContent);

        
    } 

    L.geoJson([featureCollection], {
        style: function (feature) {
            return feature.properties && feature.properties.style;
        },
        onEachFeature: onEachFeature,
        pointToLayer: function (feature, latlng) {
            //console.log("rad: " +feature.properties.intensity);
            return L.circleMarker(latlng, {
                radius: (feature.properties.intensity + 1) * feature.properties.payload_qty,
                fillColor: "#D61800",
                color: "#FF0000",
                weight: 2,
                opacity: 1,
                fillOpacity: 0.5
            });
        }
    }).addTo(intensityMap);

L.control.scale().addTo(intensityMap);

 //var bounds = new L.LatLngBounds(LatLng);
 //intensityMap.fitBounds(bounds);

}

