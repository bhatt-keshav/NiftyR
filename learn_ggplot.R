## Two Scatterplots on one plot
# Call geom_point instead of ggplot() first
plot1 <- geom_point(data=mtcars, 
                    aes(x=mpg, y=hp, 
                        color = 'MPG vs HP'))

plot2 <- geom_point(data=mtcars, 
                    aes(x=mpg, y=qsec, 
                        color='MPG vs QSec'))

# Then call ggplot when the two plots are to be layered on one plot
ggplot() + 
  plot1 + plot2
  labs(x = "MPG",
       y= "Value",  
       title = "MTCars HP and QSec vs MPG") 

## Two Scatterplots on one plot facetted. This is useful when having plots where y-axis are in different orders of magnitude
# 1 Select relevant columns
mtcars_cyl_disp <- mtcars %>% select(cyl, disp)
mpg_cyl_disp <- mpg %>% select(cyl, displ)
mpg_cyl_disp <- mpg_cyl_disp %>% rename(disp = displ)
# 2 For faceting both dataframes need to be combined. Faceting occurs on 1 df
# unlike layering done above
# But these individual dfs need to be identified also

# 3 Cool way to bind rows
cyl_disp <- bind_rows(list(mtcars_cyl_disp = mtcars_cyl_disp, 
                           mpg_cyl_disp = mpg_cyl_disp),
                      .id = 'source')

ggplot(data = cyl_disp, aes(x = cyl, y = disp)) + 
# no need to mention color manually, ggplot will select a color and put it in legend also
    geom_point(aes(color = source)) + 
  # facet/spli the plot in rows by source
  # Scales = free_y ensures that the scale of that facet are shown fully
  # W/o this ggplot will use scale on y-axis from the mtcars data set and not
  # show all the minute details from mpg df.
  facet_grid(source ~ ., scales = "free_y") + 
  # labels = comma, omits e notation, pretty_breaks splits the y axis in 10
  # equal parts. 10 is a good choice, more the breaks more the ticks, lesser the
  # pretty_breaks value lesser the ticks
  scale_y_continuous(labels = comma, breaks = pretty_breaks(n = 10)) +
  labs(x = "Cyl", y= "Disp",  
       title = "MPG vs Cyl for MTCars and MPG Datasets") 
