# contour_tooling
AWK scripts to generate ArcPy for topographic-bathymetric contouring on very fine grids.
## AWK tools for contouring in ArcGIS

These scripts were created to help analyze large raster surfaces (8 GB--80 GB) to detailed topographic-bathymetric contours.
Using Esri ArcGIS 10.2.2 and 10.3 for Desktop, stability issues required the use of ContourList() calls on clipped terrain grid extents.
Also, to avoid redundant storage, a single surface (meters in x,y,z) was analyzed for both metric and US customary contours, facilitated by ArcPy scripting and appropriately generated Feature Class names.

ArcGIS Python dialect, [ArcPy](http://resources.arcgis.com/en/help/main/10.2/index.html#/What_is_ArcPy/000v000000v7000000/) packages access to several hundred geoporcessing functions that can be licensed from Esri as ArcGIS for Desktop and its extensions.  As a Windows 32-bit application, there are occasional stability issues when analyzing large raster inputs or producing large vector outputs.  Doing both at the same time, as when analyzing a finely detailed terrain with frequent topographic contours, is an exercise in patience.  These scripts were created to help with that issue.

By software engineering standards, these scripts could appear appallingly ugly---and yet they bear the scars of actual use.  The workflow that inspired their use analyzed single-precision floating point grids from [40k by 45k] on the smallest to [125k by 150k] on the largest size.  The vector features were output to Esri File Geodatabase format for performance in use, and exceeded 3 GB of feature detail.

Attempts were made to keep the largest possible areas contiguous for improved contour-drawing performance in desktop environment.  Stability of Esri's 32-bit application led to an adaptation where the terrain was split into five sectors based on somewhat subtle characteristics.  

### Use

* have access to awk, either through your OS or via Cygwin
* In ArcGIS, at least try the Contour tool to verify that it can't work all at once
* If not, then get a feel for the Contour List tool, prepare a File Geodatabase and possibly a Feature Dataset within it to receive contours
* In the Contour List dialog, provide input grid and output File Geodatabasae, and a couple of contour values to confirm source and destination work
* From the Geoprocessing > Results window, convert Contour List to a Python snippet for use as a template with your paths to test the AWK script
* Edit the clist0.awk to fit your paths, and the desired range of outputs

Then provide input and redirect output to a Python snippet for pasting into ArcCatalog

`$ awk -f clist0.awk > clist0.py`

The script can generate thousands of ContourList calls, each with unique and somewhat informative Feature Class names.

### Phrasing

This script exists to automate the search for the most extensive grid that will not crash ArcMap contouring, while capturing progress frequently enough with complete Feature Class writes to the File Geodatabase.  Ideally, the input grid need not be split into very many pieces, so that resulting contours are more continuous.  Likewise, a given Feature Class should not have so many contour levels that it takes tens of minutes to complete.

There are subtle aspects of the input terrain that may cause excessively long contours, at certain elevations.  Near these elevations, far fewer contour lines should be created from a single call to Contour List.  Near the highest elevations, contours may be ringing a summit and many more can be run.

### Example product

A set of these scripts were used during 2014-11 to produce a 1m-interval topo-bathy contour set for over 1000 square km.
The Esri File Geodatabase that contains the contours, merged to five Feature Classes of total size 3 GB, [posted for one's downloading convenience](http://3dg.is/Marin_NHD_Local/Marin_NHD_west_contours_201502.zip).  If explored, it is recommended to extract the File GDB archive to a local SSD and view in Esri ArcMap 10.3

### Credits
This AWK script generates ArcPy that iterates through elevation ranges while creating descriptive Feature Class names at every iteration.