# Use base image with R and Shiny
FROM rocker/shiny:latest

# Install required R packages
RUN R -e "install.packages(c('flexdashboard','shiny','leaflet','plotly','dplyr','sf','tidyr','readxl','ggplot2','RColorBrewer','rlang','htmltools'))"

# Copy all app files into Shiny Server directory
COPY . /srv/shiny-server/

# Expose port 3838 (default Shiny)
EXPOSE 3838

# Start Shiny server
CMD ["/usr/bin/shiny-server"]
