sentences <- c("Today is fine!", "How's everything today?", "Don't do it")

# find which sentence include "Today" or "today"
## get indexes
indexes <- grep("[Tt]oday", sentences)
## get results
sentences[indexes]
