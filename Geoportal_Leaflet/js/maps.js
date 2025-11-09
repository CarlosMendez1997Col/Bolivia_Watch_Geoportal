
/*
														Bolivia Watch Geoportal	
													THE STOCKHOLM ENVIRONMENT INSTITUTE (SEI)
														Developed by MSc Carlos Mendez
																														 
*/

// Master WMS and WFS Services and Servers from GeoSERVER

// http://localhost:8080/geoserver/BW_Geoportal/wms?
// http://localhost:8080/geoserver/BW_Geoportal/wfs?
// http://localhost:8080/geoserver/BW_Geoportal/wmts?


/*
bw_abril_bw_frecuencia_sequias_videci 
bw_abril_bwii_bh_qa 
bw_agosto_bw_frecuencia_sequias_videci 
bw_agosto_bwii_bh_qa 
bw_calibracion_bwii_bh_ia 
bw_capital_municipal_bwii_bh_ia 
bw_caudal_bw_frecuencia_sequias_videci 
bw_caudal_especifico_bwii_bh_cesp 
bw_cobertura_bwii_clima_bh 
bw_corto_plazo_precipitacion_bw_cambio_ppt_sequia 
bw_corto_plazo_precipitacion_bw_proyeccion_p 
bw_corto_plazo_temperatura_bw_cambio_t_sequia 
bw_country_border_bw_enso 
bw_diciembre_bw_frecuencia_sequias_videci 
bw_diciembre_bwii_bh_qa 
bw_djf_bw_indice_combinado_1 
bw_enero_bw_frecuencia_sequias_videci 
bw_enero_bwii_bh_qa 
bw_escorrentia_bwii_bh_esct 
bw_evapotranspiracion_bwii_bh_ppt 
bw_eventos_sequia_agrometeorologica_bw_cambio_spei 
bw_eventos_sequia_agrometeorologica_extrema_bw_cambio_spei 
bw_eventos_sequia_agrometeorologica_leve_bw_cambio_spei 
bw_eventos_sequia_agrometeorologica_moderada_bw_cambio_spei 
bw_eventos_sequia_agrometeorologica_severa_bw_cambio_spei 
bw_febrero_bw_frecuencia_sequias_videci 
bw_febrero_bwii_bh_qa 
bw_humedad_bwii_clima_bh 
bw_indice_de_aridez_bwii_bh_ia 
bw_indice_de_aridez_bwii_bh_ppt 
bw_indices_bw_enso 
bw_jja_bw_indice_combinado_1 
bw_julio_bw_frecuencia_sequias_videci 
bw_julio_bwii_bh_qa 
bw_junio_bw_frecuencia_sequias_videci 
bw_junio_bwii_bh_qa 
bw_lago_bwii_bh_ia 
bw_lagos_bwii_bh_qa 
bw_limite_municipal_bwii_clima_bh 
bw_limite_nacional_bwii_bh_ia 
bw_limites_internacionales_bwii_clima_bh 
bw_macrocuencas_bwii_bh_ia 
bw_macrocuencas_bwii_bh_ia2 
bw_mam_bw_indice_combinado_1 
bw_marzo_bw_frecuencia_sequias_videci 
bw_marzo_bwii_bh_qa 
bw_mayo_bw_frecuencia_sequias_videci 
bw_mayo_bwii_bh_qa bw_media_bwii_bh_qa 
bw_mediano_plazo_precipitacion_bw_cambio_ppt_sequia 
bw_mediano_plazo_precipitacion_bw_proyeccion_p 
bw_mediano_plazo_temperatura_bw_cambio_t_sequia_ 
bw_municipios_bw_indice_combinado_1 
bw_noviembre_bw_frecuencia_sequias_videci 
bw_noviembre_bwii_bh_qa 
bw_nubosidad_bwii_clima_bh 
bw_octubre_bw_frecuencia_sequias_videci 
bw_octubre_bwii_bh_qa 
bw_precipitacion_bwii_bh_ppt 
bw_precipitacion_bwii_clima_bh 
bw_regiones_hidroclimaticas_bw_enso 
bw_rios_bw_cambio_ppt_sequia 
bw_ríos_bw_indice_combinado_2 
bw_rios_bwii_bh_ia 
bw_salares_bw_cambio_spei 
bw_septiembre_bw_frecuencia_sequias_videci 
bw_septiembre_bwii_bh_qa 
bw_sequia_spei_djf_bw_cambio_spei 
bw_sequia_spei_jja_bw_cambio_spei 
bw_sequia_spei_mam_bw_cambio_spei 
bw_sequia_spei_son_bw_cambio_spei 
bw_son_bw_indice_combinado_1 
bw_sst_promedio_bw_enso 
bw_t_proyeccion_2030__bw 
bw_t_proyeccion_2050_bw 
bw_temperatura_bwii_clima_bh 
bw_viento_bwii_clima_bh
*/


// Create an objetc and map
var map = L.map("map").setView([-17.0,-64.0],0.0);

//Link object with streetmap
var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png").addTo(map);

//Connect with the Web Feature Services (WFS) and Web Map Services (WMS)


var bw_abril_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);
var bw_abril_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_agosto_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_agosto_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_calibracion_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_capital_municipal_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_caudal_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_caudal_especifico_bwii_bh_cesp = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_cobertura_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_corto_plazo_precipitacion_bw_cambio_ppt_sequia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_corto_plazo_precipitacion_bw_proyeccion_p = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_corto_plazo_temperatura_bw_cambio_t_sequia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_diciembre_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_diciembre_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_djf_bw_indice_combinado_1 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_enero_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_enero_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_escorrentia_bwii_bh_esct = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_evapotranspiracion_bwii_bh_ppt = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_eventos_sequia_agrometeorologica_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_eventos_sequia_agrometeorologica_extrema_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_eventos_sequia_agrometeorologica_leve_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_eventos_sequia_agrometeorologica_moderada_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_eventos_sequia_agrometeorologica_severa_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_febrero_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_febrero_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_indice_de_aridez_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_indice_de_aridez_bwii_bh_ppt  = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_jja_bw_indice_combinado_1 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_julio_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_julio_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_junio_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_junio_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_lago_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_lagos_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_limite_municipal_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_limite_nacional_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_limites_internacionales_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_macrocuencas_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_macrocuencas_bwii_bh_ia2 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mam_bw_indice_combinado_1 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_marzo_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_marzo_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mayo_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mayo_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mediano_plazo_precipitacion_bw_cambio_ppt_sequia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mediano_plazo_precipitacion_bw_proyeccion_p = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_mediano_plazo_temperatura_bw_cambio_t_sequia_ = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_municipios_bw_indice_combinado_1 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_noviembre_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_noviembre_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_nubosidad_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_octubre_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_octubre_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_precipitacion_bwii_bh_ppt = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_precipitacion_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_regiones_hidroclimaticas_bw_enso = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_ríos_bw_indice_combinado_2 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_rios_bw_cambio_ppt_sequia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_ríos_bw_indice_combinado_2 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_rios_bwii_bh_ia = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_salares_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_septiembre_bw_frecuencia_sequias_videci = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_septiembre_bwii_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_sequia_spei_djf_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_sequia_spei_jja_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_sequia_spei_mam_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_sequia_spei_son_bw_cambio_spei = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_son_bw_indice_combinado_1 = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_sst_promedio_bw_enso = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_t_proyeccion_2030__bw = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_t_proyeccion_2050_bw = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_temperatura_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

var bw_viento_bwii_clima_bh = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{ Layers : "", format : "image/png", transparent : true }).addTo(map);

 
 var abril_bh_qa = L.tileLayer.wms("http://localhost:8080/geoserver/BW_Geoportal/wms?",{
					Layers : "bw_agosto_bw_frecuencia_sequias_videci",
					format : "image/png",
					transparent : true

}).addTo(map);