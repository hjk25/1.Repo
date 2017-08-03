myData <- read.csv("C:\\Users\\206410554\\Desktop\\Blackboard\\R Class\\agaricus-lepiota.csv", header = FALSE, sep = ",", stringsAsFactors = FALSE)
#stringsAsFactors = FALSE
mushroom <- data.frame(myData)
nrow(mushroom)
ncol(mushroom)
names(mushroom) <- c("edible", "cap-shape", "cap-surface", "cap-color", "bruises", "odor", "gill-attachment", "gill-spacing", "gill-size", "gill-color", "stalk-shape", "stalk-root", "talk-surface-above-ring", "stalk-surface-below-ring", "stalk-color-above-ring", "stalk-color-below-ring", "veil-type", "veil-color", "ring-number", "ring-type", "spore-print-color", "population", "habitat")
colnames(mushroom)
class(mushroom)
head(mushroom)
mushroom$edible
names(mushroom)
mushroom[1]

#sub("e", "edible", mushroom$edible) +sub("p", "poisonous", mushroom$edible)
#sub("p", "poisonous", mushroom$edible)


mushroomdf <- data.frame(mushroom$edible, mushroom$bruises, mushroom$odor)
mushroomdf <- str_replace_all(string=mushroomdf$edible, "e", "edible")
mushroomdf <- str_replace(string=mushroomdf$edible, "p", "poisonous")
#question to teacher - I got an error when I tried to called in mushroom$cap-shape. Is this because of the hyphen in "cap-shape"?\
#Should I have named them without hyphens as a best practice? If I did use them, what's the workaround to include them in my dataframe?
class(mushroomdf)
ncol(mushroomdf)
head(mushroomdf)


#not sure how to save this into file even though second commands.Consider if then?
#mushroomdf <- function(e)
#+{ if(mushroomdf$edible==e)
#  {sub("e", "edible", mushroomdf$edible)
#  } else if (mushroomdf$edible==p)
#  {sub("p", "poisonous", mushroomdf$edible)}
}

