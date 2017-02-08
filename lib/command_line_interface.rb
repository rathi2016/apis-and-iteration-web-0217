def welcome

puts "*****************************"
puts "Feel free to pick a character and knw abt it "

end

def get_character_from_user
  puts "please enter a character"
  x = gets.chomp.downcase
  return x
  # use gets to capture the user's input. This method should return that input, downcased.
end
