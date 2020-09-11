## Customizing your plot

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() +
  # se = F, gets the residuals out of the plot
  geom_smooth(se = F)

# Changing labels
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() +
  # se = F, gets the residuals out of the plot
  geom_smooth(se = F) + 
  xlab("Displacement") +
  ylab("miles per Gallon") + 
  ggtitle("Relationship b/w Disp and MPG")

# OR (Better!)
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() +
  # se = F, gets the residuals out of the plot
  geom_smooth(se = F) + 
  labs(x = "Displacement",
  y= "miles per Gallon",  
  title = "Relationship b/w Disp and MPG")

# Legend
ggplot(mtcars, aes(x = disp, y = mpg, 
                   color = as.factor(cyl))) + 
  geom_point() + 
  theme(legend.position = 'top')

# Axes 
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  # gets the tick marks off
  theme(axis.ticks = element_blank()) +
# flips the coordinates
    coord_flip()

# Themes
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  theme_bw()

ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  theme_void()

## Zooming 
# Makes a subset of the data that is being displayed (Better!)
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  coord_cartesian(xlim = c(100, 250),
                  ylim = c(15, 25))

# Sets everything outside this scale as NA
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  scale_x_continuous(limits = c(100, 250)) + 
  scale_y_continuous(limits = c(15, 25))
