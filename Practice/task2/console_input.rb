require_relative "Validation"
require_relative "Person"

include Validation

module ConsoleInput

  def get_string_input()
    input = nil
    until input
      print "Input alphabetic value: "
      input = gets.chomp
    end
    input
  end

 def get_name_input()
    input = nil
    until input && valid_name?(input)
      print "Input name-typed value (ex. Anna-Maria): "
      input = gets.chomp
    end
    input
  end

  def get_integer_input()
    input = nil
    until input && input.match?(/\A[1-9]+\z/)
      print "Input integer value: "
      input = gets.chomp
    end
    input.to_i
  end

  def get_inn_input()
    input = nil
    until input && valid_inn?(input)
      print "Input inn-typed value (ex. AZ0123456789): "
      input = gets.chomp
    end
    input
  end


  def valid_date_format?(input)
    Date.parse(input)
  rescue ArgumentError
    false
  end

 def get_date_input()
    input = nil
    until input && valid_date_format?(input)
      print "Input valid date value in yyyy-mm-dd format: "
      input = gets.chomp
    end
    Date.parse(input)
  end

  private :valid_date_format?
end
