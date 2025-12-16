# Copilot Instructions: Bolivia Watch Geoportal

## Project Overview
Bolivia Watch Geoportal is a **web-based geospatial data visualization platform** developed by Stockholm Environment Institute - Latin America (SEI-LA) for environmental monitoring in Bolivia. It integrates hydrological, climate, and drought risk data through interactive maps and dashboards. The project is organized as a **static website with iframe-embedded mapping**—not a traditional web application with a backend API.

**Key Architecture:**
- Frontend: HTML/CSS/JavaScript (no framework dependencies)
- Maps: ArcGIS Online iframe embeds + Leaflet.js for advanced GIS
- Data: Hosted on ArcGIS Online and GeoServer (WMS)
- Hosting: GitHub Pages (static site) + ArcGIS servers for data

## Critical Workflows & Commands

### Development & Deployment
- **Live site**: `https://sei-latam.github.io/Bolivia_Watch_Geoportal/`
- **GitHub repo**: `https://github.com/sei-latam/Bolivia_Watch_Geoportal`
- **Deployment**: Direct push to `main` branch → GitHub Pages auto-publishes
- **Local testing**: Open HTML files directly in browser (no build step needed)

### Data Management
- **ArcGIS Online workspace**: `seila.maps.arcgis.com` (see `.ipynb_checkpoints/Download_ArcGIS_Online_Data-checkpoint.ipynb`)
- **GeoServer instance**: `https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms`
- **Data sync**: Python/ArcPy scripts in `PostgreSQL_PostGIS/` folder maintain SQL database connections
- **Spatial database**: PostgreSQL/PostGIS (referenced in folder structure, not directly in frontend)

## Code Organization & Patterns

### File Structure
```
index.html                  # Landing page (3-panel layout: flags, content, wallpaper)
balance.html               # National Water Balance 2023
planes.html                # Watershed Management Plans
riesgos.html               # Climate Risk Assessment

css/
  homepage.css             # 3-panel flexbox layout
  balance.css, planes.css, riesgos.css  # Page-specific styling

js/
  index.js                 # Leaflet-based interactive map (unused for current pages)
  balance.js, planes.js, riesgos.js     # Page-specific scripts (mostly empty stubs)
```

### Navigation Pattern
**Main entry point**: `index.html` → Three buttons link to thematic pages:
- "Balance Hídrico Nacional [2023]" → `balance.html`
- "Planes Directores de Cuenca" → `planes.html`
- "Evaluación de Riesgos Climáticos" → `riesgos.html`

### UI/UX Patterns

**Tab Systems** (used in balance.html, riesgos.html):
```javascript
// Pattern: data-tab/data-layer/data-var attributes + querySelector
document.addEventListener('DOMContentLoaded', () => {
  const buttons = document.querySelectorAll('.tab-btn');
  const panels = document.querySelectorAll('.tab-panel');
  
  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      const tab = btn.dataset.tab;
      panels.forEach(p => p.classList.toggle('active', p.id === `panel-${tab}`));
      buttons.forEach(b => b.classList.toggle('active', b.dataset.tab === tab));
    });
  });
});
```
**Usage examples**: 
- Study area regions (balance.html: estudio, unidades, endorreica, plata, amazonas)
- Climate variables (balance.html: precipitacion, temperatura, humedad, viento, nubosidad, cobertura)
- Drought indices (riesgos.html: spi, spei, combined indices)

**Map Embedding Pattern**:
```html
<!-- ArcGIS Online iframe with query parameters -->
<iframe id="map-climate" 
  src="https://www.arcgis.com/apps/mapviewer/index.html?layers=precipitacion" 
  frameborder="0"></iframe>

<!-- Updated dynamically via JavaScript -->
iframe.src = layerURLs[layer]; // Switch layer by updating src
```
This is the **primary way maps are displayed**—not Leaflet/interactive clients, but embedded ArcGIS viewers.

## Project-Specific Conventions

### File Headers
**Required on all files**: Use 8-line Apache 2.0 header block:
```
/*=====================================================================================================================================================*/
/*=====                       Bolivia Watch Geoportal | SEI-LA | 2025 | Apache-2.0 License                                                   =====*/
/*=====================================================================================================================================================*/
```

### CSS Organization
- **Flexbox-heavy**: 3-panel layouts (left/central/right), sidebar+content patterns
- **Color scheme**: Professional blues/grays (#f5f5f5, #333)
- **Responsive**: Use viewport width percentages (4%, 15%, 81% for panels)
- **Imports**: Google Fonts (Inter family) at top of CSS files

### HTML Structure
- **Bilingual support**: Spanish primary language (`lang="es"`)
- **Semantic sections**: `<header>`, `<section class="content">`, `<aside>`, `<main>`
- **Data attributes**: Heavy use of `data-*` for dynamic behavior (`data-tab`, `data-layer`, `data-var`)
- **Image paths**: Relative to root (`img/` folder)

### JavaScript Conventions
- **Scope**: All scripts are inline in HTML (no module system)
- **Event binding**: Via `addEventListener('click', ...)` on buttons
- **DOM selection**: `querySelector*` (no jQuery/framework)
- **State management**: Simple arrays/objects mapping layer IDs to URLs
- **No async/await**: Use traditional callbacks if needed

## Integration Points

### External Data Sources
1. **ArcGIS Online** (primary for visualization)
   - Hosted web maps and feature services
   - Embedded via iframe
   - Layer URLs follow pattern: `https://www.arcgis.com/apps/mapviewer/index.html?layers={layerName}`

2. **GeoServer WMS** (available but not currently used in UI)
   - Base URL: `https://sei-latam-bw-watch-server.publicvm.com/geoserver/Bolivia_Watch/wms?`
   - Defined in `js/index.js` (currently unused—legacy setup)

3. **PostgreSQL/PostGIS** (backend data management)
   - Folder: `PostgreSQL_PostGIS/` contains SQL maintenance scripts
   - Not directly called by frontend (data flows through ArcGIS services)

4. **QGIS Project Files** (development/editing)
   - `Bolivia_Watch_Server.qgz` (published map)
   - `BW_Geospatial_Data.aprx`, `.atbx` (ArcGIS projects)
   - Used for offline preparation; not deployed

### Third-Party Libraries
- **Leaflet.js** (in index.js): Map library for interactive mapping
- **ArcGIS API**: Embedded via iframe (no direct JavaScript SDK integration)
- **Google Fonts**: Inter typeface (`font-family: 'Inter', sans-serif`)

## Common Development Tasks

### Adding a New Thematic Page
1. Create `new-page.html` with header, sections, tab system
2. Create `css/new-page.css` with flexbox layout
3. Create `js/new-page.js` (can be empty or contain tab logic)
4. Link from `index.html` button: `onclick="location.href='new-page.html'"`
5. Add ArcGIS iframe with appropriate layer parameters

### Updating Map Layers
- **For ArcGIS maps**: Update `data-layer` attribute and `layerURLs` object in script
- **For WMS layers** (if needed): Modify WMS URL parameters in `index.js`
- **Pattern**: Map name → URL mapping, then bind via `addEventListener`

### Styling New Components
- Use **flexbox** for layout (no CSS Grid in codebase)
- Apply **class-based toggling** for active states (`.active` pseudo-class)
- Import Google Fonts at top of CSS file
- Reference images relative to `img/` folder

## Quality Assurance

- **No automated tests**: Manual browser testing only
- **Cross-browser**: Test in Chrome, Firefox, Safari (ES6 compatible)
- **Accessibility**: Images have descriptive alt text, semantic HTML used
- **Performance**: Keep JS lightweight; iframes handle heavy map rendering
- **Localization**: All UI text should be in Spanish (es)

## Documentation Sources
- README.md: Minimal (project title only—update needed)
- Code headers: File purpose documented in file headers
- Inline scripts: Comments mark script sections ("// ==== 1. Basemaps ====")
- Data dictionary: Maintained in ArcGIS Online admin (not in repo)
