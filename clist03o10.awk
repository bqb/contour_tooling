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


# -------------------------------------------------
printf("\r\n#  Run the NWly quadrant\r\n\r\n");

printf("tbsm1m_img = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\tbsm1m_7cir_nw.img\"\r\n\r\n");

#  Create Python for quarter-meter bathymetric contour range
for(z=-2; z<0; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\b%03dcm_%03dcm_nw_liz\"\r\n", -100*z, -100*z - 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f",  z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}


#  Create Python for quarter-meter topographic contour range
for(z=0; z<6; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\t%03dcm_%03dcm_nw_liz\"\r\n", -100*z, -100*z + 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f", z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}


# -------------------------------------------------
printf("\r\n#  Run the SEly quadrant\r\n\r\n");

printf("tbsm1m_img = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\tbsm1m_7cir_se.img\"\r\n\r\n");

#  Create Python for quarter-meter bathymetric contour range
for(z=-2; z<0; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\b%03dcm_%03dcm_se_liz\"\r\n", -100*z, -100*z - 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f",  z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}

#  Create Python for quarter-meter topographic contour range
for(z=0; z<6; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\t%03dcm_%03dcm_se_liz\"\r\n", -100*z, -100*z + 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f", z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}


# -------------------------------------------------
printf("\r\n#  Run the SWly quadrant\r\n\r\n");
printf("tbsm1m_img = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\tbsm1m_7cir_sw.img\"\r\n\r\n");

#  Create Python for quarter-meter bathymetric contour range
for(z=-2; z<0; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\b%03dcm_%03dcm_sw_liz\"\r\n", -100*z, -100*z - 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f",  z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}

#  Create Python for quarter-meter topographic contour range
for(z=0; z<6; z++)
{
printf("outpath = \"G:\\\\ArcGISShare\\\\Geodatabase\\\\TBSM_builds\\\\carto_contours\\\\contours_03o10_201211.gdb\\\\U84_N88m_data\\\\t%03dcm_%03dcm_sw_liz\"\r\n", -100*z, -100*z + 75);
printf("arcpy.gp.ContourList_sa(tbsm1m_img, outpath, \"%5.2f", z); 
for(x=z+0.25; x< z+1; x+=0.25){ printf(";%5.2f", x); }
printf("\")\r\n");
}

}