BEGIN {

#
#  This AWK code generates Python for pasting into the ESRI ArcGIS 10.1 Python window.
#  it simply invokes an ArcPy statement with a "gp.xxx" syntax, but usefully
#  iterates through elevations in small steps producing meaningful Feature Class Names
#  
#  usage:
#  $ awk -f clist01o10.awk > clist01o10.py
#  
#  the Python is intended for pasting into an ArcMap or ArcCatalog Python window
#  Use of ContourList in the style automated by this script was motivated by
#
#    1) ArcGIS stability issues that only support about 5 contour levels per call
#    2) a need for having the process write out Feature Classes frequently to preserve incremental progress
#    3) a need for QA-supporting Feature Class names that indicate the range of elevation contours contained
#    4) adapt to variable contour intervals, such as finer intervals near sea levels
# 
#  developed 20121114 (bbq) to create Marin county-wide contours from a median-filtered smoothed terrain surface of file size 25GB
#  adapted 20141025 (bbq) for HUC8-extent contours on tbsm141cm in west Marin County
#  example product Esri File Geodatabase [3 GB download] (http://3dg.is/Marin_NHD_Local/Marin_NHD_west_contours_201502.zip) 
#
# set up ArcGIS Python window environment variables for pasting into an ArcCatalog Window (no separate SA checkout)
#

printf("# Import arcpy modules\r\nimport arcpy\r\n");
printf("from arcpy import env\r\nfrom arcpy.sa import *\r\n");
printf("env.workspace = \"A:/tbsm50cm_201211/carto_contours/contours_01o10_201211.gdb/U84_N88m_data\"\r\n\r\n");

printf("# Local variables:\r\n");
printf("tbsm1m_img = \"E:\\\\MM_tbsm_201208_terrains\\\\MCM_contours\\\\tbsm1m_7cir_201211.img\"\r\n\r\n");


#  Create Python for one-meter bathymetric contour range
#
for(z=-150; z<0; z+=5)
{printf("arcpy.gp.ContourList_sa(tbsm1m_img, \"b%03dm_%03dm_liz\", \"%5.1f", -z, -z-4, z); 
for(x=z+1; x< z+5; x++){ printf(";%5.1f", x); }
printf("\")\r\n");
}
}