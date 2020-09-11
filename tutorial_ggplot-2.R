### Stats and Scales

library(ggplot2)

# Same as hist
ggplot(diamonds, aes(x = carat)) + 
  stat_bin()

# Heatmap, but different than prev module, as we are looking at counts. Shows a stat diff. b/w layers
ggplot(diamonds, aes(x = cut, y = clarity)) + 
  stat_bin2d()

# x should be factor/categorical and y should be continuous for box plot to work
ggplot(diamonds, aes(x = cut, y = price)) + 
  stat_boxplot()

# Smoothing
ggplot(mtcars, aes(x = disp, y= mpg)) +
  geom_point() + 
  stat_smooth()
# Above and below are same
ggplot(mtcars, aes(x = disp, y= mpg)) +
  geom_point() + 
geom_smooth()
# However with stat_smooth you can also add some formula (maybe also in geom_smooth??)
# This gives a smoother plot
ggplot(mtcars, aes(disp, mpg)) + 
  geom_point() + 
  stat_smooth(method = 'lm', formula = y ~ log(x))

## Changing scale
# scale x axis on a log10
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  scale_x_log10()
# Reverse the x axis (400->100)
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() + 
  scale_x_reverse()

## Adding colors
ggplot(diamonds, aes(x = cut, y = price)) + 
  stat_boxplot(color = 'pink', fill = 'purple')

## Using shapes to discriminate b/w diff grouping categories
ggplot(mtcars, aes(x = disp, y = mpg, 
                   shape = as.factor(cyl))) + 
  geom_point() + 
  scale_shape(solid = F)
  # just get outlines of points
 
# Change the shape size
ggplot(mtcars, aes(x = disp, y = mpg, 
                   size = cyl)) + 
  geom_point() + 
  scale_size_area(max_size = 10)
