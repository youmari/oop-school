require './book'

describe Book do
  before(:each) do
    @book = Book.new('title', 'author')
  end

  it 'should return new instance of Book class' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'should throw an error due to missing argument' do
    expect { Book.new('title') }.to raise_error(ArgumentError)
  end

  it 'should book title to be same as title' do
    title = @book.title
    expect(title).to eql 'title'
  end

  it 'should book author to be same as author' do
    author = @book.author
    expect(author).to eql 'author'
  end

  it 'should not have access to reassign rentals and raise an error' do
    expect { @book.rentals = 'test' }.to raise_error(NoMethodError)
  end
end
