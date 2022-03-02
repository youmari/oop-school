#!/usr/bin/env ruby

require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './corrector'

class App
  attr_reader :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if books.count.zero?
      puts ''
      puts 'there are no books yet try to create one'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    puts ''
  end

  def list_all_people
    if @people.count.zero?
      puts ''
      puts 'There are no people yet try to create one !'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts ''
  end

  has too many lines
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    @num = gets.chomp
    case @num
    when '1'
      print 'Age: '
      @age = gets.chomp

      print 'Name: '
      @name = gets.chomp

      print 'Has parent_permission ? [Y/N]: '
      @permission = gets.chomp

      @permission = false if @permission == 'n'
      @permission = true if @permission == 'y'

      @people << Student.new(@age, @name, @permission)

      puts 'Person created successfully'
      puts ''
    when '2'

      print 'Age: '
      @age = gets.chomp

      print 'Name: '
      @name = gets.chomp

      print 'Specialization: '
      @specialization = gets.chomp

      @people << Teacher.new(@age, @name, @specialization)

      puts 'Person successfully created'
      puts ''
    else
      puts 'Please enter correct number'
    end
  end
  has too many lines

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
    puts ''
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
        list_all_books
      when '2'
        list_all_people
      when '3'
        create_person
      when '4'
        create_book
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
