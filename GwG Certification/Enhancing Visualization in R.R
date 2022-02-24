library(ggplot2)

install.packages("palmerpenguins")
library(palmerpenguins)

# Changing aesthetics
ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g))

# another method
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point()

# ...
ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, shape=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species,
                           shape=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species,
                           shape=species, size=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, alpha=species))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g), color='purple')

# Changing geoms
ggplot(data=penguins) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g))

ggplot(data=penguins) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g,
                            linetype=species))

ggplot(data=penguins) + 
  geom_jitter(mapping = aes(x=flipper_length_mm, y=body_mass_g))

# Diamond data set comes with the ggplot2 package
ggplot(data=diamonds) + geom_bar(mapping = aes(x=cut))

ggplot(data=diamonds) + geom_bar(mapping = aes(x=cut, color=cut))

ggplot(data=diamonds) + geom_bar(mapping = aes(x=cut, fill=cut))

ggplot(data=diamonds) + geom_bar(mapping = aes(x=cut, fill=clarity))

# Facets
ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g)) + 
  facet_wrap(~species)

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) + 
  facet_wrap(~species)

ggplot(data=diamonds) + geom_bar(mapping = aes(x=color, fill=cut)) + 
  facet_wrap(~cut)

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) + 
  facet_grid(sex~species)

ggplot(data=penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species)) + 
  facet_grid(~sex)
