/*
																	Water Resources Management using PostgreSQL and PgAdmin4
																				Area of Interest (South America)
															 					 Developed by MSc Carlos Mendez
																														 
MOST TABLES AND DATASETS USED:

1. South America Countries and Boundary 
2. HydroSHEDS (Conditioned DEM)
3. HydroBASINS (Level 1,2,3,4,5,6,7,8,9,10,11 and 12)
4. HydroRIVERS
5. HydroLAKES
6. Global Lakes and Wetlands Database (GLWD)
7. HydroWASTE
8. Global River Classification (GloRiC)
9. Lake TEMP
10. Global Power Plant Database (GPPD)
11. Firt Level Administrative Units (FLAU)
12. Second Level Administrative Units (SLAU)

*/

--- General Steps

--- Register a new SERVER, for example 'Water_Server'

--- Create a new DATABASE, for example 'master_gdb' 
CREATE DATABASE master_gdb
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
ALTER DATABASE master_gdb OWNER TO support;

--- create extensions related with PostGIS

create EXTENSION postgis;

create EXTENSION fuzzystrmatch;

create EXTENSION postgis_raster;

create EXTENSION postgis_topology;

create EXTENSION postgis_sfcgal;

create EXTENSION postgis_tiger_geocoder;

/* 
Connect GIS data using PostGIS and import shapefiles (.shp) using the function shp2pgsql
Try to run the following scripts in the Terminal of Windows/macOS/Linux:

First, Open the shp2pgsql.exe in the local directory 
C:\Program Files\PostgreSQL\17\bin\shp2pgsql.exe

Second, run the script and replace the path folder and .shp files, folowing the structure 
(shp2pgsql -s <SRID> -I <path_to_shapefile.shp> <schema_name>.<table_name> > <output_file.sql>

1. South America Countries and Boundary

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_Countries.shp water_data.SA_Countries > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_Countries.sql

2. First Level Administrative Units (FLAU)

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_FLAU.shp water_data.SA_FLAU > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_FLAU.sql

3. Second Level Administrative Units (SLAU)

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_SLAU.shp water_data.SA_SLAU > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_SLAU.sql

4. HydroSHEDS 

Void DEM
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroSHEDS_Void_DEM.shp water_data.SA_hydroSHEDS_Void_DEM > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroSHEDS_Void_DEM.sql

Flow Direcion
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroSHEDS_Flow_Direction.shp water_data.SA_hydroSHEDS_Flow_Direction > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroSHEDS_Flow_Direction.sql

Flow Accumulation
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroSHEDS_Flow_Accumulation.shp water_data.SA_hydroSHEDS_Flow_Accumulation > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroSHEDS_Flow_Accumulation.sql

5. HydroBASINS (Level 1 to 12)

Level 01
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev01_v1c.shp water_data.SA_hydroBASIN_Lv01 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv01.sql

Level 02
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev02_v1c.shp water_data.SA_hydroBASIN_Lv02 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv02.sql

Level 03
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev03_v1c.shp water_data.SA_hydroBASIN_Lv03 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv03.sql

Level 04
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev04_v1c.shp water_data.SA_hydroBASIN_Lv04 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv04.sql

Level 05
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev05_v1c.shp water_data.SA_hydroBASIN_Lv05 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv05.sql

Level 06
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev06_v1c.shp water_data.SA_hydroBASIN_Lv06 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv06.sql

Level 07
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev07_v1c.shp water_data.SA_hydroBASIN_Lv07 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv07.sql

Level 08
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev08_v1c.shp water_data.SA_hydroBASIN_Lv08 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv08.sql

Level 09
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev09_v1c.shp water_data.SA_hydroBASIN_Lv09 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv09.sql

Level 10
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev10_v1c.shp water_data.SA_hydroBASIN_Lv10 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv10.sql

Level 11
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev11_v1c.shp water_data.SA_hydroBASIN_Lv11 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv11.sql

Level 12
shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\hybas_sa_lev12_v1c.shp water_data.SA_hydroBASIN_Lv12 > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroBASIN_Lv12.sql

6. HydroRIVERS

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroRIVERS.shp water_data.SA_hydroRIVERS > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroRIVERS.sql

7. HydroLAKES

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroLAKES.shp water_data.SA_hydroLAKES > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroLAKES.sql

8. Global Lakes and Wetlands Database (GLWD)

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_GLWD_Main_Class.shp water_data.SA_GLWD > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_GLWD.sql

9. HydroWASTE

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_HydroWASTE.shp water_data.SA_Hydrowaste > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroWASTE.sql

10. Global River Classification (GloRiC)

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_GloRiC.shp water_data.SA_GloRiC > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_GloRiC.sql

11. Lake TEMP

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_LakeTEMP.shp water_data.SA_LakeTemp > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_LakeTEMP.sql

12. Global Power Plant Database (GPPD)

shp2pgsql -s 4326 -I C:\Users\USUARIO\Desktop\Geodatabase\Geodatabase\SA_hydroRIVERS.shp water_data.SA_hydroRIVERS > C:\Users\USUARIO\Documents\GitHub\GeoDatabases-And-Cloud-Computing-For-Water-Resources-Management\2-Import-files(shp2sql)\SA_hydroRIVERS.sql

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