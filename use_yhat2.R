df <- data.frame(lon = -76.61, lat = 39.28, radius = 40)
yhat.config <- c(username = "lill_10@lzu.edu.cn",
                 apikey = "XXX",
                 env = "http://sandbox.yhathq.com/") ## not show real key
yhat.predict("pollutant", df)
