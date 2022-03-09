require './classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('label')
  end

  it 'should return new instance of classroom class' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end

  it 'should throw an error due to missing argument' do
    expect { Classroom.new }.to raise_error(ArgumentError)
  end

  it 'should classroom label to be same as label' do
    label = @classroom.label
    expect(label).to eql 'label'
  end

  it 'should not have access to reassign students and raise an error' do
    expect { @classroom.students = 'test' }.to raise_error(NoMethodError)
  end

  context 'Testing add_student method' do
    it 'it should add a student' do
      student = double('student')

      allow(student).to receive(:classroom=) {
                          '(#<Classroom:0x000055b38cf304e0 @label="label", @students=[#<Double "student">]>)'
                        }
      allow(student).to receive(:name) { 'jhon' }
      allow(student).to receive(:age) { 20 }

      @classroom.add_student(student)

      expect(@classroom.students.first.name).to eql 'jhon'
    end
  end
end
