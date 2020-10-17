from random import randint

### fact list that the program can choose from

fact1 = "Only 10-15% of fires occur naturally, most are started by humans or as a result of human error." # source - national geographic
fact2 = "46 million acres were scored in Australia's wildfires in 2020." # source - BBC News
fact3 = "In 2015, a team of experts estimated that the air polluted by large forest fires in Indonesia had caused more than 100,000 premature deaths in that region."
fact4 = "More than 3 billion animals were affected with Australia's wildfires." # source - BBC News
fact5 = "One of the largest fires in recent history was in 1825 when a fire tore through Maine and New Brunswick, Canada, burning 3 million acres of forest." # source - dosomething.org
fact6 = "Climate change is the third biggest driver of biodiversity loss." # source - wired.co.uk
fact7 = "More than a million species are at risk of extinction by climate change." # source - earthday.org
fact8 = " To prevent warming beyond 1.5 degrees celcius, we need to reduce emissions by 7.6% every year until 2030." # source - unenvironment.org
fact9 = "An average of 1.2 million acres of US woodland burn every year." # source - dosomething.org
fact10 = "Two-thirds of extreme weather events in the past 20 years were caused by humans." # source - wired.co.uk

## facts are put into an array to make it easier to pass into the function

factsarray = [fact1, fact2, fact3, fact4, fact5, fact6, fact7, fact8, fact9, fact10]

def randomfactgen(factsarray): 

    factprinted = randint(1,3) # random generator used to select fact

    if factprinted == 1: # looks for the fact in the array and prints it
        print(factsarray[0])
    if factprinted == 2:
        print(factsarray[1])
    if factprinted == 3:
        print(factsarray[2])
    if factprinted == 4:
        print(factsarray[3])
    if factprinted == 5:
        print(factsarray[4])
    if factprinted == 6:
        print(factsarray[5])
    if factprinted == 7:
        print(factsarray[6])
    if factprinted == 8:
        print(factsarray[7])
    if factprinted == 9:
        print(factsarray[8])
    if factprinted == 10:
        print(factsarray[9])

randomfactgen(factsarray)  # allows the function to run automatically

## for purposes of prototype only 10 facts have been included
## obviously this could and would be changed for the real thing

