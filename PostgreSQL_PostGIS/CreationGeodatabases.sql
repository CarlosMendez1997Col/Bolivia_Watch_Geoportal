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
--- Register a new SERVER, 'SEI_Server'

--- Create a new DATABASE, 'bW_Database' 
CREATE DATABASE bw_database
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--- Create an user with permissions, for example 'support'
CREATE ROLE support WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	NOREPLICATION
	BYPASSRLS
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';
COMMENT ON ROLE support IS 'support data';

--- Change the administrator and set 'Support'
ALTER DATABASE bw_database OWNER TO support;

--- Create new Schema 'bw_data'
CREATE SCHEMA bw_data
    AUTHORIZATION postgres;

--- create extensions related with PostGIS

CREATE EXTENSION h3 SCHEMA bw_data;
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis SCHEMA bw_data;

CREATE EXTENSION h3_postgis SCHEMA bw_data;
CREATE EXTENSION postgis_raster SCHEMA bw_data;
CREATE EXTENSION postgis_sfcgal SCHEMA bw_data;

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


shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Abril_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\Abril_BW_Frecuencia_Sequias_VIDECI.shp bw_data.bw_Abril_BW_Frecuencia_Sequias_VIDECI > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Abril_BW_Frecuencia_Sequias_VIDECI.sql

Abril_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\Abril_BWII_BH_QA.shp bw_data.bw_Abril_BWII_BH_QA > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\Abril_BWII_BH_QA.sql

Agosto_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Agosto_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Calibracion_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Capital_municipal_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Caudal_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Caudal_especifico_BWII_BH_CESP.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Cobertura_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

corto_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

corto_plazo_precipitacion_BW_Proyeccion_P.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

corto_plazo_temperatura_BW_Cambio_T_Sequia.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Country_border_BW_ENSO.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Diciembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Diciembre_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

DJF_BW_Indice_Combinado_1.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Enero_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Enero_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Escorrentia_BWII_BH_ESCT.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Evapotranspiracion_BWII_BH_PPT.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

eventos_sequia_agrometeorologica_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

eventos_sequia_agrometeorologica_Extrema_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

eventos_sequia_agrometeorologica_Leve_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

eventos_sequia_agrometeorologica_Moderada_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

eventos_sequia_agrometeorologica_Severa_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Febrero_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Febrero_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Humedad_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Indice_de_aridez_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Indice_de_aridez_BWII_BH_PPT.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Indices_BW_ENSO.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

JJA_BW_Indice_Combinado_1.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Julio_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Julio_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Junio_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Junio_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Lago_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Lagos_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Limite_municipal_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Limite_nacional_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Limites_internacionales_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Macrocuencas_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Macrocuencas_BWII_BH_IA2.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

MAM_BW_Indice_Combinado_1.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Marzo_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Marzo_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Mayo_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Mayo_BWII_BH_QA.shp Media_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

mediano_plazo_precipitacion_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

mediano_plazo_precipitacion_BW_Proyeccion_P.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

mediano_plazo_temperatura_BW_Cambio_T_Sequia_.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Municipios_BW_Indice_Combinado_1.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Noviembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Noviembre_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Nubosidad_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Octubre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Octubre_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Precipitacion_BWII_BH_PPT.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Precipitacion_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Regiones_Hidroclimaticas_BW_ENSO.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Rios_BW_Cambio_PPT_Sequia.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Ríos_BW_Indice_Combinado_2.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Rios_BWII_BH_IA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Salares_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Septiembre_BW_Frecuencia_Sequias_VIDECI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Septiembre_BWII_BH_QA.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Sequia_SPEI_DJF_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Sequia_SPEI_JJA_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Sequia_SPEI_MAM_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Sequia_SPEI_SON_BW_Cambio_SPEI.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

SON_BW_Indice_Combinado_1.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

SST_Promedio_BW_ENSO.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

T_proyeccion_2030__BW.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

T_proyeccion_2050_BW.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Temperatura_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql

Viento_BWII_Clima_BH.shp 
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Shapefiles\ bw_data.bw_ > C:\Users\USUARIO\Documents\GitHub\Bolivia_Watch_Geoportal\PostgreSQL_PostGIS\.sql


*/

-- Rename table GLWD
ALTER TABLE IF EXISTS water_data.sa_glwd_main_class
    RENAME TO sa_glwd;

SELECT country, ST_Transform( geom, 4326)
FROM water_data.sa_countries
WHERE country = 'Colombia';

SELECT Count(*)
FROM water_data.sa_gloric;

SELECT SUM (elevation)
FROM water_data.sa_hydrolakes
WHERE country_1 = 'Brazil';

SELECT municipali, Count(*)
FROM water_data.sa_slau
GROUP BY municipali;

/*
--- Create a table with fields
CREATE TABLE water_categories(Hybas_ID int, water_description varchar(30));

--- Modify users and fields
ALTER TABLE IF EXISTS public.water_categories
    ALTER COLUMN hybas_id SET NOT NULL;
ALTER TABLE IF EXISTS public.water_categories
    ALTER COLUMN water_description SET NOT NULL;
ALTER TABLE IF EXISTS public.water_categories
    ADD PRIMARY KEY (hybas_id);

--- Delete table with fields
DROP TABLE water_categories;

--- Insert data and rows into water_categories
INSERT INTO water_categories(hybas_id,water_description) VALUES(123456,'Main Basin');
INSERT INTO water_categories(hybas_id,water_description) VALUES(7890,'Basin2');

--- Update data
UPDATE water_categories SET water_description = 'Basin' WHERE hybas_id = 123456;

--- Delete ROWS
DELETE FROM water_categories WHERE hybas_id = 123456;
DELETE FROM water_categories WHERE hybas_id = 7890;

CREATE SCHEMA water_data
    AUTHORIZATION postgres;

--- Delete DATABASE
drop DATABASE master_gdb;	

--- delete user with permissions 
drop ROLE SUPPORT;

*/