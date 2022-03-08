require 'json'
class BookUserInterface
  attr_reader :books

  def initialize
    @books = []
  end

  def create_book
    title, author = book_details

    @books << Book.new(title, author)
    puts 'Book created successfully'
    puts ''
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

  def save_books_data
    if @books.length
      if File.exist?('book.json') 
        if File.empty?("book.json")
          save_books
        else
          append_books
        end
      else
        save_books
      end
    end
  end

  def retrieved_books_data_from_file
    retrieved_data = JSON.parse(File.read('book.json'))
    retrieved_data.each do |book|
      @books << Book.new(book["title"], book["author"])
    end
  end

  private

  def save_books
    books_data = []
    @books.each do |book|
      books_data << {title: "#{book.title}",author: "#{book.author}"}
    end
    File.write('book.json',JSON.generate(books_data))
  end

  def append_books
    retrieved_data = JSON.parse(File.read('book.json'))
    @books.each do |book|
      retrieved_data << {title: "#{book.title}",author: "#{book.author}"}
    end
    File.write('book.json',JSON.generate(retrieved_data))
  end

  def book_details
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end
