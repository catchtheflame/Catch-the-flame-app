from random import randint # used to generate questions

def nextquestion(): # function to decide whether or not to continue
    
    press = input("Press N for next question or Q to Quit. ")
    
    if press == "N":
        randomquestiongen()
        
    if press == "Q":
        quit()

def randomquestiongen(): # random question selection

    questionSelect = randint(1, 3)

    if questionSelect == 1:
        question1()
    if questionSelect == 2:
        question2()
    if questionSelect == 3:
        question3()


def question1(): 

    print("How many wildfires each year are caused by humans?") # question and choices displayed
    print("1 - 10%")
    print("2 - 20%")
    print("3 - 30%")

    valid = False  # validation and error handling
    while valid == False:
        try:
            answer = int(input("Enter answer here: "))

            if answer == 1:
                print("You are correct! Well done!")
                nextquestion()
                valid = True

            if answer == 2:
                print("You are wrong. The correct answer was 10%. Better luck next time.")
                nextquestion()
                valid = True

            if answer == 3:
                print("You are wrong. The correct answer was 10%. Better luck next time.")
                nextquestion()
                valid = True

            else:
                print("Please choose an option from those listed.") 

        except:
            print("Remember to enter an integer")

def question2():

    print("How many acres of land are scorched by wildfires each year in the US?") # question and choices displayed
    print(" 1 - 3-4 million acres")
    print(" 2 - 4-5 million acres")
    print(" 3 - 5-6 million acres")

    valid = False  # validation and error handling
    while valid == False:
        try:
            answer = int(input("Enter answer here: "))

            if answer == 1:
                print("You are wrong. The answer was 4-5 million acres. Better luck next time.")
                nextquestion()
                valid = True

            if answer == 2:
                print("You are correct! Well done!")
                nextquestion()
                valid = True

            if answer == 3:
                print("You are wrong. The answer was 4-5 million acres. Better luck next time.")
                nextquestion()
                valid = True

            else:
                print("Please choose an option from those listed.")

        except:
            print("Remember to enter an integer.")


def question3():
    
    print("How long does it take for reforestation to start after a wildfire?")  # question and choices displayed
    print("1 - 8-10 years")
    print("2 - 5-7 years")
    print("3 - 2-4 years")

    valid = False   # validation and error handling
    while valid == False():
        try:
            answer = int(input("Enter answer here: "))

            if answer == 1:
                print("You are wrong. The answer was 2-4 years. Better luck next time.")
                nextquestion()
                valid = True

            if answer == 2:
                print("You are wrong. The answer was 2-4 years. Better luck next time.")
                nextquestion()
                valid = True

            if answer == 3:
                print("You are correct! Well done!")
                nextquestion()
                valid = True

            else:
                print("Please choose an option from those listed.")

        except:
            print("Remember to enter an integer")

            

def main(): # main at bottom to retrieve functions from above

    print("Welcome to Catch The Flame - The Game")
    press = input("Press S to Start or Q to quit. ")

    if press == "S":
        randomquestiongen()

    if press == "Q":
        quit()

# note: score could be added with more time and coding

# note: as a prototype only 3 questions used, however more could and would be added

# note: some bugs may occur
