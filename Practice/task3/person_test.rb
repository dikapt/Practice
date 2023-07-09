require 'test/unit'
require 'date'
require_relative '../task2/person'
class PersonTest < Test::Unit::TestCase
def setup
  @person = Person.new('Anna', 'Maria', 'AB1234568947', Date.today.prev_day)
end

['A', 'a', 'A-', '-Л', '', ' ', '-', 'A-Д', 'A-m', 'a-M', 'a-m', 'Л', 'К-П', 'л-П', 'л-п', '1111'].each do |last_name|
  define_method("test_invalid_last_name_#{last_name}") do
    assert_raise { @person.last_name = last_name }
  end
end

['AX1234567890', 'GF0982222321', 'EF2354678199', 'BV1789034561', 'VC1298356790'].each do |inn|
  define_method("test_valid_inn_#{inn}") do
    @person.inn = inn
    assert_equal(inn, @person.inn, "INN #{inn} is valid")
  end
end

['Az1234567890', 'zF0987654321', 'ef2354678124', 'BV1789034', 'VC12983567904545', 'SADSADSDSASDA', '282828', '-', ' ', ''].each do |inn|
  define_method("test_invalid_inn_#{inn}") do
    assert_raise { @person.inn = inn }
  end
end

['2000-11-12', '1995-09-23', '1800-12-21'].each do |birth_date|
  define_method("test_valid_birth_date_#{birth_date}") do
    @person.birth_date = birth_date
    assert_equal(Date.parse(birth_date), @person.birth_date, "Birth date #{birth_date} is valid")
  end
end

['2223-11-12', '2058-34-32', ' ', '-', 2054-11-01].each do |birth_date|
  define_method("test_invalid_birth_date_#{birth_date}") do
    assert_raise { @person.birth_date = birth_date }
  end
end
['id32476598762', 'id324765987', 'VDs545432347', 'BF767569ds8'].each do |id|
  define_method("test_valid_id_ = \"#{id}\"") do
    @person.id = id
    assert_equal(id, @person.id, "id #{id} is valid")
  end
end

[' ', '', '-', 'afwadawdaw', '12325345', 'SDfSEFE'].each do |id|
  define_method("test_invalid_id_ = \"#{id}\"") do
    assert_raise { @person.id = id }
  end
end

['2000-02-02', '1990-01-09', '1900-09-09'].each do |birth_date|
  define_method("test_valid_birth_date_ = \"#{birth_date}\"") do
    @person.birth_date = birth_date
    assert_equal(birth_date, @person.birth_date, "Birth date #{birth_date} is valid")
  end
end

[' ', '', '-', '2024-07-07', '2050-09-09', 2040-11-01].each do |birth_date|
  define_method("test_invalid_birth_date_ = \"#{birth_date}\"") do
    assert_raise { @person.birth_date = birth_date }
  end
end
end