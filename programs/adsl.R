## reference tables from specs.xlsx

methods = readxl::read_xlsx("metadata/specs.xlsx",sheet="Methods")
codelists=readxl::read_xlsx("metadata/specs.xlsx",sheet="Codelists")

breakdown<- cats %>% filter(verb!='%>%') %>%
  separate(fn,into=c('verb','obj','other'),sep='_',extra='merge',remove=FALSE)

breakdown %>% count(verb,obj,sort = TRUE) %>% head(n=10) %>% kable()

methods.2=methods %>% separate(ID,into=c('ID.dsname','ID.column'),sep='\\.',remove=FALSE)

methods.adsl = methods.2 %>% filter(`ID.dsname`=='adsl') %>% select(Name,Description) %>% mutate(order=Inf)



arm_mapping = codelists %>% rename(ARM=`Decoded Value`,TRT=Order) %>% filter(Name=='TRT01PN') %>% mutate(DOSE=`Term`)

adsl = adsl %>% derive_vars_merged(arm_mapping,by_vars=vars(ARM),new_vars = vars(TRT01P,DOSE))
