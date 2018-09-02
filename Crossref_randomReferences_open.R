##info on rcrossref: https://github.com/ropensci/rcrossref
##next to rcrossref, Crossref API is also used directly in this script
##replace the dummy email address with your own email address in line 78


#install packages
install.packages("rjson")
install.packages("httpcache")
install.packages("rcrossref")
require(rjson)
require(httpcache)
require(rcrossref)

#define function to accommodate NULL results
naIfNull <- function(cell){
  if(is.null(cell)) {
    return(NA)
  } else {
    return(cell)
  }
}

#STEP 1: create empty dataframe
randomReferences <- data.frame(matrix(nrow = 1, ncol = 24 ))
#set column names of dataframe
colnames(randomReferences) = c(
  "# sample",
  "citing DOI",
  "reference count",
  "# reference",
  "DOI",
  "reference",
  "key",
  "author",
  "year",
  "article-title",
  "journal-title",
  "volume",
  "issue",
  "first-page",
  "volume-title",
  "edition",
  "series-title",
  "standards-body",
  "ISSN",
  "issn-type",
  "ISBN",
  "isbn-type",
  "component",
  "unstructured"
)

#STEP2 Retrieve random reference from sample DOIs; fill dataframe with info 

#declare index
id <- 0

#In double loop generate 10 samples of 100 DOIs 
#for each DOI in sample, retrieve random reference; fill dataframe with info 
for (i in 1:10){
  sample_size <- 100
  #get sample dois from Crossref using rcrossref
  sample <- cr_r(
    sample_size, 
    filter = c(
      type = "journal-article", 
      from_pub_date = "2015-01-01", 
      until_pub_date = "2017-12-31",
      has_references = TRUE,
      reference_visibility = "open"
    )
  )
  for (j in 1:sample_size){
  #for (j in 1:1){
    tryCatch({
      doi <- sample[i]
      #doi_character <- as.character(doi)
      url <- paste("https://api.crossref.org/works/",sample[i],"?mailto=your@email.com",sep="")
      raw_data <- GET(url)
      rd <- httr::content(raw_data)
      reference_count <- rd$message$`reference-count`
      references <- rd$message$reference
      #generate random number from reference_count
      x <- sample(1:reference_count, 1)
      #generate reference x as character string
      reference_x_string <- toString(references[[x]])
      #increase id counter
      id <- id + 1
      #generate result 
      result <- c(
        naIfNull(id),
        naIfNull(doi),
        naIfNull(reference_count),
        naIfNull(x),
        naIfNull(references[[x]]$DOI),
        naIfNull(reference_x_string),
        naIfNull(references[[x]]$key),
        naIfNull(references[[x]]$author),
        naIfNull(references[[x]]$year),
        naIfNull(references[[x]]$`article-title`),
        naIfNull(references[[x]]$`journal-title`),
        naIfNull(references[[x]]$`volume`),
        naIfNull(references[[x]]$`issue`),
        naIfNull(references[[x]]$`first-page`),
        naIfNull(references[[x]]$`volume-title`),
        naIfNull(references[[x]]$edition),
        naIfNull(references[[x]]$`series-title`),
        naIfNull(references[[x]]$`standards-body`),
        naIfNull(references[[x]]$ISSN),
        naIfNull(references[[x]]$`issn-type`),
        naIfNull(references[[x]]$ISBN),
        naIfNull(references[[x]]$`isbn-type`),
        naIfNull(references[[x]]$component),
        naIfNull(references[[x]]$unstructured)
      )
      randomReferences <- rbind(randomReferences,result)
    }, error=function(e){})
  }
}

#write results to csv file
write.csv(randomReferences, file="Crossref_randomReferences_1000_2015-2017.csv", row.names=FALSE)
