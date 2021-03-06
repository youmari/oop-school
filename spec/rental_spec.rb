require './rental'
require './book'
require './person'
require './student'

describe Rental do
  context 'When testing the Rental class' do
    book = Book.new 'Title', 'Author'
    student = Student.new(15, 'Math', 'King')
    rental = Rental.new(book, student, '2023/01/01')

    it 'A rental should have a date' do
      expect(rental.date).not_to be_nil
    end

    it 'A rental should have a book property of type Book' do
      expect(rental.book).not_to be_nil
      expect(rental.book).to be_a(Book)
    end

    it 'A rental should have a person property of type Person' do
      expect(rental.person).not_to be_nil
      expect(rental.person).to be_kind_of(Person)
    end
  end
end
