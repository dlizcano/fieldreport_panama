
library(exifr)
library(exiftoolr)
library(magick)
library(camtrapR)



## Read and extract image metadata
# dat <- read_exif("C:/github/fieldreport_panama/content/posts/bayano/images/taged/3.jpg")
# DateTime  <- dat[["CreateDate"]]
# Longitude <- dat[["GPSLongitude"]]
# Latitude  <- dat[["GPSLatitude"]]

dat <- exif_read("C:/github/fieldreport_panama/content/posts/bayano/images", recursive = TRUE)
Longitude <- -80.2492896
Latitude  <- 8.313358
DateTime <- "2023:01:19 16:30:26"
## Prepare annotation text
txt <- paste0(DateTime, "\n",
              "Longitude: ", round(Longitude, 6), "\n",
              "Latitude:  ", round(Latitude, 6))

## Annotate image and write to file
out <- image_annotate(image_read("C:/github/fieldreport_panama/content/posts/palacios/images/330.jpg"), txt,
                      gravity = "northwest", color = "red",
                      boxcolor = adjustcolor("black", alpha=0.1),
                      size = 12, location = "+10+10")
image_write(out, "C:/github/fieldreport_panama/content/posts/palacios/images/330.jpg")

# extract ingo using Camtrapr
# a <- exifTagNames( fileName  = "C:/github/fieldreport_panama/content/posts/bayano/images/2.jpg")

# write info using exif_call(path = file1, args = "-Artist=me")
exif_call(path = "C:/github/fieldreport_panama/content/posts/palacios/images/330.jpg", 
          args = c("-gpslatitude=8.313358", "-gpslongitude=-80.2492896", 
                   "-gpslatituderef=N", "-gpslongituderef=W"))
          
          
          
          
          
          
          
          
          
          
          