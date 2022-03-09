require './teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(20, 'name', 'math')
  end

  it 'should return new instance of teacher class' do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it 'should throw an error due to missing argument' do
    expect { Teacher.new }.to raise_error(ArgumentError)
  end

  it 'should teacher name to be same as name' do
    name = @teacher.name
    expect(name).to eql 'name'
  end

  it 'should teacher age to be same as 20' do
    age = @teacher.age
    expect(age).to eql 20
  end

  it 'should teacher specialization to be same as math' do
    specialization = @teacher.specialization
    expect(specialization).to eql 'math'
  end

  it 'should not reassign rentals and raise an error' do
    expect { @teacher.rentals = 'test' }.to raise_error(NoMethodError)
  end

  it 'should not reassign id of teacher and raise an error' do
    expect { @teacher.id = 399 }.to raise_error(NoMethodError)
  end

  context 'Testing can_use_service method' do
    it 'should return true' do
      permission = @teacher.can_use_services?

      expect(permission).to be true
    end

    it 'should return true' do
      teacher = Teacher.new(10, 'name', 'math')

      permission = teacher.can_use_services?

      expect(permission).to be true
    end
  end

  context 'Testing validate_name service' do
    it 'should return name capitalize and with less than 10 chars' do
      teacher = Teacher.new(10, 'jhonsmithcarlton', 'math')

      validate = teacher.validate_name(teacher.name)

      expect(validate).to eql 'Jhonsmithc'
    end
  end

  context 'Testing rent a book' do
    it 'should add a rental' do
      book = double('book')
      date = double('date')

      allow(book).to receive(:rentals) { [] }

      @teacher.rent_a_book(book, date)

      expect(@teacher.rentals.count).to eql 1
    end
  end
end
