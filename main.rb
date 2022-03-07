require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './corrector'
require './BookUi.rb'
require './PersonUi.rb'
class UserInterface
  def initialize
    @people = PersonUserInterface.new
    @rentals = []
    @book = BookUserInterface.new
  end

  def create_rental
    if @books.count.zero?
      puts 'Please try to create book first and try again !'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index})Title: #{book.title}, Author: #{book.author}"
      end
      book_num = gets.chomp
    end
    if @people.count.zero?
      puts 'Please try to create PERSON first and try again !'
    else
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_num = gets.chomp
    end

    puts 'Date: '
    date = gets.chomp

    @rentals << Rental.new(@books[book_num.to_i], @people[person_num.to_i], date)
    puts 'Rental created successfully'
    puts ''
  end

  def list_all_rental_by_id
    print 'ID of person: '
    id = gets.chomp

    filtred_rentals = @rentals.select { |rental| rental.person.id == id.to_i }
    filtred_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def run
    puts 'Welcome to Shcool library App!'
    puts ' '
    loop do
      puts 'Please choose an option by entring a number: '
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for given person id'
      puts '7 - Exit'

      answer = gets.chomp

      case answer
      when '1'
        @book.list_all_books
      when '2'
        @people.list_all_people
      when '3'
        @people.create_person
      when '4'
        @book.create_book
      when '5'
        create_rental
      when '6'
        list_all_rental_by_id
      when '7'
        break
      end
    end
  end
end

def main
  app = App.new
  app.run
end

main
