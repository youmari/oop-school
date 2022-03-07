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

  private
  def book_details
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end