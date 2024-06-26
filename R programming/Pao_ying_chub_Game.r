game01 <- function() {

    username <- readline("Welcome to my Worlddd    Your name : ")
    print("Hi Guyyyy")
    print("Welcome to the my gameeee!")
    print("the game has simple rolues")
    print("1. Rock win Sciseor")
    print("2. Sciseor win Paper")
    print("3. Paper win Rock")
    print("You understand  Goooo")
    hands <- c("Rock", "Sciseor", "Paper")
    flush.console()

    user_hand <- readline("Your hand 😈 Rock or Scsieor or Paper:")
    print(paste("You" , "=", user_hand))

    user_com = sample(hands,1)
    print(paste("Computer" ,"=",  user_com))

    if (user_hand == "Rock" & user_com == "Rock") {
            return("Draw 😉")
    } else if (user_hand =="Rock" & user_com == "Sciseor") {
       return("Win 🏆")
    } else if (user_hand =="Rock" & user_com == "Paper") {
        return("Loss 💀")
    } else if (user_hand =="Sciseor" & user_com == "Rock") {
        return("Loss 💀")
    } else if (user_hand =="Sciseor" & user_com == "Sciseor") {
        return("Draw 😉")
    } else if (user_hand =="Sciseor" & user_com == "Paper") {
        return("Win 🏆")
    } else if (user_hand =="Paper" & user_com == "Rock") {
        return("Win 🏆")
    } else if (user_hand =="Paper" & user_com == "Sciseor") {
        return("Loss 💀")
    } else if (user_hand =="Paper" & user_com == "Paper") {
        return("Draw 😉")
    }
}

game01()
