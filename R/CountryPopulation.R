#' Graphing of a country from the World Population.
#'
#' Input a country name and the function will make a graph of the countries' population each year.
#'
#' @param a A real country listed
#' @return A graph of the countries population each year
#' @examples
#' USA_plot <- CountryPopulation("United States of America", title = "United States of America")
#' @export
CountryPopulation <- function(country_name, title = NULL) {
  if (!country_name %in% WorldPopulation$Country) {
    stop(paste("Error: Country", country_name, "not found in the WorldPopulation data."))
  }

  country_data <- WorldPopulation %>%
    filter(Country == country_name)

  plot <- ggplot(country_data, aes(x = Year, y = Population)) +
    geom_line() +
    labs(x = "Year", y = "Population", title = title) +
    theme_minimal()

  return(plot)
}
