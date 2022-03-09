require './student'

describe Student do
  before(:each) do
    @student = Student.new(20, 'name', true)
  end

  it 'should return new instance of student class' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'should throw an error due to missing argument' do
    expect { Student.new }.to raise_error(ArgumentError)
  end

  it 'should student name to be same as name' do
    name = @student.name
    expect(name).to eql 'name'
  end

  it 'should student age to be same as 20' do
    age = @student.age
    expect(age).to eql 20
  end

  it 'should student permisson to be same as true' do
    parent_permission = @student.parent_permission
    expect(parent_permission).to be true
  end

  it 'should not reassign rentals and raise an error' do
    expect { @student.rentals = 'test' }.to raise_error(NoMethodError)
  end

  it 'should not reassign id of student and raise an error' do
    expect { @student.id = 399 }.to raise_error(NoMethodError)
  end

  context 'Testing can_use_service method' do
    it 'should return true' do
      permission = @student.can_use_services?

      expect(permission).to be true
    end

    it 'should return false' do
      student = Student.new(10, 'name')

      permission = student.can_use_services?

      expect(permission).to be false
    end
  end

  context 'Testing validate_name service' do
    it 'should return name capitalize and with less than 10 chars' do
      student = Student.new(10, 'jhonsmithcarlton')

      validate = student.validate_name(student.name)

      expect(validate).to eql 'Jhonsmithc'
    end
  end

  context 'Testing rent a book' do
    it 'should add a rental' do
      book = double('book')
      date = double('date')

      allow(book).to receive(:rentals) { [] }

      @student.rent_a_book(book, date)

      expect(@student.rentals.count).to eql 1
    end
  end

  context 'Testing play_hooky method' do
    it "should return same string ¯\(ツ)/¯" do
      play_hooky = @student.play_hooky

      expect(play_hooky).to eql '¯(ツ)/¯'
    end
  end
end
