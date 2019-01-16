library("dplyr")
dat <- read.csv("Data/gapminder_data.csv")

mean(dat$gdpPercap)
mean(dat[1:5, "gdpPercap"])
mean(dat[dat$continent == "Americas", "gdpPercap"])


filter(dat, continent == "Americas")
filter(dat, year > 2000)
dat_2 <- filter(dat, continent == "Americas", year >2000)

select(dat, continent)
select(dat_2, country, year, gdpPercap)


%>% Pipes
control-shift-m
%>% 

  dat %>%
  filter(continent == "Americas", year > 2000) %>% 
  select (country, year, gdpPercap)



sin(log(exp(5))) in pipes: 
5 %>% 
  exp() %>% 
  log() %>% 
  sin() %>%


#### group_by() and summarize() ----
group by looks for categorical data sets, and groups them.  e.g. Country, continent
summarize does calcs on groups sepperately, then puts it back together. 

dat %>% 
  group_by(country) %>% 
  summarize(ave_life_exp = mean(lifeExp))
summary_1 <- dat %>% 
  group_by(country) %>% 
  summarize(ave_life_exp = mean(lifeExp))


#### Challenge Question ----
1. ave gde for each country?
2. ave gdp for each continent in 1957?


dat %>% 
  group_by(country) %>%
  summarize(ave_gdpPercap = mean(gdpPercap))
  
dat %>% 
  filter(year == 1957) %>% 
  group_by(continent) %>% 
  summarize(ave57_gdpPercap = mean(gdpPercap))

dat %>% 
  group_by(continent) %>% 
  filter(year == 1957) %>%
  summarize(ave57a_gdpPercap = mean(gdpPercap))


dat %>% 
  group_by(continent, year = 1957) %>% 
  summarize(ave57wrong_gdpPercap = mean(gdpPercap))

#### multiple summary outputs ----
dat %>% 
  group_by(continent) %>% 
  summarize(ave_gdp = mean(gdpPercap),
            min_gdp = min(gdpPercap), 
            median_gdp = median(gdpPercap),
            sd_gdp = sd(gdpPercap), 
            num_values = n())

#### Making new column variables ----

dat %>% 
  mutate(gdp_billion = gdpPercap * 10^9)


#### wide vs long data in gapminder ----
dat2 <- dat %>% 
  select(country, year, gdpPercap)

library(tidyr)
dat2_wide <- dat2 %>% 
  spread(year, gdpPercap)

year becomes column title, gdpPercap populates chart



dat2_long <- dat2_wide %>% 
  gather(year, gdp, "1952":"2007") %>% 
  arrange(country)
