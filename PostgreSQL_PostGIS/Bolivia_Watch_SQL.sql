/*
																	 				Bolivia Watch Geoportal
																			  THE STOCKHOLM ENVIRONMENT INSTITUTE (SEI)
															 					 Developed by MSc Carlos Mendez
																														 
Index of Data and Shapefiles:

"Abril_BW_Frecuencia_Sequias_VIDECI.shp" 
"Abril_BWII_BH_QA.shp" 
"Agosto_BW_Frecuencia_Sequias_VIDECI.shp" 
"Agosto_BWII_BH_QA.shp" 
"Calibracion_BWII_BH_IA.shp" 
"Capital_municipal_BWII_BH_IA.shp" 
"Caudal_BW_Frecuencia_Sequias_VIDECI.shp" 
"Caudal_especifico_BWII_BH_CESP.shp" 
"Cobertura_BWII_Clima_BH.shp" 
"corto_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp" 
"corto_plazo_precipitacion_BW_Proyeccion_P.shp" 
"corto_plazo_temperatura_BW_Cambio_T_Sequia.shp" 
"Country_border_BW_ENSO.shp" 
"Diciembre_BW_Frecuencia_Sequias_VIDECI.shp" 
"Diciembre_BWII_BH_QA.shp" 
"DJF_BW_Indice_Combinado_1.shp" 
"Enero_BW_Frecuencia_Sequias_VIDECI.shp" 
"Enero_BWII_BH_QA.shp" 
"Escorrentia_BWII_BH_ESCT.shp" 
"Evapotranspiracion_BWII_BH_PPT.shp" 
"eventos_sequia_agrometeorologica_BW_Cambio_SPEI.shp" 
"eventos_sequia_agrometeorologica_Extrema_BW_Cambio_SPEI.shp" 
"eventos_sequia_agrometeorologica_Leve_BW_Cambio_SPEI.shp" 
"eventos_sequia_agrometeorologica_Moderada_BW_Cambio_SPEI.shp" 
"eventos_sequia_agrometeorologica_Severa_BW_Cambio_SPEI.shp" 
"Febrero_BW_Frecuencia_Sequias_VIDECI.shp" 
"Febrero_BWII_BH_QA.shp" 
"Humedad_BWII_Clima_BH.shp" 
"Indice_de_aridez_BWII_BH_IA.shp" 
"Indice_de_aridez_BWII_BH_PPT.shp" 
"Indices_BW_ENSO.shp" 
"JJA_BW_Indice_Combinado_1.shp" 
"Julio_BW_Frecuencia_Sequias_VIDECI.shp" 
"Julio_BWII_BH_QA.shp" 
"Junio_BW_Frecuencia_Sequias_VIDECI.shp" 
"Junio_BWII_BH_QA.shp" 
"Lago_BWII_BH_IA.shp" 
"Lagos_BWII_BH_QA.shp" 
"Limite_municipal_BWII_Clima_BH.shp" 
"Limite_nacional_BWII_BH_IA.shp" 
"Limites_internacionales_BWII_Clima_BH.shp" 
"Macrocuencas_BWII_BH_IA.shp" 
"Macrocuencas_BWII_BH_IA2.shp" 
"MAM_BW_Indice_Combinado_1.shp" 
"Marzo_BW_Frecuencia_Sequias_VIDECI.shp" 
"Marzo_BWII_BH_QA.shp" 
"Mayo_BW_Frecuencia_Sequias_VIDECI.shp" 
"Mayo_BWII_BH_QA.shp" "Media_BWII_BH_QA.shp" 
"mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp" 
"mediano_plazo_precipitacion_BW_Proyeccion_P.shp" 
"mediano_plazo_temperatura_BW_Cambio_T_Sequia_.shp" 
"Municipios_BW_Indice_Combinado_1.shp" 
"Noviembre_BW_Frecuencia_Sequias_VIDECI.shp" 
"Noviembre_BWII_BH_QA.shp" 
"Nubosidad_BWII_Clima_BH.shp" 
"Octubre_BW_Frecuencia_Sequias_VIDECI.shp" 
"Octubre_BWII_BH_QA.shp" 
"Precipitacion_BWII_BH_PPT.shp" 
"Precipitacion_BWII_Clima_BH.shp" 
"Regiones_Hidroclimaticas_BW_ENSO.shp" 
"Rios_BW_Cambio_PPT_Sequia.shp" 
"Ríos_BW_Indice_Combinado_2.shp" 
"Rios_BWII_BH_IA.shp" 
"Salares_BW_Cambio_SPEI.shp" 
"Septiembre_BW_Frecuencia_Sequias_VIDECI.shp" 
"Septiembre_BWII_BH_QA.shp" 
"Sequia_SPEI_DJF_BW_Cambio_SPEI.shp" 
"Sequia_SPEI_JJA_BW_Cambio_SPEI.shp" 
"Sequia_SPEI_MAM_BW_Cambio_SPEI.shp" 
"Sequia_SPEI_SON_BW_Cambio_SPEI.shp" 
"SON_BW_Indice_Combinado_1.shp" 
"SST_Promedio_BW_ENSO.shp" 
"T_proyeccion_2030__BW.shp" 
"T_proyeccion_2050_BW.shp" 
"Temperatura_BWII_Clima_BH.shp" 
"Viento_BWII_Clima_BH.shp" 

*/

--- General Steps
--- Register a new SERVER, 'AWS_BW_Server'

-- CREATE A NEW SUPERUSER NAMED "geoadmin" to manage data and files
CREATE ROLE geoadmin LOGIN PASSWORD 'Camv07.19971';
GRANT rds_superuser TO geoadmin;

--- Create a new DATABASE, 'master_gdb' 
CREATE DATABASE master_gdb
    WITH
    OWNER = geoadmin
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Activate spatial extensions and POSTGIS
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS postgis_raster;
CREATE EXTENSION IF NOT EXISTS pgrouting;

-- Create new schema
CREATE SCHEMA bw_data;

/*CREATE EXTENSION postgis_tiger_geocoder SCHEMA bw_data;
CREATE EXTENSION postgis_topology SCHEMA bw_data;
*/

/* 
Connect GIS data using PostGIS and import shapefiles (.shp) using the function shp2pgsql
Try to run the following scripts in the Terminal of Windows/macOS/Linux:

First, Open the shp2pgsql.exe in the local directory 
C:\Program Files\PostgreSQL\17\bin\shp2pgsql.exe

Second, run the script and replace the path folder and .shp files, folowing the structure 
(shp2pgsql -s <SRID> -I <path_to_shapefile.shp> <schema_name>.<table_name> > <output_file.sql>

shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Abril_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Abril_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Abril_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Abril_BW_Frecuencia_Sequias_VIDECI.sql


Abril_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Abril_BWII_BH_QA.shp bw_data.bw_Abril_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Abril_BWII_BH_QA.sql


Agosto_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Agosto_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Agosto_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Agosto_BW_Frecuencia_Sequias_VIDECI.sql


Agosto_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Agosto_BWII_BH_QA.shp bw_data.bw_Agosto_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Agosto_BWII_BH_QA.sql


Calibracion_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Calibracion_BWII_BH_IA.shp bw_data.bw_Calibracion_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Calibracion_BWII_BH_IA.sql


Capital_municipal_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Capital_municipal_BWII_BH_IA.shp bw_data.bw_Capital_municipal_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Capital_municipal_BWII_BH_IA.sql


Caudal_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Caudal_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Caudal_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Caudal_BW_Frecuencia_Sequias_VIDECI.sql


Caudal_especifico_BWII_BH_CESP.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Caudal_especifico_BWII_BH_CESP.shp bw_data.bw_Caudal_especifico_BWII_BH_CESP > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Caudal_especifico_BWII_BH_CESP.sql


Cobertura_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Cobertura_BWII_Clima_BH.shp bw_data.bw_Cobertura_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Cobertura_BWII_Clima_BH.sql


corto_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\corto_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp bw_data.bw_corto_plazo_precipitacion_BW_Cambio_PPT_Sequia > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\corto_plazo_precipitacion_BW_Cambio_PPT_Sequia.sql


corto_plazo_precipitacion_BW_Proyeccion_P.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\corto_plazo_precipitacion_BW_Proyeccion_P.shp bw_data.bw_corto_plazo_precipitacion_BW_Proyeccion_P > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\corto_plazo_precipitacion_BW_Proyeccion_P.sql


corto_plazo_temperatura_BW_Cambio_T_Sequia.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\corto_plazo_temperatura_BW_Cambio_T_Sequia.shp bw_data.bw_corto_plazo_temperatura_BW_Cambio_T_Sequia > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\corto_plazo_temperatura_BW_Cambio_T_Sequia.sql


Diciembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Diciembre_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Diciembre_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Diciembre_BW_Frecuencia_Sequias_VIDECI.sql


Diciembre_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Diciembre_BWII_BH_QA.shp bw_data.bw_Diciembre_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Diciembre_BWII_BH_QA.sql


DJF_BW_Indice_Combinado_1.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\DJF_BW_Indice_Combinado_1.shp bw_data.bw_DJF_BW_Indice_Combinado_1 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\DJF_BW_Indice_Combinado_1.sql


Enero_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Enero_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Enero_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Enero_BW_Frecuencia_Sequias_VIDECI.sql


Enero_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Enero_BWII_BH_QA.shp bw_data.bw_Enero_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Enero_BWII_BH_QA.sql


Escorrentia_BWII_BH_ESCT.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Escorrentia_BWII_BH_ESCT.shp bw_data.bw_Escorrentia_BWII_BH_ESCT > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Escorrentia_BWII_BH_ESCT.sql


Evapotranspiracion_BWII_BH_PPT.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Evapotranspiracion_BWII_BH_PPT.shp bw_data.bw_Evapotranspiracion_BWII_BH_PPT > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Evapotranspiracion_BWII_BH_PPT.sql


eventos_sequia_agrometeorologica_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\eventos_sequia_agrometeorologica_BW_Cambio_SPEI.shp bw_data.bw_eventos_sequia_agro_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\eventos_sequia_agro_BW_Cambio_SPEI.sql


eventos_sequia_agrometeorologica_Extrema_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\eventos_sequia_agrometeorologica_Extrema_BW_Cambio_SPEI.shp bw_data.bw_eventos_sequia_agro_Extrema_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\eventos_sequia_agro_Extrema_BW_Cambio_SPEI.sql


eventos_sequia_agrometeorologica_Leve_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\eventos_sequia_agrometeorologica_Leve_BW_Cambio_SPEI.shp bw_data.bw_eventos_sequia_agro_Leve_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\eventos_sequia_agro_Leve_BW_Cambio_SPEI.sql


eventos_sequia_agrometeorologica_Moderada_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\eventos_sequia_agrometeorologica_Moderada_BW_Cambio_SPEI.shp bw_data.bw_eventos_sequia_agro_Moderada_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\eventos_sequia_agro_Moderada_BW_Cambio_SPEI.sql


eventos_sequia_agrometeorologica_Severa_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\eventos_sequia_agrometeorologica_Severa_BW_Cambio_SPEI.shp bw_data.bw_eventos_sequia_agro_Severa_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\eventos_sequia_agro_Severa_BW_Cambio_SPEI.sql


Febrero_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Febrero_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Febrero_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Febrero_BW_Frecuencia_Sequias_VIDECI.sql


Febrero_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Febrero_BWII_BH_QA.shp bw_data.bw_Febrero_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Febrero_BWII_BH_QA.sql


Humedad_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Humedad_BWII_Clima_BH.shp bw_data.bw_Humedad_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Humedad_BWII_Clima_BH.sql


Indice_de_aridez_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Indice_de_aridez_BWII_BH_IA.shp bw_data.bw_Indice_de_aridez_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Indice_de_aridez_BWII_BH_IA.sql


Indice_de_aridez_BWII_BH_PPT.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Indice_de_aridez_BWII_BH_PPT.shp bw_data.bw_Indice_de_aridez_BWII_BH_PPT > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Indice_de_aridez_BWII_BH_PPT.sql


JJA_BW_Indice_Combinado_1.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\JJA_BW_Indice_Combinado_1.shp bw_data.bw_JJA_BW_Indice_Combinado_1 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\JJA_BW_Indice_Combinado_1.sql


Julio_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Julio_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Julio_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Julio_BW_Frecuencia_Sequias_VIDECI.sql


Julio_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Julio_BWII_BH_QA.shp bw_data.bw_Julio_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Julio_BWII_BH_QA.sql


Junio_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Junio_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Junio_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Junio_BW_Frecuencia_Sequias_VIDECI.sql


Junio_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Junio_BWII_BH_QA.shp bw_data.bw_Junio_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Junio_BWII_BH_QA.sql


Lago_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Lago_BWII_BH_IA.shp bw_data.bw_Lago_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Lago_BWII_BH_IA.sql


Lagos_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Lagos_BWII_BH_QA.shp bw_data.bw_Lagos_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Lagos_BWII_BH_QA.sql


Limite_municipal_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Limite_municipal_BWII_Clima_BH.shp bw_data.bw_Limite_municipal_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Limite_municipal_BWII_Clima_BH.sql


Limite_nacional_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Limite_nacional_BWII_BH_IA.shp bw_data.bw_Limite_nacional_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Limite_nacional_BWII_BH_IA.sql


Limites_internacionales_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Limites_internacionales_BWII_Clima_BH.shp bw_data.bw_Limites_internacionales_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Limites_internacionales_BWII_Clima_BH.sql


Macrocuencas_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Macrocuencas_BWII_BH_IA.shp bw_data.bw_Macrocuencas_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Macrocuencas_BWII_BH_IA.sql


Macrocuencas_BWII_BH_IA2.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Macrocuencas_BWII_BH_IA2.shp bw_data.bw_Macrocuencas_BWII_BH_IA2 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Macrocuencas_BWII_BH_IA2.sql


MAM_BW_Indice_Combinado_1.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\MAM_BW_Indice_Combinado_1.shp bw_data.bw_MAM_BW_Indice_Combinado_1 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\MAM_BW_Indice_Combinado_1.sql


Marzo_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Marzo_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Marzo_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Marzo_BW_Frecuencia_Sequias_VIDECI.sql


Marzo_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Marzo_BWII_BH_QA.shp bw_data.bw_Marzo_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Marzo_BWII_BH_QA.sql


Mayo_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Mayo_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Mayo_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Mayo_BW_Frecuencia_Sequias_VIDECI.sql


Mayo_BWII_BH_QA.shp Media_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Mayo_BWII_BH_QA.shp Media_BWII_BH_QA.shp bw_data.bw_Mayo_BWII_BH_QA.shp Media_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Mayo_BWII_BH_QA.shp Media_BWII_BH_QA.sql


mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp bw_data.bw_mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia.sql


mediano_plazo_precipitacion_BW_Proyeccion_P.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\mediano_plazo_precipitacion_BW_Proyeccion_P.shp bw_data.bw_mediano_plazo_precipitacion_BW_Proyeccion_P > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\mediano_plazo_precipitacion_BW_Proyeccion_P.sql


mediano_plazo_temperatura_BW_Cambio_T_Sequia_.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\mediano_plazo_temperatura_BW_Cambio_T_Sequia_.shp bw_data.bw_mediano_plazo_temperatura_BW_Cambio_T_Sequia_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\mediano_plazo_temperatura_BW_Cambio_T_Sequia_.sql


Municipios_BW_Indice_Combinado_1.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Municipios_BW_Indice_Combinado_1.shp bw_data.bw_Municipios_BW_Indice_Combinado_1 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Municipios_BW_Indice_Combinado_1.sql


Noviembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Noviembre_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Noviembre_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Noviembre_BW_Frecuencia_Sequias_VIDECI.sql


Noviembre_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Noviembre_BWII_BH_QA.shp bw_data.bw_Noviembre_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Noviembre_BWII_BH_QA.sql


Nubosidad_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Nubosidad_BWII_Clima_BH.shp bw_data.bw_Nubosidad_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Nubosidad_BWII_Clima_BH.sql


Octubre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Octubre_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Octubre_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Octubre_BW_Frecuencia_Sequias_VIDECI.sql


Octubre_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Octubre_BWII_BH_QA.shp bw_data.bw_Octubre_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Octubre_BWII_BH_QA.sql


Precipitacion_BWII_BH_PPT.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Precipitacion_BWII_BH_PPT.shp bw_data.bw_Precipitacion_BWII_BH_PPT > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Precipitacion_BWII_BH_PPT.sql


Precipitacion_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Precipitacion_BWII_Clima_BH.shp bw_data.bw_Precipitacion_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Precipitacion_BWII_Clima_BH.sql


Regiones_Hidroclimaticas_BW_ENSO.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Regiones_Hidroclimaticas_BW_ENSO.shp bw_data.bw_Regiones_Hidroclimaticas_BW_ENSO > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Regiones_Hidroclimaticas_BW_ENSO.sql


Rios_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Rios_BW_Cambio_PPT_Sequia.shp bw_data.bw_Rios_BW_Cambio_PPT_Sequia > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Rios_BW_Cambio_PPT_Sequia.sql


Ríos_BW_Indice_Combinado_2.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Ríos_BW_Indice_Combinado_2 bw_data.bw_Rios_BW_Indice_Combinado_2 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Ríos_BW_Indice_Combinado_2.sql


Rios_BWII_BH_IA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Rios_BWII_BH_IA.shp bw_data.bw_Rios_BWII_BH_IA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Rios_BWII_BH_IA.sql


Salares_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Salares_BW_Cambio_SPEI.shp bw_data.bw_Salares_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Salares_BW_Cambio_SPEI.sql


Septiembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Septiembre_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Septiembre_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Septiembre_BW_Frecuencia_Sequias_VIDECI.sql


Septiembre_BWII_BH_QA.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Septiembre_BWII_BH_QA.shp bw_data.bw_Septiembre_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Septiembre_BWII_BH_QA.sql


Sequia_SPEI_DJF_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Sequia_SPEI_DJF_BW_Cambio_SPEI.shp bw_data.bw_Sequia_SPEI_DJF_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Sequia_SPEI_DJF_BW_Cambio_SPEI.sql


Sequia_SPEI_JJA_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Sequia_SPEI_JJA_BW_Cambio_SPEI.shp bw_data.bw_Sequia_SPEI_JJA_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Sequia_SPEI_JJA_BW_Cambio_SPEI.sql


Sequia_SPEI_MAM_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Sequia_SPEI_MAM_BW_Cambio_SPEI.shp bw_data.bw_Sequia_SPEI_MAM_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Sequia_SPEI_MAM_BW_Cambio_SPEI.sql


Sequia_SPEI_SON_BW_Cambio_SPEI.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Sequia_SPEI_SON_BW_Cambio_SPEI.shp bw_data.bw_Sequia_SPEI_SON_BW_Cambio_SPEI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Sequia_SPEI_SON_BW_Cambio_SPEI.sql


SON_BW_Indice_Combinado_1.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\SON_BW_Indice_Combinado_1.shp bw_data.bw_SON_BW_Indice_Combinado_1 > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\SON_BW_Indice_Combinado_1.sql


T_proyeccion_2030__BW.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\T_proyeccion_2030__BW.shp bw_data.bw_T_proyeccion_2030__BW > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\T_proyeccion_2030__BW.sql


T_proyeccion_2050_BW.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\T_proyeccion_2050_BW.shp bw_data.bw_T_proyeccion_2050_BW > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\T_proyeccion_2050_BW.sql


Temperatura_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Temperatura_BWII_Clima_BH.shp bw_data.bw_Temperatura_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Temperatura_BWII_Clima_BH.sql


Viento_BWII_Clima_BH.shp 
shp2pgsql -s 3857 -I C:\Users\USUARIO\Desktop\Shapefiles\Viento_BWII_Clima_BH.shp bw_data.bw_Viento_BWII_Clima_BH > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Viento_BWII_Clima_BH.sql

*/