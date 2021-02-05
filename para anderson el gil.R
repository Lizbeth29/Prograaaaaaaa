library(mapview)
library(tmap)     
library(sf)        
library(raster)    
library(readr)       
library(maps)        
library(spData)      
library(viridisLite) 
library(viridis)     
library(RColorBrewer)
display.brewer.all() 
library(ggplot2)     
library(sp)          
library(ncdf4)       
library(dplyr)


RIOS_INUNDACION <- st_read("Areas inundables minam geogpsperu juansuyo.shp")
COM_CAMPESINAS <- st_read("Comunidades Campesinas Minagri geogpsperu juansuyo.shp")
LIMITE_DEPARTAMENTAL <- st_read("INEI_LIMITE_DEPARTAMENTAL_GEOGPSPERU_JUANSUYO_931381206.shp")
ZONA_SISMO <- st_read("zona_sismica_vivienda_ds_003_2016_geogpsperu.shp")
EROSION_SUELO <- st_read("Erosion_Suelo_Hidrica_Pluvial_2014.shp")
EROSION_SUELOorden <- EROSION_SUELO[with(EROSION_SUELO, order(EROSION_SUELO$RANGO)), ]
View(EROSION_SUELOorden)


head(EROSION_SUELO)
head(LIMITE_DEPARTAMENTAL)
head(RIOS_INUNDACION)
head(ZONA_SISMO)
head(COM_CAMPESINAS)

View(LIMITE_DEPARTAMENTAL)
View(RIOS_INUNDACION)
View(ZONA_SISMO)
View(COM_CAMPESINAS)

#inundaciones
tmap_mode("plot")


tm_shape(LIMITE_DEPARTAMENTAL) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("NOMBDEP", title = "REGIONES",
          palette = 'Greys',
          style = 'cat') + tm_borders ( col  =  " black " )+ #bordes
  tm_layout(legend.bg.color = "black", 
            legend.bg.alpha= 0.1, 
            legend.frame=TRUE, 
            legend.height = 0.05, 
            legend.text.color = "black", 
            legend.title.color = "black", legend.title.fontface = 4, legend.position = c(0.05,0.05), legend.outside = T, legend.outside.position = "right", legend.outside.size = 0.55) +
  tm_layout(frame = T,
            main.title = 'LAS COMUNIDADES AFECTADAS POR LAS INUNDACIONES DE LOS RIOS EN EL PERU',
            main.title.size = 0.8,
            fontface = 3,
            fontfamily = 'serif',
            main.title.position = c(0.02,0.5)) + 
  tm_scale_bar(text.size = 0.35,
               width = 0.25,
               color.dark = 'White',
               color.light = 'black',
               position = c(0.4,0.05))+
  tm_compass(position = c(0.02,0.85)) + 
  tm_shape(COM_CAMPESINAS) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("nom_dpto", title = "COMUNIDADES CAMPESINAS",
          palette = 'red',
          style = 'cat') +
tm_shape(RIOS_INUNDACION) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("REGIóN2", title = "INUNDACIONES DE LOS RIOS",
          palette = 'green',
          style = 'cat') +
  tm_layout(bg.color = "white")+tm_layout ( bg.color  =  " skyblue " )
  
  

#sismos
tm_shape(LIMITE_DEPARTAMENTAL) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("NOMBDEP", title = "REGIONES",
          palette = 'Greys',
          style = 'cat') +tm_borders ( col  =  " black " )+#bordes
  tm_layout(legend.bg.color = "black", 
            legend.bg.alpha= 0.1, 
            legend.frame=TRUE, 
            legend.height = 0.05, 
            legend.text.color = "black", 
            legend.title.color = "black", legend.title.fontface = 4, legend.position = c(0.05,0.05), legend.outside = T, legend.outside.position = "right", legend.outside.size = 0.55) +
  tm_layout(frame = T,
            main.title = 'LA UBICACION DE LAS COMUNIDADES CAMPESINAS SEGUN SU ZONA SISMICA',
            main.title.size = 0.8,
            fontface = 3,
            fontfamily = 'serif',
            main.title.position = c(0.02,0.5)) + 
  tm_scale_bar(text.size = 0.35,
               width = 0.25,
               color.dark = 'White',
               color.light = 'black',
               position = c(0.4,0.05))+
  tm_compass(position = c(0.02,0.85)) +
  tm_shape(ZONA_SISMO) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("ZONA", title = "ZONAS SISMICAS",
          palette = 'Blues',
          style = 'cat') +
  tm_shape(COM_CAMPESINAS) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("nom_dpto", title = "COMUNIDADES CAMPESINAS",
          palette = 'red',
          style = 'cat')+
  tm_layout(bg.color = "white")

#erosion
tm_shape(EROSION_SUELOorden) +#
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("RANGO", title = "RANGO",
          palette = 'YlOrRd',
          style = 'cat') +tm_borders ( col  =  " black " )+#bordes
  tm_layout(legend.bg.color = "black", 
            legend.bg.alpha= 0.1, 
            legend.frame=TRUE, 
            legend.height = 0.05, 
            legend.text.color = "black", 
            legend.title.color = "black", legend.title.fontface = 4, legend.position = c(0.05, 0.05), legend.outside = T, legend.outside.position = "right", legend.outside.size = 0.55) +
  tm_layout(frame = T,
            main.title = 'RANGO DE EROSION DE SUELOS EN EL PERU',
            main.title.size = 1,
            fontface = 3,
            fontfamily = 'serif',
            main.title.position = c(0.02,0.5)) + 
  tm_scale_bar(text.size = 0.35,
               width = 0.25,
               color.dark = 'White',
               color.light = 'black',
               position = c(0.2,0.05))+
  tm_compass(position = c(0.02,0.85))+
  tm_shape(COM_CAMPESINAS) +
  tmap_options(inner.margins = c(0.01,0.01, 0.01,0.01)) +
  tm_fill("nom_dpto", title = "COMUNIDADES CAMPESINAS",
          palette = 'Blues',
          style = 'cat')
 
mapview(erosion)+ mapview(camp)

