// Crear un objeto mapa
var map = L.map("map").setView([-17.0,-64.0],0.0);

//Enlazar el Open Street Map
var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png").addTo(map);

//Enlazar Servicios WMS

 var abril_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{
					Layers : "abril_bh_qa",
					format : "image/png",
					transparent : true

}).addTo(map);

 
 var abril_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{
					Layers : "abril_bh_qa",
					format : "image/png",
					transparent : true

}).addTo(map);