### This file explains dplyr data manipulation verbs
head(mtcars)
dim(mtcars)
# This counts all rows
mtcars %>% summarise(tot = n())
# This counts observations per cyl
mtcars %>% group_by(cyl) %>% summarise(n_cyl = n())
# Check
mtcars %>% filter(cyl == 6)
# This counts number of gears per cyl class
mtcars %>% group_by(cyl, gear) %>% summarise(n_gears_per_cyl = n())
# Check
mtcars %>% filter(cyl == 4 & gear == 3)
# This counts unique sub counts
mtcars %>% group_by(cyl) %>% summarise(n_gears = n_distinct(gear))
# Check: For cyl == 4, there are 3 unique type of gears: 4, 3, 5
mtcars %>% select(cyl, gear) %>% filter(cyl == 4)
# Creates a column with the max gear per cyl
mtcars %>% group_by(cyl) %>% summarise(max_gear = max(gear))
# Check
mtcars %>% filter(cyl == 4)
# Sums hp for each gear sub-group in cyl group
mtcars %>% group_by(cyl, gear) %>% summarise(total_hp_per_gear_per_cyl = sum(hp))  
# Check
mtcars %>% filter(cyl == 4 & gear == 5)
# Count is a convenience wrapper over group_by and summarise(n())
mtcars_cyl_gear <- mtcars %>% count(gear, cyl, name = 'cyl_per_gear')
# Above is equivalent to below
mtcars %>% group_by(gear, cyl) %>% summarise(n())
# This gives the max cyl per gear in the entire df. Hence 1 row
mtcars_cyl_gear %>% slice_max(cyl_per_gear)
# This gives the max cyl per gear group
mtcars_cyl_gear %>% group_by(gear) %>% slice_max(cyl_per_gear)
# Above is equivalent to 
mtcars_cyl_gear %>% group_by(gear) %>% slice(which.max(cyl_per_gear))




