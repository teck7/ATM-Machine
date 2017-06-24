require 'artii'

# I'll be in the street and I realize I need to withdraw $100 from an atm.
# This involve 2 classes; Atm and Person.

class Atm
  # Atm has a location and has a balance
  attr_reader :atm_location, :atm_balance  #getter
  attr_writer   #setter
  attr_accessor #getter & setter

  def initialize(atm_location, atm_balance)
    #getter || setter; not req' to def again after initialized
    @atm_location = atm_location    #setter
    @atm_balance = atm_balance      #setter
  end

  # Atm dispense cash; then define a method to dispense cash
  def dispense(amount)

     if @atm_balance >= amount
        @atm_balance = @atm_balance - amount

        puts "Atm has dispensed you with $AUD #{amount}"
      else
        puts "Sorry, we don't have enough cash for withdrawal"
      end

  end

  # Atm collect cash; then define a method to collect cash
  def collect(amount)
    @atm_balance = @atm_balance + amount
    puts "Atm has a new balance of $AUD #{@atm_balance}"
  end

end   # end of class Atm

class Person
  # Person has an account no. and has a balance
  attr_reader   :name, :account_no, :person_balance  #getter
  attr_writer   #setter
  attr_accessor #getter & setter

  def initialize()
    #getter || setter; not req' to def again after initialized
    @name = "Kevin"
    @account_no = "a1"        #setter
    @person_balance = 2000    #setter
  end

  #  Person to enter password before withdrawing cash
  def enter_password
    puts "Password: "
    print "> "
    banking_password = gets.chomp
    system "clear"

    sleep 1

    if banking_password == "password"  #smart password
      puts "You're logged in now!"
    else
      puts "Password Entered is Invalid!"
      puts "Please enter the correct password!"
      banking_password1 = gets.chomp
      system "clear"

      sleep 1

        if banking_password1 == "password" #smart password
          puts "You're logged in now!"
        else
          puts "Sorry, please contact your local branch!"
          print "Have a great day"
          gets  # prompt user to hit enter to exit
          exit(0)
        end  # End of nested if statement

      end  # End of if statement

    end  # End of enter_password method

  # Person withdraw cash; then define a method to withdraw cash
  def withdraw(amount, atm)
    atm.dispense(amount)  # using Atm dispense method
  end

  # Person deposit cash; then define a method to deposit cash
  def deposit(amount, atm)
    atm.collect(amount)  # using Atm collect method
  end

end

# Additional method to clear console
def clearConsole()
    system "clear" or system "cls"
end

###############################################################
#Atm Machine Start up
a = Artii::Base.new :font => 'banner'
puts a.asciify('Melbourne Atm')
###############################################################

###############################################################
# Now Create new instance object for both classes

# class Atm
# Value for location and value for atm balance
cbd_atm = Atm.new("Melbourne", 1000) # 2 values for 2 argv

# class Person
# No value needed as default values are initialised
kevin = Person.new() # 0 value added for 0 argv
##############################################################

# Assume the user inserted his/her bank card
puts "Your bank card is inserted"

sleep 1
clearConsole()

# Verify his/her bank card
puts "Your bank card is being verified"

sleep 1
clearConsole()

# We can greet the person
puts "Hi #{kevin.name}"

# We can ask for the atm location
puts "Welcome to #{cbd_atm.atm_location} Atm branch"

sleep 2
clearConsole()

# We can ask for the atm machine balance
puts "Please note that you cannot withdraw more than
$AUD #{cbd_atm.atm_balance} from this Atm machine"

# Ask if he/she wish to proceed
puts "Do you wish to continue?"

# Outer While loop
while true

  puts "Please select one of the following"
  puts "'C' to Continue, 'Q' to Quit"

  # prompt the user for input
  print "> "
  proceed_option = gets.chomp.upcase

  clearConsole()

  # Outer case
  case proceed_option

  when 'C'
    sleep 2
    clearConsole()

    # We ask the user to enter password before proceeding
    puts kevin.enter_password

    # We can ask for the person account no.
    puts "Your account number is #{kevin.account_no}"

    # We can ask for the person account balance.
    puts "Your current account balance is $AUD #{kevin.person_balance}"

    # Nested While loop
    # We ask the user to choose what to be done at this time
    while true

      puts "Please select one of the following"
      puts "1. Withdraw money"
      puts "2. Deposit money"
      puts "3. Quit"

      print "> "
      option = gets.chomp

      clearConsole()

      # inner case
      case option

      when "1"
        puts "Please enter your desired withdrawal amount"
        print "> "
        withdraw_amount_option = gets.chomp.to_i # convert to integer

        # Now kevin can use withdraw method
        # Specifying the value amount and atm location
        kevin.withdraw(withdraw_amount_option, cbd_atm)
        puts "Your account balance is $AUD#{kevin.person_balance-
        withdraw_amount_option}"
        puts "Thank you for withdrawing from this Atm!"
        sleep 1
        exit(0)

      when "2"
        puts "Please enter your deposit amount"
        print "> "
        deposit_amount_option = gets.chomp.to_i # convert to integer

        # Now kevin can use deposit method
        # Specifying the value amount and atm location
        kevin.deposit(deposit_amount_option, cbd_atm)
        puts "Your account balance is $AUD#{kevin.person_balance+deposit_amount_option}"
        puts "Thank you for depositing into this Atm!"
        sleep 1
        exit(0)

      when "3"
        exit(0)

      else

        puts "Please try again!"

      end # End of inner case statement

    end # End of inner while statement

  when 'Q'
    exit(0)

  else
    puts "Please try again!"

  end # End of outer case statement

end # End of outer while statement
