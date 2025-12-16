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

document.addEventListener('DOMContentLoaded', () => {
  // Mapas base
  const osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "© OpenStreetMap contributors"
  });
  const esriSat = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", {
    attribution: "© Esri & contributors"
  });
  const esriTopo = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}", {
    attribution: "© Esri & contributors"
  });

  const baseMaps = {
    "OpenStreetMap": osm,
    "Satélite Esri": esriSat,
    "Topográfico Esri": esriTopo
  };

  // Inicializar mapa
  const map = L.map("map-estudio", {
    center: [-17, -64], // centro aproximado de Bolivia
    zoom: 6,
    layers: [osm] // capa inicial
  });

  // Control para alternar entre mapas base
  const control = L.control.layers(baseMaps, {}, { collapsed: false }).addTo(map);

  // Escala
  L.control.scale().addTo(map);

  // Forzar redibujo para que encaje en el contenedor
  setTimeout(() => map.invalidateSize(), 300);

  // URL base del servicio WFS
  const wfsUrl = "https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/ows?";

  // Definición de las 8 capas
  const capas = [
    { typeName: "bw_capital_municipal_bwii_bh_ia", nombre: "Capital Municipal", estilo: { color: "#B54900" } },
    { typeName: "bw_limite_municipal_bwii_clima_bh", nombre: "Límite Municipal", estilo: { color: "#1d7cf2", weight: 1, fillOpacity: 0 } },
    { typeName: "bw_limite_nacional_bwii_bh_ia", nombre: "Límite Nacional", estilo: { color: "#000", weight: 2, fillOpacity: 0 } },
    { typeName: "bw_lago_bwii_bh_ia", nombre: "Lagos", estilo: { color: "#00904E", weight: 1, fillColor: "#00904E", fillOpacity: 0.5 } },
    { typeName: "bw_limites_internacionales_bwii_clima_bh", nombre: "Límites Internacionales", estilo: { color: "#ff0000", weight: 2, fillOpacity: 0 } },
    { typeName: "bw_rios_bwii_bh_ia", nombre: "Ríos", estilo: { color: "#1ca9f4", weight: 1 } },
    { typeName: "bw_calibracion_bwii_bh_ia", nombre: "Calibración", estilo: { color: "#ff9900", weight: 2 } },
    { typeName: "bw_macrocuencas_bwii_bh_ia", nombre: "Macrocuencas", estilo: { color: "#6a0dad", weight: 2, fillOpacity: 0.2 } }
  ];

  // Función para cargar las capas WFS
  capas.forEach(({ typeName, nombre, estilo }) => {
    const url = `${wfsUrl}service=WFS&version=1.0.0&request=GetFeature&typeName=Bolivia_Watch:${typeName}&srsName=EPSG:4326&outputFormat=application/json`;

    fetch(url)
      .then(res => res.json())
      .then(data => {
        const capa = L.geoJSON(data, { style: estilo });
        capa.addTo(map);
        control.addOverlay(capa, nombre);
      })
      .catch(err => console.error(`Error cargando capa ${nombre}:`, err));
  });
});