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

const wmsUrl = "http://localhost:8080/geoserver/BW_Geoportal/wms?";

// Nuevos grupos temáticos
const gruposTematicos = {
  "Sequías mensuales": [
    "bw_enero_bw_frecuencia_sequias_videci", "bw_febrero_bw_frecuencia_sequias_videci", "bw_marzo_bw_frecuencia_sequias_videci",
    "bw_abril_bw_frecuencia_sequias_videci", "bw_mayo_bw_frecuencia_sequias_videci", "bw_junio_bw_frecuencia_sequias_videci",
    "bw_julio_bw_frecuencia_sequias_videci", "bw_agosto_bw_frecuencia_sequias_videci", "bw_septiembre_bw_frecuencia_sequias_videci",
    "bw_octubre_bw_frecuencia_sequias_videci", "bw_noviembre_bw_frecuencia_sequias_videci", "bw_diciembre_bw_frecuencia_sequias_videci"
  ],
  "Eventos de sequía": [
    "bw_eventos_sequia_agrometeorologica_bw_cambio_spei", "bw_eventos_sequia_agrometeorologica_leve_bw_cambio_spei",
    "bw_eventos_sequia_agrometeorologica_moderada_bw_cambio_spei", "bw_eventos_sequia_agrometeorologica_severa_bw_cambio_spei",
    "bw_eventos_sequia_agrometeorologica_extrema_bw_cambio_spei"
  ],
  "Índices climáticos": [
    "bw_djf_bw_indice_combinado_1", "bw_jja_bw_indice_combinado_1", "bw_mam_bw_indice_combinado_1", "bw_son_bw_indice_combinado_1",
    "bw_ríos_bw_indice_combinado_2", "bw_municipios_bw_indice_combinado_1", "bw_indices_bw_enso"
  ],
  "Proyecciones climáticas": [
    "bw_t_proyeccion_2030__bw", "bw_t_proyeccion_2050_bw", "bw_corto_plazo_precipitacion_bw_cambio_ppt_sequia",
    "bw_corto_plazo_precipitacion_bw_proyeccion_p", "bw_corto_plazo_temperatura_bw_cambio_t_sequia",
    "bw_mediano_plazo_precipitacion_bw_cambio_ppt_sequia", "bw_mediano_plazo_precipitacion_bw_proyeccion_p",
    "bw_mediano_plazo_temperatura_bw_cambio_t_sequia_"
  ],
  "Hidrología y cuerpos de agua": [
    "bw_rios_bwii_bh_ia", "bw_lagos_bwii_bh_qa", "bw_lago_bwii_bh_ia", "bw_escorrentia_bwii_bh_esct",
    "bw_caudal_bw_frecuencia_sequias_videci", "bw_caudal_especifico_bwii_bh_cesp", "bw_evapotranspiracion_bwii_bh_ppt",
    "bw_rios_bw_cambio_ppt_sequia", "bw_salares_bw_cambio_spei"
  ],
  "Límites y divisiones": [
    "bw_limite_municipal_bwii_clima_bh", "bw_limite_nacional_bwii_bh_ia", "bw_limites_internacionales_bwii_clima_bh",
    "bw_country_border_bw_enso", "bw_macrocuencas_bwii_bh_ia", "bw_macrocuencas_bwii_bh_ia2", "bw_capital_municipal_bwii_bh_ia"
  ],
  "Clima observado": [
    "bw_temperatura_bwii_clima_bh", "bw_precipitacion_bwii_clima_bh", "bw_humedad_bwii_clima_bh",
    "bw_nubosidad_bwii_clima_bh", "bw_viento_bwii_clima_bh", "bw_cobertura_bwii_clima_bh"
  ],
  "Índices de aridez": [
    "bw_indice_de_aridez_bwii_bh_ia", "bw_indice_de_aridez_bwii_bh_ppt"
  ],
  "ENSO y regiones hidroclimáticas": [
    "bw_regiones_hidroclimaticas_bw_enso", "bw_sst_promedio_bw_enso"
  ],
  "Calibración y calidad": [
    "bw_calibracion_bwii_bh_ia", "bw_abril_bwii_bh_qa", "bw_agosto_bwii_bh_qa", "bw_diciembre_bwii_bh_qa",
    "bw_enero_bwii_bh_qa", "bw_febrero_bwii_bh_qa", "bw_julio_bwii_bh_qa", "bw_junio_bwii_bh_qa",
    "bw_marzo_bwii_bh_qa", "bw_mayo_bwii_bh_qa", "bw_media_bwii_bh_qa", "bw_noviembre_bwii_bh_qa",
    "bw_octubre_bwii_bh_qa", "bw_septiembre_bwii_bh_qa"
  ],
  "SPEI estacional": [
    "bw_sequia_spei_djf_bw_cambio_spei", "bw_sequia_spei_jja_bw_cambio_spei",
    "bw_sequia_spei_mam_bw_cambio_spei", "bw_sequia_spei_son_bw_cambio_spei"
  ]
};

const capasSuperpuestas = {};
for (const grupo in gruposTematicos) {
  gruposTematicos[grupo].forEach(nombre => {
    const capa = L.tileLayer.wms(wmsUrl, {
      layers: `BW_Geoportal:${nombre}`,
      format: "image/png",
      transparent: true,
      attribution: "Bolivia Watch Geoportal",
      errorTileUrl: "https://upload.wikimedia.org/wikipedia/commons/6/65/Image_not_available.png"
    });
    capasSuperpuestas[`${grupo} - ${nombre}`] = capa;
  });
}

// ==========================
// 4. Control de capas
// ==========================

const baseMaps = {
  "OpenStreetMap": osm,
  "Satélite Esri": esriSat,
  "Topográfico Esri": esriTopo
};

L.control.layers(baseMaps, capasSuperpuestas, { collapsed: true }).addTo(map);

// ==========================
// 5. Activación por grupo (botones)
// ==========================

function toggleGroup(grupo) {
  const capas = gruposTematicos[grupo];
  if (!capas) return;

  const activar = !capas.every(c => map.hasLayer(capasSuperpuestas[`${grupo} - ${c}`]));

  capas.forEach(nombre => {
    const key = `${grupo} - ${nombre}`;
    if (activar) {
      if (!map.hasLayer(capasSuperpuestas[key])) {
        capasSuperpuestas[key].addTo(map);
      }
    } else {
      if (map.hasLayer(capasSuperpuestas[key])) {
        map.removeLayer(capasSuperpuestas[key]);
      }
    }
  });
}
