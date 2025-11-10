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
    "bw_Enero_BW_Frecuencia_Sequias_VIDECI", "bw_Febrero_BW_Frecuencia_Sequias_VIDECI", "bw_Marzo_BW_Frecuencia_Sequias_VIDECI",
    "bw_Abril_BW_Frecuencia_Sequias_VIDECI", "bw_Mayo_BW_Frecuencia_Sequias_VIDECI", "bw_Junio_BW_Frecuencia_Sequias_VIDECI",
    "bw_Julio_BW_Frecuencia_Sequias_VIDECI", "bw_Agosto_BW_Frecuencia_Sequias_VIDECI", "bw_Septiembre_BW_Frecuencia_Sequias_VIDECI",
    "bw_Octubre_BW_Frecuencia_Sequias_VIDECI", "bw_Noviembre_BW_Frecuencia_Sequias_VIDECI", "bw_Diciembre_BW_Frecuencia_Sequias_VIDECI"
  ],
  "Eventos de sequía": [
    "bw_eventos_sequia_agrometeorologica_BW_Cambio_SPEI", "bw_eventos_sequia_agrometeorologica_Leve_BW_Cambio_SPEI",
    "bw_eventos_sequia_agrometeorologica_Moderada_BW_Cambio_SPEI", "bw_eventos_sequia_agrometeorologica_Severa_BW_Cambio_SPEI",
    "bw_eventos_sequia_agrometeorologica_Extrema_BW_Cambio_SPEI"
  ],
  "Índices climáticos": [
    "bw_DJF_BW_Indice_Combinado_1", "bw_JJA_BW_Indice_Combinado_1", "bw_MAM_BW_Indice_Combinado_1", "bw_SON_BW_Indice_Combinado_1",
    "bw_Ríos_BW_Indice_Combinado_2", "bw_Municipios_BW_Indice_Combinado_1", "bw_Indices_BW_ENSO"
  ],
  "Proyecciones climáticas": [
    "bw_T_proyeccion_2030__BW", "bw_T_proyeccion_2050_BW", "bw_corto_plazo_precipitacion_BW_Cambio_PPT_Sequia",
    "bw_corto_plazo_precipitacion_BW_Proyeccion_P", "bw_corto_plazo_temperatura_BW_Cambio_T_Sequia",
    "bw_mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia", "bw_mediano_plazo_precipitacion_BW_Proyeccion_P",
    "bw_mediano_plazo_temperatura_BW_Cambio_T_Sequia_"
  ],
  "Hidrología y cuerpos de agua": [
    "bw_Rios_BWII_BH_IA", "bw_Lagos_BWII_BH_QA", "bw_Lago_BWII_BH_IA", "bw_Escorrentia_BWII_BH_ESCT",
    "bw_Caudal_BW_Frecuencia_Sequias_VIDECI", "bw_Caudal_especifico_BWII_BH_CESP", "bw_Evapotranspiracion_BWII_BH_PPT",
    "bw_Rios_BW_Cambio_PPT_Sequia", "bw_Salares_BW_Cambio_SPEI"
  ],
  "Límites y divisiones": [
    "bw_Limite_municipal_BWII_Clima_BH", "bw_Limite_nacional_BWII_BH_IA", "bw_Limites_internacionales_BWII_Clima_BH",
    "bw_Country_border_BW_ENSO", "bw_Macrocuencas_BWII_BH_IA", "bw_Macrocuencas_BWII_BH_IA2", "bw_Capital_municipal_BWII_BH_IA"
  ],
  "Clima observado": [
    "bw_Temperatura_BWII_Clima_BH", "bw_Precipitacion_BWII_Clima_BH", "bw_Humedad_BWII_Clima_BH",
    "bw_Nubosidad_BWII_Clima_BH", "bw_Viento_BWII_Clima_BH", "bw_Cobertura_BWII_Clima_BH"
  ],
  "Índices de aridez": [
    "bw_Indice_de_aridez_BWII_BH_IA", "bw_Indice_de_aridez_BWII_BH_PPT"
  ],
  "ENSO y regiones hidroclimáticas": [
    "bw_Regiones_Hidroclimaticas_BW_ENSO", "bw_SST_Promedio_BW_ENSO"
  ],
  "Calibración y calidad": [
    "bw_Calibracion_BWII_BH_IA", "bw_Abril_BWII_BH_QA", "bw_Agosto_BWII_BH_QA", "bw_Diciembre_BWII_BH_QA",
    "bw_Enero_BWII_BH_QA", "bw_Febrero_BWII_BH_QA", "bw_Julio_BWII_BH_QA", "bw_Junio_BWII_BH_QA",
    "bw_Marzo_BWII_BH_QA", "bw_Mayo_BWII_BH_QA", "bw_Media_BWII_BH_QA", "bw_Noviembre_BWII_BH_QA",
    "bw_Octubre_BWII_BH_QA", "bw_Septiembre_BWII_BH_QA"
  ],
  "SPEI estacional": [
    "bw_Sequia_SPEI_DJF_BW_Cambio_SPEI", "bw_Sequia_SPEI_JJA_BW_Cambio_SPEI",
    "bw_Sequia_SPEI_MAM_BW_Cambio_SPEI", "bw_Sequia_SPEI_SON_BW_Cambio_SPEI"
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

L.control.layers(baseMaps, capasSuperpuestas, { collapsed: false }).addTo(map);

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
