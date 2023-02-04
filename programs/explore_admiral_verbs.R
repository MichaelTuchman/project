cats=data.frame(fn=ls('package:admiral'))
breakdown<- cats %>% filter(verb!='%>%') %>%
  separate(fn,into=c('verb','obj','other'),sep='_',extra='merge',remove=FALSE)

breakdown %>% count(verb,obj,sort = TRUE) %>% head(n=10) %>% kable()

methods.2=methods %>% separate(ID,into=c('ID.dsname','ID.column'),sep='\\.',remove=FALSE)

