class PersonUserInterface
  attr_reader :people

  def initialize
    @people = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    @num = gets.chomp
    case @num
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter correct number'
    end
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

  private

  def age_input
    print 'Age: '
    gets.chomp
  end

  def name_input
    print 'Name: '
    gets.chomp
  end

  def permission_input
    print 'Has parent_permission ? [Y/N]: '
    @permission = gets.chomp

    @permission = false if @permission == 'n'
    @permission = true if @permission == 'y'
  end

  def specialization_input
    print 'Specialization: '
    gets.chomp
  end

  def create_student
    age = age_input

    name = name_input

    permission = permission_input

    @people << Student.new(age, name, permission)

    puts 'Person created successfully'
    puts ''
  end

  def create_teacher
    age = age_input

    name = name_input

    specialization = specialization_input

    @people << Teacher.new(age, name, specialization)

    puts 'Person successfully created'
    puts ''
  end
end
