class Corrector
  def correct_name(name)
    name.strip! if name.size > 10

    name.capitalize!
  end
end
