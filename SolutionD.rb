#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
  def initialize
    @number_of_game =0
    @average_guess= 0
    @total_guess =0
    @judge =0
  end

    def display_greeting
        Console_Screen.cls
        print "\t\t Welcome to the Ruby Number Guessing Game!" +
        "\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " +
        "continue."

        Console_Screen.pause
    end

    def display_instruction
        Console_Screen.cls
        puts "Instruction:\n\n"

        puts "This game randomly generates a number from 1 to 1000 and "
        puts "challaenges you to identify it in as few guesses and possible "
    end

    def generate_number
        return randomNo = 1 + rand(1000)
    end

    def play_game
        number = generate_number

        loop do
            Console_Screen.cls
            print "\nEnter your guess and press the enter key: "

            reply = STDIN.gets
            reply.chop!
            reply = reply.to_i

            @judge +=1
            if @judge >2
              Console_Screen.cls
              puts "You lost the game!"
              Console_Screen.pause
              break
            end

            if reply < 1 or reply > 1000 then
              Console_Screen.cls

                puts "Invalid inputs. inputs should be within 1 to 1000"
                print "Press Enter to input again."

              Console_Screen.pause
                redo # redo the ciurrent iteration of the loop
            end

            @number_of_game +=1
            @total_guess +=reply
            @average_guess = @total_guess/@number_of_game

            if reply == number then
                Console_Screen.cls
                puts "You have guessed the number! Press Enter to continue."
                print "You plays "+@number_of_game.to_s+" and average is "+@average_guess.to_s
                Console_Screen.pause
                break
            elsif reply < number then
                Console_Screen.cls
                puts "Your guess is too low! Press enter to continue."
                print "You plays "+@number_of_game.to_s+" and average is "+@average_guess.to_s
                Console_Screen.pause
            elsif reply > number then
                Console_Screen.cls
                puts "Your guess is too high! Press enter to continue."
                print "You plays "+@number_of_game.to_s+" and average is "+@average_guess.to_s
                Console_Screen.pause
            end

        end

    end

    def display_credits
        Console_Screen.cls
        puts "\t\t\Thanks you for playing the number game!!"
    end

    $noRight = 0

    Console_Screen = Screen.new

    SQ = Game.new

    SQ.display_greeting

    answer = ""

    loop do
        Console_Screen.cls

        print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

        answer = STDIN.gets

        answer.chop!

        break if answer == "y" || answer == "n"
    end

    if answer == "n"

        Console_Screen.cls

        puts "Perhaps anoher time.\n\n"

    else
        SQ.display_instruction

        loop do
            SQ.play_game

            Console_Screen.cls

            print "Would you like to play again? (y/n): "

            playAgain = STDIN.gets
            playAgain.chop!

            break if playAgain == "n"
        end

        SQ.display_credits

    end

end
