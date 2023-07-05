require_relative "person"

class PersonRepository
  def initialize
    @people = []
  end

  def alreadyInDatabase(person)
    get_all.each do |people|
      if person.id === people[0]
        return  "This person is not in the database"
      end
    end
  end

  def notInDatabase(person)
    get_all.each do |people|
      if person.id != people[0]
        return "This person is not in the database"
      end
    end
  end


  def add_person(person)
    if person.is_a?(Person)
      @people << person
    else
      raise ArgumentError, "Person must be a member of Person.Class"
    end
  end

 def edit_person_by_inn(inn, new_first_name, new_last_name, new_birth_date)
    person = get_byINN(inn)
    if person
      person.first_name = new_first_name
      person.last_name = new_last_name
      person.birth_date = new_birth_date
    else
      puts "Person not found for INN: #{inn}"
    end
  end

  def delete_person_by_inn(inn)
    person = get_byINN(inn)
    if person
      @people.delete(person)
      puts "Person with INN #{inn} deleted."
    else
      puts "Person not found for INN: #{inn}"
    end
  end

  def get_all
    @people
  end

  def get_byINN(inn)
    @people.find { |person| person.inn == inn }
  end

   def get_by_part_name(name_part)
    @people.select { |person| person.first_name.include?(name_part) || person.last_name.include?(name_part) }
  end

 def get_by_date_range(date_from, date_to)
    if date_from.nil? && date_to.nil?
      @people
    elsif date_from.nil?
      @people.select { |person| person.birth_date <= date_to }
    elsif date_to.nil?
      @people.select { |person| person.birth_date >= date_from }
    else
      @people.select { |person| person.birth_date >= date_from && person.birth_date <= date_to }
    end
  end

end

