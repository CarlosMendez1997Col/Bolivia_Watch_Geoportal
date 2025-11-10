
/*
														Bolivia Watch Geoportal	
													THE STOCKHOLM ENVIRONMENT INSTITUTE (SEI)
														Developed by MSc Carlos Mendez
																														 
*/

// Master WMS and WFS Services and Servers from GeoSERVER

// http://localhost:8080/geoserver/BW_Geoportal/wms?
// http://localhost:8080/geoserver/BW_Geoportal/wfs?
// http://localhost:8080/geoserver/BW_Geoportal/wmts?


// ==========================
// 1. Inicialización del mapa
// ==========================

// Inicialización del mapa
const map = L.map("map").setView([-17.0, -64.0], 6);

const osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution: "© OpenStreetMap contributors"
}).addTo(map);

L.control.scale().addTo(map);

// URL base del servicio WMS
const wmsUrl = "http://localhost:8080/geoserver/BW_Geoportal/wms?";

// Grupos temáticos de capas
const gruposTematicos = {
  "Clima": [
    "bw_temperatura_bwii_clima_bh",
    "bw_precipitacion_bwii_clima_bh",
    "bw_humedad_bwii_clima_bh",
    "bw_nubosidad_bwii_clima_bh"
  ],
  "Hidrología": [
    "bw_rios_bwii_bh_ia",
    "bw_lagos_bwii_bh_qa",
    "bw_evapotranspiracion_bwii_bh_ppt"
  ],
  "Límites": [
    "bw_limite_municipal_bwii_clima_bh",
    "bw_limite_nacional_bwii_bh_ia",
    "bw_limites_internacionales_bwii_clima_bh"
  ],
  "Sequías": [
    "bw_enero_bw_frecuencia_sequias_videci",
    "bw_febrero_bw_frecuencia_sequias_videci",
    "bw_eventos_sequia_agrometeorologica_extrema_bw_cambio_spei"
  ],
  "Proyecciones": [
    "bw_t_proyeccion_2030__bw",
    "bw_t_proyeccion_2050_bw"
  ],
  "ENSO": [
    "bw_djf_bw_indice_combinado_1",
    "bw_sst_promedio_bw_enso",
    "bw_regiones_hidroclimaticas_bw_enso"
  ]
};

// Almacena las capas activas por nombre
const capasActivas = {};

// Alternar visualización de un grupo temático
function toggleGroup(grupo) {
  const capas = gruposTematicos[grupo];
  if (!capas) return;

  const activar = !capas.every(c => capasActivas[c]);

  capas.forEach(nombre => {
    if (activar) {
      if (!capasActivas[nombre]) {
        capasActivas[nombre] = L.tileLayer.wms(wmsUrl, {
          layers: `BW_Geoportal:${nombre}`,
          format: "image/png",
          transparent: true,
          attribution: "Bolivia Watch Geoportal"
        }).addTo(map);
      }
    } else {
      if (capasActivas[nombre]) {
        map.removeLayer(capasActivas[nombre]);
        delete capasActivas[nombre];
      }
    }
  });
}

// Buscador geográfico
function searchLocation() {
  const query = document.getElementById('searchBox').value;
  if (query) {
    L.Control.Geocoder.nominatim().geocode(query, function(results) {
      if (results.length > 0) {
        const result = results[0];
        map.setView([result.center.lat, result.center.lng], 14);
        L.marker([result.center.lat, result.center.lng]).addTo(map)
          .bindPopup(result.name).openPopup();
      } else {
        alert("Lugar no encontrado");
      }
    });
  }
}

// Modo oscuro
function toggleDarkMode() {
  document.body.classList.toggle('dark-mode');
  document.getElementById('sidebar').classList.toggle('dark-mode');
  document.getElementById('map').classList.toggle('dark-mode');
  document.getElementById('searchBtn').classList.toggle('dark-mode');
  document.querySelector('.dark-toggle').classList.toggle('dark-mode');
}

// Menú colapsable
function toggleSidebar() {
  document.getElementById('sidebar').classList.toggle('collapsed');
}