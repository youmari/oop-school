require './corrector'

class Person
  attr_accessor(:name, :age, :parent_permission)
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    if of_age? && @parent_permission
      true
    else
      false
    end
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def rent_a_book(book, date)
    Rental.new(book, self, date)
  end
end
