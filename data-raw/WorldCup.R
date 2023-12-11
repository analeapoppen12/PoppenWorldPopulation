url <- "https://en.wikipedia.org/wiki/FIFA_World_Cup"
page <- read_html(url)
Attendance_World_Cup <-
  page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE) %>%
  slice(-1 * 1:2 )
World_Cup <- Attendance_World_Cup[, c("X1", "X2", "X4", "X5", "X6")]

World_Cup$X6 <- as.numeric(gsub(",", "", World_Cup$`X6`))

World_Cup$X4 <- as.numeric(gsub(",", "", World_Cup$`X4`))

World_Cup <- na.omit(World_Cup)
rows_to_remove <- c(23)
World_Cup <- slice(World_Cup, -rows_to_remove)
World_Cup <- World_Cup %>%
  select('X1', 'X2', 'X4', 'X5', 'X6') %>%
  magrittr::set_colnames( c('Year', 'Hosts', 'Total attendance', 'Matches', 'Averageattendance') )
World_Cup %>% as_tibble()

World_Cup$WorldCup <- paste(World_Cup$Hosts,World_Cup$Year)
World_Cup$WorldCup <- str_replace_all(World_Cup$WorldCup, " ", "")
World_Cup <- World_Cup %>%
  select(-Hosts, -Year)
World_Cup <- World_Cup %>%
  select(WorldCup, everything())
