source(here::here("R/package-loading.R"))
glimpse(NHANES)

# Check column names
colnames (NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

NHANES %>%
  colnames() %>%
  length()

NHANES %>%
  mutate(Height = Height / 100,
         Testing = "yes",
         HighlyActive = if_else (
            PhysActiveDays >= 5,
            "yes",
            "no"
         ))

NHANES_updated <- NHANES %>%
  mutate(UrineVolAverage = (UrineVol1 +
                              UrineVol2) / 2)

# Exercise ----------------------------------------------------------------

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <-NHANES %>% # dataset
  mutate(
        UrineVolAverage = (UrineVol1 + UrineVol2) / 2,

        PulsePerSecond = (Pulse / 60),

         YoungChild = if_else(Age < 6, TRUE, FALSE)
        )

  head(NHANES_modified$UrineVolAverage)


# Selecting variables -----------------------------------------------------

NHANES %>%
    select(Gender, BMI)
    select(-BMI)

NHANES %>%
    select(starts_with("Smoke"),
           contains("Vol")
           matches("[123]"))

NHANES %>%
  rename(
    # NewName = OldName
    NumberBabies = nBabies,
    Sex = Gender
  )

NHANES %>%
  select(
    BMI, NumberBabies = nBabies, Gender, Height)

NHANES %>%
  filter(Gender != "female")

NHANES %>%
  filter(BMI >= 25 & Gender == "female")

NHANES %>%
  arrange(Age) %>%
  select (Age)

NHANES %>%
  arrange(desc(Age), Gender) %>%
  select (Age, Gender)


# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == Yes)

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Working" | HomeOwn == "Rent" & Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies),Age) %>%
  select(Age, nBabies)


# Group by and summarize --------------------------------------------------

NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MinBMI = min(BMI, na.rm = TRUE))


NHANES %>%
  group_by(Gender, Work) %>%
  summarise(MeanBMI = mean(BMI, na.rm = TRUE),
            MeanAge = mean(Age, na.rm = TRUE))


# Conversion to long form -------------------------------------------------

table4b %>%
  gather(year, populatiom, -country)

table4b %>%
  gather(year, populatiom, `1999`,`2000`)


nhanes_simple <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

nhanes_long <- nhanes_simple %>%
  gather(Measure, Value, -SurveyYr, - Gender)

nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean(Value, na.rm=TRUE))


table2 %>%
  spread(type, count)

nhanes_summary %>%
  spread(SurveyYr, MeanValue)



# LAST EXERCISE -----------------------------------------------------------

#> # A tibble: 10,000 x 76
#>       ID SurveyYr Gender   Age AgeDecade AgeMonths Race1 Race3 Education
#>    <int> <fct>    <fct>  <int> <fct>         <int> <fct> <fct> <fct>
#>  1 51624 2009_10  male      34 " 30-39"        409 White <NA>  High Sch…
#>  2 51624 2009_10  male      34 " 30-39"        409 White <NA>  High Sch…
#>  3 51624 2009_10  male      34 " 30-39"        409 White <NA>  High Sch…
#>  4 51625 2009_10  male       4 " 0-9"           49 Other <NA>  <NA>
#>  5 51630 2009_10  female    49 " 40-49"        596 White <NA>  Some Col…
#>  6 51638 2009_10  male       9 " 0-9"          115 White <NA>  <NA>
#>  7 51646 2009_10  male       8 " 0-9"          101 White <NA>  <NA>
#>  8 51647 2009_10  female    45 " 40-49"        541 White <NA>  College …
#>  9 51647 2009_10  female    45 " 40-49"        541 White <NA>  College …
#> 10 51647 2009_10  female    45 " 40-49"        541 White <NA>  College …
#> # … with 9,990 more rows, and 67 more variables: MaritalStatus <fct>,
#> #   HHIncome <fct>, HHIncomeMid <int>, Poverty <dbl>, HomeRooms <int>,
#> #   HomeOwn <fct>, Work <fct>, Weight <dbl>, Length <dbl>, HeadCirc <dbl>,
#> #   Height <dbl>, BMI <dbl>, BMICatUnder20yrs <fct>, BMI_WHO <fct>,
#> #   Pulse <int>, BPSysAve <int>, BPDiaAve <int>, BPSys1 <int>,
#> #   BPDia1 <int>, BPSys2 <int>, BPDia2 <int>, BPSys3 <int>, BPDia3 <int>,
#> #   Testosterone <dbl>, DirectChol <dbl>, TotChol <dbl>, UrineVol1 <int>,
#> #   UrineFlow1 <dbl>, UrineVol2 <int>, UrineFlow2 <dbl>, Diabetes <fct>,
#> #   DiabetesAge <int>, HealthGen <fct>, DaysPhysHlthBad <int>,
#> #   DaysMentHlthBad <int>, LittleInterest <fct>, Depressed <fct>,
#> #   nPregnancies <int>, nBabies <int>, Age1stBaby <int>,
#> #   SleepHrsNight <int>, SleepTrouble <fct>, PhysActive <fct>,
#> #   PhysActiveDays <int>, TVHrsDay <fct>, CompHrsDay <fct>,
#> #   TVHrsDayChild <int>, CompHrsDayChild <int>, Alcohol12PlusYr <fct>,
#> #   AlcoholDay <int>, AlcoholYear <int>, SmokeNow <fct>, Smoke100 <fct>,
#> #   Smoke100n <fct>, SmokeAge <int>, Marijuana <fct>, AgeFirstMarij <int>,
#> #   RegularMarij <fct>, AgeRegMarij <int>, HardDrugs <fct>, SexEver <fct>,
#> #   SexAge <int>, SexNumPartnLife <int>, SexNumPartYear <int>,
#> #   SameSex <fct>, SexOrientation <fct>, PregnantNow <fct>


exercise <- NHANES %>%
  mutate (MoreThan5DaysActive <- if_else (PhysActiveDays >= 5,
                                          "yes",
                                          "no"))
select(SurveyYr, Gender, Age, DiabetesAge, BMI, BPDiaAve, BPSysAve,
       AlcoholDay, MoreThan5DaysActive, nBabies, Poverty, TotalCholesterol)
 rename(
    AgeDiabetesDiagnosis = DiabetesAge
    DrinksOfAlcoholInDay = AlcoholDay
    NumberOfBabies = nBabies
    TotalCholesterol = TotChol)

  filter(Age >=18, Age<=75)



NHANES %>%
  group_by(Gender, SurveyYr) %>%
  summarise(MeanAge = mean(Age, na.rm = TRUE),
            MeanAgeDiabetesDiagnosis = mean(AgeDiabetesDiagnosis, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE),
            MeanAge = mean(Age, na.rm = TRUE),
            MeanAge = mean(Age, na.rm = TRUE),
            MeanAge = mean(Age, na.rm = TRUE),
            MeanAge = mean(Age, na.rm = TRUE),


exercise_long <- exercise %>%
        gather(Measure, Value, -SurveyYr, - Gender)


nhanes_long %>%
        group_by(SurveyYr, Gender, Measure) %>%
        summarise(MeanValue = mean(Value, na.rm=TRUE))
