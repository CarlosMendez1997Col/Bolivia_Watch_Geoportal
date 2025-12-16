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

const baseMaps = {
  "OpenStreetMap": osm,
  "Satélite Esri": esriSat,
  "Topográfico Esri": esriTopo
};

const wfsUrl = "https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/ows?";

/*=====================================================================================================================================================*/
/*--------------------------------------------------------------   Start Main  ------------------------------------------------------------------------*/
/*=====================================================================================================================================================*/

function cargarCapasBalance(map, controlCapas) {
  const capas = [
    { typeName: "bw_capital_municipal_bwii_bh_ia", nombre: "Capital Municipal", estilo: { color: "#B54900" },
      popup: p => `<strong>Municipio:</strong> ${p?.nombre_mun || ""}<br><strong>Provincia:</strong> ${p?.provincia || ""}<br><strong>Departamento:</strong> ${p?.departamen || ""}` },
    { typeName: "bw_limite_municipal_bwii_clima_bh", nombre: "Límite Municipal", estilo: { color: "#1d7cf2", weight: 1, fillOpacity: 0 },
      popup: p => `<strong>Municipio:</strong> ${p?.nombre_mun || ""}` },
    { typeName: "bw_limite_nacional_bwii_bh_ia", nombre: "Límite Nacional", estilo: { color: "#000", weight: 2, fillOpacity: 0 },
      popup: () => `Bolivia` },
    { typeName: "bw_lago_bwii_bh_ia", nombre: "Lagos", estilo: { color: "#00904E", weight: 1, fillColor: "#00904E", fillOpacity: 0.5 },
      popup: p => `<strong>Lago:</strong> ${p?.nombre || ""}` },
    { typeName: "bw_limites_internacionales_bwii_clima_bh", nombre: "Límites Internacionales", estilo: { color: "#ff0000", weight: 2, fillOpacity: 0 },
      popup: p => `<strong>País vecino:</strong> ${p?.nombre || ""}` },
    { typeName: "bw_rios_bwii_bh_ia", nombre: "Ríos", estilo: { color: "#1ca9f4", weight: 1 },
      popup: p => `<strong>Río:</strong> ${p?.nombre || ""}` },
    { typeName: "bw_calibracion_bwii_bh_ia", nombre: "Calibración", estilo: { color: "#ff9900", weight: 2 },
      popup: p => `<strong>Estación:</strong> ${p?.nombre || ""}` },
    { typeName: "bw_macrocuencas_bwii_bh_ia", nombre: "Macrocuencas", estilo: { color: "#6a0dad", weight: 2, fillOpacity: 0.2 },
      popup: p => `<strong>Macrocuenca:</strong> ${p?.nombre || ""}` },
  ];

  capas.forEach(({ typeName, nombre, estilo, popup }) => {
    const url = `${wfsUrl}service=WFS&version=1.0.0&request=GetFeature&typeName=Bolivia_Watch:${typeName}&srsName=EPSG:4326&outputFormat=application/json`;
    console.log(`[WFS] ${nombre}: ${url}`);

    fetch(url)
      .then(res => {
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        return res.json();
      })
      .then(data => {
        if (!data || !data.features || data.features.length === 0) {
          console.warn(`[WFS] ${nombre}: sin features`);
        }
        const capa = L.geoJSON(data, {
          style: estilo,
          pointToLayer: (feature, latlng) => L.circleMarker(latlng, {
            radius: 5,
            fillColor: estilo.color || "#3388ff",
            color: "#fff",
            weight: 1,
            opacity: 1,
            fillOpacity: 0.9
          }),
          onEachFeature: (feature, layer) => layer.bindPopup(popup(feature.properties || {}))
        });
        capa.addTo(map);
        controlCapas.addOverlay(capa, nombre);
      })
      .catch(err => console.error(`Error capa ${nombre}:`, err));
  });
}



/*=====================================================================================================================================================*/
/*------------------------------------------------------   Start section 'Área de estudio'  -----------------------------------------------------------*/
/*=====================================================================================================================================================*/

document.addEventListener('DOMContentLoaded', () => {
  const map = L.map("map-estudio", {
    center: [-17, -64],
    zoom: 6,
    layers: [osm]
  });
  const control = L.control.layers(baseMaps, {}, { collapsed: false }).addTo(map);
  L.control.scale().addTo(map);
  cargarCapasBalance(map, control);
});


/*=====================================================================================================================================================*/
/*------------------------------------------------------   End section 'Área de estudio'  -------------------------------------------------------------*/
/*=====================================================================================================================================================*/


