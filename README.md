# contour_tooling
AWK scripts to generate ArcPy for topographic-bathymetric contouring on very fine grids.
## AWK tools for contouring in ArcGIS

These scripts were created to help analyze large raster surfaces (8 GB--80 GB) to detailed topographic-bathymetric contours.
Using Esri ArcGIS 10.2.2 and 10.3 for Desktop, stability issues required the use of ContourList() calls on clipped terrain grid extents.
Also, to avoid redundant storage, a single surface (meters in x,y,z) was analyzed for both metric and US customary contours, facilitated by ArcPy scripting and appropriately generated Feature Class names.

ArcGIS Python dialect, [ArcPy](http://resources.arcgis.com/en/help/main/10.2/index.html#/What_is_ArcPy/000v000000v7000000/) packages access to several hundred geoporcessing functions that can be licensed from Esri as ArcGIS for Desktop and its extensions.  As a Windows 32-bit application, there are occasional stability issues when analyzing large raster inputs or producing large vector outputs.  Doing both at the same time, as when analyzing a finely detailed terrain with frequent topographic contours, is an exercise in patience.  These scripts were created to help with that issue.

By software engineering standards, these scripts could appear appallingly ugly---and yet they bear the scars of actual use.  The workflow that inspired their use analyzed single-precision floating point grids from [40k by 45k] on the smallest to [125k by 150k] on the largest size.  The vector features were output to Esri File Geodatabase format for performance in use, and exceeded 3 GB of feature detail.

Attempts were made to keep the largest possible areas contiguous for improved contour-drawing performance in desktop environment.  Stability of Esri's 32-bit application led to an adaptation where the terrain was split into five sectors based on somewhat subtle characteristics.  

### Installation

* Select **File > Extension Manager...** (or click the "brick" icon in the toolbar)
* Search for "Markdown Preview"
* Click the **Install** button

### How To Use
When a markdown document (with extension ".md" or ".markdown") is open, a markdown icon is shown in the 
toolbar at the top of the Brackets window. Click this icon to open the preview panel. The panel can be 
resized vertically.

The preview is updated as you edit the document. You can hover over links to see the href in a tooltip,
or click them to open in your default browser.

Hover over the preview area to show the settings "gear" icon. Click this icon to change the settings.

### Settings

#### Format
By default, the document is rendered as standard Markdown. Change the dropdown to "GitHub-Flavored (GFM)" 
to see the Markdown as it would appear in a GitHub issue, pull request, or comment.

#### Theme
There are three themes available: 

* Light - Black text on a light background, similar to GitHub wiki pages.
* Dark - Light text on a dark background.
* Classic - Black text with a serif font on a light background

#### Sync scroll position
When checked, scrolling in the editor scrolls the preview to roughly the same location. 
The scroll position of the preview is based on the scroll position of the source document, so the 
position may be out of sync if you have really long lines in your source file. Scroll synchronization
works best when the preview and code view are the same height.

### Credits
This extension uses the following open source components:

* [Marked](https://github.com/chjj/marked) - A markdown parser written in JavaScript
* [markdown-css-themes](https://github.com/jasonm23/markdown-css-themes) - The themes are based on the "Swiss" theme
* [markdown-mark](https://github.com/dcurtis/markdown-mark) - The icon used in the toolbar
