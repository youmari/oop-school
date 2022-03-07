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

  def get_age
    print 'Age: '
    @age = gets.chomp
  end

  def get_name
    print 'Name: '
    @name = gets.chomp
  end

  def get_permission
    print 'Has parent_permission ? [Y/N]: '
    @permission = gets.chomp

    @permission = false if @permission == 'n'
    @permission = true if @permission == 'y'
  end

  def get_specialization
    print 'Specialization: '
    @specialization = gets.chomp
  end

  def create_student
    age = get_age

    name = get_name

    permission = get_permission

    @people << Student.new(age, name, permission)

    puts 'Person created successfully'
    puts ''
  end

  def create_teacher
    age = get_age

    name = get_name

    specialization = get_specialization

    @people << Teacher.new(age, name, specialization)

    puts 'Person successfully created'
    puts ''
  end
end
