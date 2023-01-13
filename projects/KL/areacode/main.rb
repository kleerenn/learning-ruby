dial_book = {
  'newyork' => '212',
  'newbrunswick' => '732',
  'edison' => '908',
  'plainsboro' => '609',
  'sanfrancisco' => '301',
  'miami' => '305',
  'paloalto' => '650',
  'evanston' => '847',
  'orlando' => '407',
  'lancaster' => '717'
}

def get_city_name(list)
  # list.each do |k, _v|
  #   puts k
  # end
  list.keys
end

def get_area_code(city, list)
  list[city]
end

loop do
  puts 'Do you want to look up the area code? Y/n'
  input = gets.chomp.downcase

  break if input != 'y'

  list = get_city_name(dial_book)
  puts list
  puts 'Choose the city'
  city = gets.chomp.downcase
  if dial_book.include?(city)
    code = get_area_code(city, dial_book)
    puts "it's their area code: #{code}"
  else
    puts '>> Invalid city name'
  end
end
