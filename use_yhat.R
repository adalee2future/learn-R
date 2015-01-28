d <- read.csv("annual_all_2013.csv")
sub <- subset(d, Parameter.Name %in% c("PM2.5 - Local Conditions", "Ozone")
              & Pullutant.Standard %in% c("Ozone 8-Hour 2008", "PM25 Annual 2006"),
              c(Longitude, Latitude, Parameter.Name, Arithmetic.Mean))
pollavg <- aggregate(sub[, "Arithmetic.Mean"], 
                     sub[, c("Longitude", "Latitude", "Parameter.Name")],
                     mean, na.rm = TRUE)
names(pollavg)[4] <- "level"
pollavg <- transform(pollavg, Parameter.Name = factor(Parameter.Name))

rm(d, sub)

monitors <- data.matrix(pollavg[, c("Longitude", "Latitude")])

library(fields)

## input is data frame with
## lon: longitude
## lat: latitude
## radius: Radius in miles for finding monitors
pollutant <- function(df) {
        x <- data.matrix(df[, c("lon", "lat")])
        r <- df$radius
        d <- rdist.earth(monitors, x)
        use <- lapply(seq_len(ncol(d)), function(i) {
                which(d[, i] < r[i])
        })
        levels <- sapply(use, function(idx) {
                with(pollavg[idx, ], tapply(level, Parameter.Name, mean))
        })
        dlevels <- as.data.frame(t(levels))
        data.frame(df, dlevels)
}

library(yhatr)

model.require <- function() {
        library(fields)
}

model.transform <- function(df) {
        df
}

model.predict <- function(df) {
        pollutant(df)
}

yhat.config <- c(username = "lill_10@lzu.edu.cn",
                 apikey = "6ef041d922786fc4b47bb759e4ca37ae",
                 env = "http://sandbox.yhathq.com/")

yhat.deploy("pollutant")


# {"lon" : -76.61, "lat" : 39.28, "radius" : 40}
