# Bolivia Watch Geoportal - AI Coding Instructions

## Project Overview
Bolivia Watch is a **geospatial data visualization geoportal** developed by Stockholm Environment Institute (SEI-LA) for monitoring and analyzing water resources and climate risks in Bolivia. It's a static web-based mapping application that integrates hydrological and climate data.

### Core Purpose
- Provide decision-makers with interactive geospatial tools for water balance assessment, watershed planning, and climate risk evaluation
- Three main thematic areas: National Water Balance (2023), Watershed Management Plans, and Climate Risk Assessment

## Architecture

### Frontend Stack
- **Mapping Library**: Leaflet.js (tile-based mapping with WMS layer support)
- **Basemaps**: OpenStreetMap, Esri Satellite, Esri Topographic
- **Data Source**: GeoServer WMS endpoint at `https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms?`
- **UI Pattern**: Multi-page static HTML with page-specific CSS and minimal JavaScript
- **Center Coordinate**: Bolivia is hardcoded as [-17.0, -64.0] with zoom level 6

### Page Structure
- `index.html` - Home/landing page with institutional information and theme buttons
- `balance.html` - Water balance visualization and analysis
- `planes.html` - Watershed plans (Planes Directores de Cuenca)
- `riesgos.html` - Climate risk assessment (includes ENSO/SST climate indices)

Each page has:
- Identical header structure with logos (Bolivia, Sweden, SEI, Bolivia Watch)
- CSS file with matching name (`balance.css`, `planes.css`, `riesgos.css`)
- JS file with matching name for page-specific interactivity
- Section-based content with buttons/interactive elements

### Data Architecture
- **SQL Directory** (`PostgreSQL_PostGIS/`): Contains 80+ SQL scripts for database initialization and data layers
- **SQL Naming Pattern**: `[VariableOrDate]_[Dataset]_[Category].sql`
  - Example: `Precipitacion_BWII_BH_PPT.sql` (Precipitation from BWII dataset, Hydrological Balance category)
  - Monthly datasets: January-December with `BWII_BH_QA` suffix
  - Seasonal datasets: DJF, JJA, MAM, SON (Southern Hemisphere seasons)
- **QGIS Project**: `Bolivia_Watch_Server.qgz` - GeoServer configuration and layer definitions

### Key Technology Integrations
1. **ArcGIS Maps** - Embedded iframe for SST/ENSO visualization (`riesgos.html`)
2. **GeoServer WMS** - Remote server serving geospatial layers
3. **Leaflet Plugins** - Layer control, scale bar, tile layers
4. **Google Fonts** - Inter font family via CDN

## Development Conventions

### Code Style
- **Comment Blocks**: Use wrapped line patterns with repeated characters for section headers
  - Example: `// ==========================` / `// 1. Basemaps` / `// ==========================`
- **Spanish Labels**: All UI labels and variable names in Spanish (buttons, layer names, section titles)
- **File Headers**: Every JS/HTML/CSS file includes 10-line copyright header with project metadata
- **Organization**: Code is sectioned by functionality (Basemaps → Initialize Map → Thematic Layers)

### File Organization
```
js/
  index.js       - Homepage and main map initialization
  balance.js     - Water balance map logic (currently minimal)
  planes.js      - Watershed plans map logic
  riesgos.js     - Climate risk map and ENSO/SST interaction logic

css/
  homepage.css   - Landing page multi-panel layout (left/central/right)
  balance.css    - Water balance page styling
  planes.css     - Watershed plans page styling
  riesgos.css    - Climate risk page styling (includes ENSO controls)
```

### WMS Layer Integration Pattern
- Thematic layers are added to Leaflet via WMS protocol from GeoServer
- Layer URLs follow format: `wmsUrl + "service=WMS&version=1.1.0&layers=[LAYER_NAME]"`
- Layer control enabled via `L.control.layers()` for basemap switching

### SQL Naming Convention
When modifying or adding database layers:
- Follow `[Variable/Period]_[Dataset]_[Category].sql` pattern
- Reference dataset suffixes: `BWII` (Hydrological Balance v2), `BW` (Bolivia Watch)
- Category suffixes: `BH` (Balance Hídrico), `Clima`, `ENSO`, `Cambio_PPT_Sequia`, etc.

## When Adding Features

### Adding a New Thematic Layer
1. Create SQL script in `PostgreSQL_PostGIS/` following naming convention
2. Import into GeoServer and update `Bolivia_Watch_Server.qgz`
3. Add WMS layer reference to appropriate JS file (e.g., `index.js`, `balance.js`)
4. Update layer control via `L.control.layers()` to make layer toggleable

### Adding a New Page/Theme
1. Create new HTML file with standard structure (header, banner, content sections)
2. Create corresponding CSS file with page styling
3. Create corresponding JS file with Leaflet map initialization
4. Include link button in `index.html` home page
5. Copy copyright header from existing files (maintain consistency)

### Modifying Maps
- Edit `index.js` for the main map (homepage, balance page)
- Always maintain the center [-17.0, -64.0] for Bolivia
- Update `wmsUrl` if GeoServer endpoint changes
- Preserve basemap structure (OSM, Esri Satellite, Esri Topo)

## Project Metadata
- **License**: Apache 2.0
- **Developer**: Carlos Mendez (Research Associate I, SEI-LA)
- **Repository**: https://github.com/sei-latam/Bolivia_Watch_Geoportal
- **Live Site**: https://sei-latam.github.io/Bolivia_Watch_Geoportal/
- **Deployment**: GitHub Pages (static site)
- **Data Source**: PostgreSQL/PostGIS with GeoServer frontend
- **Owner**: Stockholm Environment Institute - Latin America (SEI-LA)

## Common Tasks

- **Update GeoServer Layer**: Modify SQL in `PostgreSQL_PostGIS/`, refresh QGIS project, restart GeoServer
- **Change Map Center/Zoom**: Edit `center` and `zoom` properties in `L.map()` call
- **Add Layer Toggle**: Add object entry to `baseMaps` or thematic layers object, update layer control
- **Deploy Changes**: Push to GitHub main branch; GitHub Pages auto-deploys static files
