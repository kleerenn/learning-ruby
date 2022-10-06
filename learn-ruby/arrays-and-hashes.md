# arrays
- to store a list of values in a single variable
- access by index
- can be multidimensional

# Hashes
```rb
my_hash = {
    "name" => "lee",
    "age" => 10
}
my_hash["name"]
```
- create a new has using ```Hash.new```
```rb
my_hash = Hash.new
my_hash["cat"] = "steve"

test = Hasn.new(0)
# set the default value as 0 for the first element.
```

# Iterating over the Hash

- when iterating over hashes, two placeholder variables are needed as key/value pair
```rb
test = {
    "movie" => "zombie",
    "drink" => "coke"
}
test.each { |item, value| 
    print "#{item} : #{value}"
}
```

# Sorting the Hash(.sort_by)
- ascending order (from the smallest to largest)
- use ```.reverse!``` to make it descending order
```rb
colors = {
    "red" => 3,
    "blue" => 1
    "white" => 5
}
colors = colors.sort_by {|color, count|
    count
}
```
- returns an array ... (new array?)

# .to_s 
- convert the value from a number to a string 

