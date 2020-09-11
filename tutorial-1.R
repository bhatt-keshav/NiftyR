library(ggplot2)
head(mtcars)

# 1
ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_point() + geom_line()

# Layer as many layers on top
ggplot(mtcars, aes(x = mpg, y = hp)) + 
  geom_smooth() + 
  geom_point(aes(color=cyl)) + 
  geom_vline(xintercept = 20, color = 'red') +
  ggtitle('mpg and horsepower colored by group') +
  labs(color = 'nr of cylinders') + 
  theme_classic()

# Coercing to factor/categorical variable to show distinctions in groups
ggplot(mtcars, aes(x = mpg, y = hp, color = as.factor(cyl))) +
  geom_point()
# above and below are same
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point(aes(color = as.factor(cyl)))

ggplot(mtcars, aes(x = mpg, y = hp, size = disp)) + 
  geom_point()

ggplot(mtcars, aes(x = mpg, y = hp, 
                   shape = as.factor(cyl),
                   color = as.factor(cyl))) +
  geom_point()

# Faceting 1 (col wise)
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() +
  # give me all values and show them ~ (by) column
  facet_grid(. ~ cyl)

# Faceting 2 (row wise)
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() +
  # give me all values for cyl and show them ~ (by) rows
  facet_grid(cyl ~ .)

# Faceting 3 (v1 by v2)
ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point() +
  # give me all values gear for gear by cyl
  facet_grid(gear ~ cyl)

## Plotting 1 var (univariate)
ggplot(ToothGrowth, aes(x = supp)) + 
  geom_dotplot()

ggplot(ToothGrowth, aes(x = len)) + 
  geom_histogram(binwidth = 5)

ggplot(ToothGrowth, aes(x = len)) + 
  geom_histogram(binwidth = 5) + 
  facet_grid(. ~ dose)

ggplot(ToothGrowth, aes(x = len)) + 
  geom_density()

# group len by dose
ggplot(ToothGrowth, aes(x = len, group = dose, 
                        color = dose)) + 
  geom_density()
# Fill density plot
ggplot(ToothGrowth, aes(x = len, group = dose,
                        fill = dose)) + 
  geom_density()

## Plotting 2 var (univariate)
# default method is loes
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_smooth(method = 'lm')

# removes the error (the zone around the regression line)
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_smooth(method = 'lm', se = F)

# Shows the general relationship b/w vars
ggplot(mtcars, aes(x = disp, y = mpg)) + 
  geom_point() +
  geom_smooth(se = F)

## 3 variables
ggplot(mtcars, aes(x = cyl, y = gear)) + 
  geom_tile(aes(fill = mpg))
# to plot a continuous variable, we need to cut into some discrete categories
ggplot(mtcars, aes(x = cyl, y = cut(disp, 3))) + 
  geom_tile(aes(fill = mpg))

