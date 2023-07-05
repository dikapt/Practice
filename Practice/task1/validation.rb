module Validation
  def self.valid_name?(string)
    if string.length <= 40 && string =~ /\A[A-Za-z]+(-[A-Za-z]+)*\z/
      true
    else
      false
    end
  end

  def self.valid_inn?(string)
    if string =~ /\A[A-Z]{2}\d{10}\z/
      true
    else
      false
    end
  end

  def self.after_date?(date)
    date < Date.today
  end
end
puts Validation.valid_name?("Anna")
puts Validation.valid_name?("Anna-Maria")
puts Validation.valid_name?("Каріна-Ірина")

puts Validation.valid_name?("An-")
puts Validation.valid_name?("-")
puts Validation.valid_name?("aN")
puts Validation.valid_name?("AnnA")

puts Validation.valid_inn?("AZ1234543456")

puts Validation.valid_inn?("AЯ6787787654")
puts Validation.valid_inn?("az1234567898")
puts Validation.valid_inn?("5676567656AZ")
puts Validation.valid_inn?("AZ78987")

puts Validation.after_date?(Date.new(2003, 9, 30))
puts Validation.after_date?(Date.today)