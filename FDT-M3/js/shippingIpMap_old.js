

// var LocationIcon = L.MakiMarkers.icon({
//             icon: "building",
//             color: "#0066ff",
//             size: "l"
//         });
// var IpIcon = L.MakiMarkers.icon({
//             icon: "triangle",
//             color: "#0066ff",
//             size: "l"
//         });

// var loc1 = L.marker([6.936, 79.871],{icon: LocationIcon}).bindPopup('<b>Shipping Location</b><br />002, test street,colombo 1');
// var loc2 = L.marker([6.928, 79.862],{icon: LocationIcon}).bindPopup('<b>Shipping Location</b><br />003, test street,colombo 1');
// var loc3 = L.marker([6.933, 79.863],{icon: LocationIcon}).bindPopup('<b>Shipping Location</b><br />004, test street,colombo 1');
// var loc4 = L.marker([6.929, 79.864],{icon: LocationIcon}).bindPopup('<b>Shipping Location</b><br />005, test street,colombo 1');

// var ip1 = L.marker([6.927, 79.889],{icon: IpIcon}).bindPopup('<b>IP Location</b><br />92.12.30.11');
// var ip2 = L.marker([6.934, 79.880],{icon: IpIcon}).bindPopup('<b>IP Location</b><br />81.220.70.22');

// var locations = L.layerGroup([loc1, loc2, loc3, loc4]);
// var ip = L.layerGroup([ip1, ip2]);

// var shippingIpMap = L.map('shipping-ip-map', {
//     center: [6.936, 79.871],
//     zoom: 14,
//     layers: [locations,ip]
// });

// var overlayMaps = {
//     "Shipping Locations": locations,
//     "IP Locations": ip
// };
// var baseLayers = {
    
// };
// L.control.layers(baseLayers,overlayMaps).addTo(shippingIpMap);
// L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
//     maxZoom: 18,
//     id: 'examples.map-i875mjb7',
//     continuousWorld: true
// }).addTo(shippingIpMap);

// loc1.openPopup();