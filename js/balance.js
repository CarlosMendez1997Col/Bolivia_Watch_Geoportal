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

  // ✅ Nuevo mapa base: Esri Oceans
  const esriOceans = L.tileLayer("https://server.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}", {
    attribution: "© Esri & contributors"
  });

  const baseMaps = {
    "OpenStreetMap": osm,
    "Satélite Esri": esriSat,
    "Topográfico Esri": esriTopo,
    "Océanos Esri": esriOceans   // agregado al control
  };

  // Inicializar mapa con Oceans como base por defecto
  const map = L.map("map-estudio", {
    center: [-17, -64], // centro aproximado de Bolivia
    zoom: 6,
    layers: [esriOceans]  // ✅ ahora inicia con Oceans
  });


  // Control de capas
  const control = L.control.layers(baseMaps, {}, { collapsed: false }).addTo(map);

  // Escala
  L.control.scale().addTo(map);

  // Forzar redibujo
  setTimeout(() => map.invalidateSize(), 300);

  // URL base WMS
  const wmsUrl = "https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms";

  // Definición de las capas WMS con sus estilos en GeoServer
  const capas = [
    { layer: "bw_capital_municipal_bwii_bh_ia", nombre: "Capital Municipal", estilo: "capital_municipal" },
    { layer: "bw_limite_municipal_bwii_clima_bh", nombre: "Límite Municipal", estilo: "limite_municipal" },
    { layer: "bw_limite_nacional_bwii_bh_ia", nombre: "Límite Nacional", estilo: "limite_nacional" },
    { layer: "bw_lago_bwii_bh_ia", nombre: "Lagos", estilo: "lago" },
    { layer: "bw_limites_internacionales_bwii_clima_bh", nombre: "Límites Internacionales", estilo: "limites_internacionales" },
    { layer: "bw_rios_bwii_bh_ia", nombre: "Ríos", estilo: "rios" }
  ];

  // Contenedor de la leyenda
  const legendDiv = document.getElementById("legend");

  capas.forEach(({ layer, nombre, estilo }) => {
    const capa = L.tileLayer.wms(wmsUrl, {
      layers: `Bolivia_Watch:${layer}`,
      styles: estilo,
      format: "image/png",
      transparent: true   // ✅ ahora las capas son transparentes
    });

    control.addOverlay(capa, nombre);

    // Evento: cuando se activa la capa, se añade su leyenda
    map.on("overlayadd", e => {
      if (e.layer === capa) {
        const item = document.createElement("div");
        item.className = "legend-item";
        item.id = `legend-${layer}`;
        item.innerHTML = `
          <img src="${wmsUrl}?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&LAYER=Bolivia_Watch:${layer}&STYLE=${estilo}" alt="${nombre}">
          ${nombre}
        `;
        legendDiv.appendChild(item);
      }
    });

    // Evento: cuando se desactiva la capa, se elimina su leyenda
    map.on("overlayremove", e => {
      if (e.layer === capa) {
        const item = document.getElementById(`legend-${layer}`);
        if (item) legendDiv.removeChild(item);
      }
    });
  });
});
