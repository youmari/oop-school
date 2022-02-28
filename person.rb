
class Person
  attr_accessor(:name, :age)
  attr_reader :id

  def initialize(name = "Unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
 
  def is_of_age?
    true ? @age >= 18 : false
  end

  private :is_of_age?

  def can_use_services?
    true ? self.is_of_age? && @parent_permission : false
  end
end
