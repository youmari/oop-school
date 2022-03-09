require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './corrector'
require './book_ui'
require './person_ui'
require './rental_ui'

class UserInterface
  def initialize
    @people = PersonUserInterface.new
    @book = BookUserInterface.new
    @rental = RentalUserInterface.new
  end

  def start
    puts 'Welcome to Shcool library App!'
    puts ' '
    @people.retrieved_people_data_from_file
    @book.retrieved_books_data_from_file
    command_executor
  end

  private

  def command_instruction
    puts 'Please choose an option by entring a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for given person id'
    puts '7 - Exit'
  end

  def command_options(option)
    case option
    when '1'
      @book.list_all_books
    when '2'
      @people.list_all_people
    when '3'
      @people.create_person
    when '4'
      @book.create_book
    when '5'
      @rental.create_rental(@book.books, @people.people)
    when '6'
      @rental.list_all_rental_by_id
    when '7'
      @book.save_books_data
      @people.save_people_data
      exit
    end
  end

  def command_executor
    loop do
      command_instruction
      answer = gets.chomp
      command_options(answer)
    end
  end
end

def main
  app = UserInterface.new
  app.start
end

main
