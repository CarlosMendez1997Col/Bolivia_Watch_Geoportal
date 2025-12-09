// Bolivia Watch Geoportal
// THE STOCKHOLM ENVIRONMENT INSTITUTE (SEI)
// Developed by MSc Carlos Mendez

// ==========================
// 1. Mapas base
// ==========================

const osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution: "© OpenStreetMap contributors"
});

const esriSat = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", {
  attribution: "© Esri & contributors"
});

const esriTopo = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}", {
  attribution: "© Esri & contributors"
});

// ==========================
// 2. Inicialización del mapa
// ==========================

const map = L.map("map", {
  center: [-17.0, -64.0],
  zoom: 6,
  layers: [osm]
});

L.control.scale().addTo(map);

// ==========================
// 3. Capas temáticas WMS
// ==========================

const wmsUrl = "https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms?";

const baseMaps = {
  "OpenStreetMap": osm,
  "Satélite Esri": esriSat,
  "Topográfico Esri": esriTopo
};

L.control.layers(baseMaps, { collapsed: true }).addTo(map);

