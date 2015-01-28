library(yhatr)

model.require <- function() {
        library(fields)
}

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

model.transform <- function(df) {
        df
}

model.predict <- function() {
        pollutant(df)
}
