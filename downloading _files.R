download.file(fileUrl, destfile = "./data/cameras.csv", method = “curl")
list.files("./data")
dataDownloaded <- date()