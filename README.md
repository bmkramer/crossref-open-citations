# DOI wanted - random selection of 1000 open citations from Crossref 
*(cited by journal articles published 2015-2017)*

Script accompanying poster activity at [Workshop on Open Citations](https://workshop-oc.github.io/) (Sept 3-5 2018, Bologna, Italy)  
Poster and dataset on Figshare: [10.6084/m9.figshare.7011689](https://doi.org/10.6084/m9.figshare.7011689)

## BACKGROUND
Open citations are an important part of open scholarly infrastructure. Their development also shows both the power and limitations of 
established parties, restricting their potential use for the wider scholarly community. 

### Quality of citation data
More and more publishers are making references openly available through Crossref, but their quality is often still suboptimal, 
with many references lacking important information including DOIs (Fig 1a, from [D. Ecer](https://github.com/de-code)'s [analysis of Crossref citation data](https://elifesci.org/crossref-data-notebook)). This limits their use in open citation indexes, 
like OpenCitations’ [COCI](http://opencitations.net/index/coci) index.

### Community enrichment – an experiment
To explore the power of community enrichment of citations, we took a random sample of open citations from Crossref (Fig 1b), 
identified citations to journal articles missing DOIs and presented a subset for enrichment by conference participants.

### Possibilities and pitfalls
Community enrichment of citation data would enable the scholarly community as a whole to not only to make optimal use of open citations, 
but also contribute to their value, without enclosing the enriched data. 

Questions around enrichment of open citation data include: whether responsibility for providing good citation data should be extended 
beyond publishers, what legitimate sources to get additional citation data information from (eg [Wikidata](https://tools.wmflabs.org/sourcemd/)), 
how alternative routes to enrichment would scale, and how provenance of enrichments should be dealt with. 

## THE SCRIPT
The script uses a double loop to retrieve a random set (10 sets of 100) of Crossref DOIs for journal articles with open citation data, published between 2015-2017. For each DOI, the number of references from Crossref is retrieved and a random reference is selected from this number. For this reference, the citation data are retrieved from Crossref, using the fields identified by [D. Ecer[(https://github.com/de-code) in his [analysis of Crossref (open) citation data](https://elifesci.org/crossref-data-notebook). 

### Further cleaning and handling
From the 1000 citations retrieved, 278 were shown to not include a DOI (Fig 1b). These were manually inspected to determine whether they were citations to journal articles (n= 107*). From these, the most recent 48 (representing citations to journal articles published in 2010-2016) were selected to be included on the poster presented at the Workshop on Open Citations. 

*The other citations without DOIs were found to be to books/book chapters/reports/theses (n=131), conference proceedings (n=14) and miscellaneous publication types, including websites, images, and software code (n=25)* 

![Winter Solstice Challenge - image](https://github.com/bmkramer/crossref-open-citations/blob/master/Crossref_opencitations_DOIs.png)
