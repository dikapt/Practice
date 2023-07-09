require 'test/unit'
require 'date'
require_relative '../task2/person'
require 'person_test'
class PersonRepositoryTest < Test::Unit::TestCase
def setup
  @repository = PersonRepository.new
  @person1 = Person.new('Ser', 'Suhar', '123456789','2000-01-01' )
  @person2 = Person.new('Artiom', 'Kaptar', '987654321','2007-09-30')
end

def test_add_person
  @repository.add_person(@person1)
  assert_equal([@person1], @repository.people)

  assert_raise(ArgumentError) { @repository.add_person('not a person') }
end

def test_edit_person_by_inn
  @repository.add_person(@person1)
  @repository.edit_person_by_inn('123456789', 'James', 'Bond', '1977-03-20')
  assert_equal('James', @person1.first_name)
  assert_equal('Bond', @person1.last_name)
  assert_equal('1977-03-20', @person1.birth_date)

end

def test_delete_person_by_inn
  @repository.add_person(@person1)
  @repository.add_person(@person2)
  @repository.delete_person_by_inn('123456789')
  assert_equal([@person2], @repository.people)

end

def test_get_by_part_name
  @repository.add_person(@person1)
  @repository.add_person(@person2)
  assert_equal([@person1, @person2], @repository.get_by_part_name('bow'))
  assert_equal([@person2], @repository.get_by_part_name('dan'))
end

def test_get_by_date_range
  @repository.add_person(@person1)
  @repository.add_person(@person2)
  assert_equal([@person1], @repository.get_by_date_range(nil, '200-01-01'))
  assert_equal([@person2], @repository.get_by_date_range('2000-01-01', nil))
  assert_equal([@person1, @person2], @repository.get_by_date_range(nil, nil))
end
end