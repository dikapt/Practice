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
