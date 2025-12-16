/*=====================================================================================================================================================*/
/*=====                                                        Bolivia Watch Geoportal                                                            =====*/
/*=====                                         Stockholm Environment Institute - Latin America (SEI-LA)                                          =====*/
/*=====                                              Copyright 2025, Stockholm Environment Institute                                              =====*/
/*=====                                            https://github.com/sei-latam/Bolivia_Watch_Geoportal                                           =====*/
/*=====                                            https://sei-latam.github.io/Bolivia_Watch_Geoportal/                                           =====*/
/*=====                                                                Balance.js                                                                 =====*/
/*=====                                          Geoportal Developed by Carlos Mendez - Research Associate I                                      =====*/
/*=====                                                              Apache-2.0 license                                                           =====*/
/*=====================================================================================================================================================*/


/*=====================================================================================================================================================*/
/*--------------------------------------------------------------   BaseMaps  --------------------------------------------------------------------------*/
/*=====================================================================================================================================================*/

const osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution: "© OpenStreetMap contributors"
});

const esriSat = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", {
  attribution: "© Esri & contributors"
});

const esriTopo = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}", {
  attribution: "© Esri & contributors"
});

/*=====================================================================================================================================================*/
/*--------------------------------------------------------------   Start Main  ------------------------------------------------------------------------*/
/*=====================================================================================================================================================*/

const map = L.map("map", {
  center: [-17.0, -64.0],
  zoom: 6,
  layers: [osm]
});

L.control.scale().addTo(map);

/*=====================================================================================================================================================*/
/*--------------------------------------------------------------   Tematic Layers  --------------------------------------------------------------------*/
/*=====================================================================================================================================================*/

const wmsUrl = "https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms?";

const baseMaps = {
  "OpenStreetMap": osm,
  "Satélite Esri": esriSat,
  "Topográfico Esri": esriTopo
};

L.control.layers(baseMaps, { collapsed: true }).addTo(map);