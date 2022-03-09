require './person'
require './rental'

describe Person do
  before(:each) do
    @person = Person.new(20, 'name', true)
  end

  it 'should return new instance of person class' do
    expect(@person).to be_an_instance_of(Person)
  end

  it 'should throw an error due to missing argument' do
    expect { Person.new }.to raise_error(ArgumentError)
  end

  it 'should person name to be same as name' do
    name = @person.name
    expect(name).to eql 'name'
  end

  it 'should person age to be same as 20' do
    age = @person.age
    expect(age).to eql 20
  end

  it 'should person permisson to be same as true' do
    parent_permission = @person.parent_permission
    expect(parent_permission).to be true
  end

  it 'should not reassign rentals and raise an error' do
    expect { @person.rentals = 'test' }.to raise_error(NoMethodError)
  end

  it 'should not reassign id of person and raise an error' do
    expect { @person.id = 399 }.to raise_error(NoMethodError)
  end

  context 'Testing can_use_service method' do
    it 'should return true' do
      permission = @person.can_use_services?

      expect(permission).to be true
    end

    it 'should return false' do
      person = Person.new(10, 'name')

      permission = person.can_use_services?

      expect(permission).to be false
    end
  end

  context 'Testing validate_name service' do
    it 'should return name capitalize and with less than 10 chars' do
      person = Person.new(10, 'jhonsmithcarlton')

      validate = person.validate_name(person.name)

      expect(validate).to eql 'Jhonsmithc'
    end
  end

  context 'Testing rent a book' do
    it 'should add a rental' do
      book = double('book')
      date = double('date')

      allow(book).to receive(:rentals) { [] }

      @person.rent_a_book(book, date)

      expect(@person.rentals.count).to eql 1
    end
  end
end
