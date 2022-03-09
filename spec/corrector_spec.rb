require './corrector'

describe Corrector do
  it 'should return name capitalize and with less than 10 chars' do
    corrector = Corrector.new

    validate = corrector.correct_name('jhonsmithcarlton')

    expect(validate).to eql 'Jhonsmithc'
  end

  it 'should just return name capitalize ' do
    corrector = Corrector.new

    validate = corrector.correct_name('james')

    expect(validate).to eql 'James'
  end
end
