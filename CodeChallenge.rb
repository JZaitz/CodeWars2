#You have to create a function that takes a positive integer number and returns the next bigger number formed by the same digits:

def next_bigger(n)
  #your code here
  arr = n.to_s.split("")
  if arr.length == 2
    arr = arr.sort.reverse
    return arr.join.to_i
  elsif arr.length == 3
    arr[-2], arr[-1] = arr[-1], arr[-2]
    if arr.join.to_i != n
      return arr.join.to_i
    else
      arr = arr.sort.reverse
      arr[-2], arr[-1] = arr[-1], arr[-2]
      return arr.join.to_i
    end
  elsif arr.length == 4
    arr[-2], arr[-1] = arr[-1], arr[-2]
    return arr.join.to_i
  else
    (arr.length-1).downto(0) do |x|
      arr[x-1], arr[x] = arr[x], arr[x-1]
      return arr.join.to_i if arr.join.to_i > n
    end
  end
end

#As breadcrumb menùs are quite popular today, I won't digress much on explaining them, leaving the wiki link to do all the dirty work in my place.
#What might not be so trivial is instead to get a decent breadcrumb from your current url. For this kata, your purpose is to create a function that takes a url, strips the first part (labelling it always HOME) and then builds it making each element but the last a <a> element linking to the relevant path; last has to be a <span> element getting the active class.
#url length is 5 or less and exclude last item if it conttains "index" in it
def generate_bc(url, separator)
  #your code here
  alph = ("a".."z").to_a
  calp = ("A".."Z").to_a
  hyphen = ["-"]
  ans = ""
  url = url.split("/")
  url.pop if url[-1].include?("index")
  url[-1].each_char do |x|
    if alph.include?(x) or calp.include?(x) or hyphen.include?(x)
      ans << x
    else
      break
    end
  end

  ans = ans.upcase
  if url.length ==3
    home = '<a href="/">HOME</a>'+ separator + '<a href="/'+ url[1]+'/">'+ url[1].upcase+'</a>'+ separator +'<span class="active">'+ ans +'</span>'
    return home
  elsif url.length == 4
    home = '<a href="/">HOME</a>'+ separator + '<a href="/'+ url[1]+'/">'+ url[1].upcase+'</a>'+ separator + '<a href="/'+ url[2]+'/">'+ url[2].upcase+'</a>'+ separator +'<span class="active">'+ ans +'</span>'
    return home
  elsif url.length == 5
    home = '<a href="/">HOME</a>'+ separator + '<a href="/'+ url[1]+'/">'+ url[1].upcase+'</a>'+ separator + '<a href="/'+ url[2]+'/">'+ url[2].upcase+'</a>'+ separator + '<a href="/'+ url[3]+'/">'+ url[3].upcase+'</a>'+ separator +'<span class="active">'+ ans +'</span>'
    return home
  end
end

#Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.
def pig_it text
  # ...
  arr = text.split(" ")
  key = ""
  alpha = ("a".."z").to_a.concat(("A".."Z").to_a)
  arr.each do |word|
   if alpha.include?(word[0])
     first = word[0]
     rest = word[1..-1]
     ay = "ay"
     key << rest + first + ay + " "
   else
     key << word
   end
  end
  key = key[0..-2] if key[-1] == " "
  return key
end


#Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:
def anagrams(word, words)
  ans = []
  words.each do |werd|
    if werd == word
      ans.push(werd)
    elsif werd.reverse == word
      ans.push(werd)
    else
      hash = Hash.new(0)
      hash2 = Hash.new(0)
      word.each_char do |x|
        hash[x] += 1
      end
      werd.each_char do |y|
        hash2[y] += 1
        ans << werd if hash == hash2 && werd.length == word.length

      end

    end
  end
  return ans
end

#The marketing team is spending way too much time typing in hashtags.
#Let's help them with out own Hashtag Generator!
#It must start with a hashtag (#).
#All words must have their first letter capitalized.
#If the final result is longer than 140 chars it must return false.
#If the input or the result is an empty string it must return false.
def generateHashtag(str)
  str = str.split(' ').each.map {|x| x.capitalize}.join.gsub(/\s+/,"").strip
  return false if str.length >= 140
  return false if str.empty?
  return "##{str}"
end

#Snail Sort
#Given a 3 x 3 array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.
def snail(array)
  ans = []
  for i in 0..2
    ans << array[0][i]
  end
  ans << array[1][2]
  for i in 2.downto(0)
    ans << array[2][i]
  end
  ans << array[1][0]
  ans << array[1][1]
  return ans
end


####  OR   #########
def snail(array)
  # enjoy
  ans = []
  ans << array[0][0]
  ans << array[0][1]
  ans << array[0][2]
  ans << array[1][2]
  ans << array[2][2]
  ans << array[2][1]
  ans << array[2][0]
  ans << array[1][0]
  ans << array[1][1]
  return ans
end

#You are given an array with several "even" words, one "odd" word, and some numbers mixed in.
#Determine if any of the numbers in the array is the index of the "odd" word. If so, return true, otherwise false.
def oddball x
  # code here
  ans = x.include?(x.find_index("odd"))
  return ans
end

#our task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way. Hours, minutes and seconds only.
def format_duration(seconds)
  #your code here
  min = seconds/60
  hour = min/60
  hourmin = hour % 60
  hoursec = hourmin % 60
  sec = seconds % 60

  return "now" if seconds == 0 #time is now
  if seconds >= 3600 #with hours
    return "#{hour} hour" if seconds == 3600
    return "#{hour} hour, #{hourmin} minute and #{sec} seconds" if hourmin == 1 && seconds >= 3600
    return "#{hour} hours, #{hourmin} minutes and #{sec} seconds" if hourmin > 1 && hoursec != 0 && seconds >= 3600
    return "#{hour} hours, #{hourmin} minutes" if hourmin > 1 && hoursecsec == 0 && seconds >= 360
  else #no hours
    return "#{sec} second" if min == 0 && sec == 1
    return "#{sec} seconds" if min == 0 && sec >= 1
    return "#{min} minute and #{sec} seconds" if min == 1
    return "#{min} minutes and #{sec} seconds" if min > 1 && sec != 0
    return "#{min} minutes" if min > 1 && sec == 0
  end
end

#Write a function dirReduc which will take an array of strings and returns an array of strings with the needless directions removed (W<->E or S<->N side by side). Regardless of order.
def dirReduc(arr)
    ncount, scount = 0, 0
    ecount, wcount = 0, 0
    ans = []
    arr.each do |y|
      ncount += 1 if y == "NORTH"
      scount += 1 if y == "SOUTH"
      ecount += 1 if y == "EAST"
      wcount += 1 if y == "WEST"
    end

    if ncount > scount
      (ncount-scount).times {|x| ans << "NORTH"}
    elsif scount > ncount
      (scount-ncount).times {|x| ans << "SOUTH"}
    end
     if  ecount > wcount
      (ecount-wcount).times {|x| ans << "EAST"}
    elsif wcount > ecount
      (wcount-ecount).times {|x| ans << "WEST"}
    end

    return ans

  end

#Write a class that, when given a string, will return an uppercase string with each letter shifted forward in the alphabet by however many spots the cipher was initialized to.
class CaesarCipher
    def initialize(shift)
      #your code here
      @shift = shift
    end

    def encode(string)
      #your code here
      ans = []
      string = string.downcase
      string = string.split("")
      alph = ("a".."z").to_a.concat(("a".."z").to_a)
      string.each do |x|
        if not alph.include?(x)
          ans << x
        else
          ind = alph.find_index(x)
          ans << alph[ind + @shift]
        end
      end
      ans = ans.join.upcase
      return ans
    end

    def decode(string)
      #your code here
      ans = []
      string = string.downcase
      string = string.split("")
      alph = ("a".."z").to_a.concat(("a".."z").to_a)
      string.each do |x|
        if not alph.include?(x)
          ans << x
        else
          ind = alph.find_index(x)
          ans << alph[ind - @shift]
        end
      end
      ans = ans.join.upcase
      return ans
    end
  end


#count the number of times 1 can be added up to n
  def exp_sum(n)
    #your code here
    count = 0
    return 1 if n == 1 or n == 0
    return 0 if n < 0
    num = n
    while n >= 1
      count += 1
      n = n-1
      num = n + count
    end
    return count
  end

#Your task in the kata is to determine how many boats are sunk damaged and untouched from a set amount of attacks. You will need to create a function that takes two arguments, the playing board and the attacks.
  def damaged_or_sunk (board, attacks)
    # Code here
    ans = []
    result = {'sunk' => 0, 'damaged' => 0, 'not_touched' => 0, 'points' => 0}
    #check if each xy was a hit add to ans type boat if hit
    attacks.each do |arr|
      if board[arr[0]-1][arr[1]-1] > 0
        result['points'] += 0.5
        ans << board[arr[0]-1][arr[1]-1]
      end
    end
    #check for unhit boats assume 1 2 3 type boats in each game
    1.upto(3) do |x|
      result['damaged'] += 1 if ans.include?(x)
      result['points'] -= 1 if not ans.include?(x) && result['points'] > 0
      result['not_touched'] += 1 if not ans.include?(x)
      result['sunk'] += 1 if ans.count(x) == x
    end

    return result

  end


# Create a Warrior class
# It must support level, rank, experience, achievements, training(event), and battle(enemy_level) methods
class Warrior
  attr_accessor :level, :rank, :experience, :achievements

  @@ranks = ["Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest"]

  def initialize(level, rank, experience, achievements)
    @level = 1
    @rank = "Pushover"
    @experience = 100
    @achievements = []
  end

  def training(event)
    @rank = "Master"
    @experience += event[1]
    @level = @experience/100
    @achievements << event[0]
    return event[0]
  end

  def battle(enemy_level)
    @experience += 5
    return "A good fight" if enemy_level >= 90
  end
end
##TESTS
tom = Warrior.new(1, "Pushover", 100, [])
Test.assert_equals(tom.level, 1)
Test.assert_equals(tom.experience, 100)
Test.assert_equals(tom.rank, "Pushover")

bruce_lee = Warrior.new(1, "Pushover", 100, [])
Test.assert_equals(bruce_lee.level, 1)
Test.assert_equals(bruce_lee.experience, 100)
Test.assert_equals(bruce_lee.rank, "Pushover")
Test.assert_equals(bruce_lee.achievements, [])
Test.assert_equals(bruce_lee.training(["Defeated Chuck Norris", 9000, 1]), "Defeated Chuck Norris")
Test.assert_equals(bruce_lee.experience, 9100)
Test.assert_equals(bruce_lee.level, 91)
Test.assert_equals(bruce_lee.rank, "Master")
Test.assert_equals(bruce_lee.battle(90), "A good fight")
Test.assert_equals(bruce_lee.experience, 9105)
Test.assert_equals(bruce_lee.achievements, ["Defeated Chuck Norris"])
##END TESTS

#Metaprogramming--Define 1,337 classes, each of which need to have 1 class method and 1 public instance method, that each return values. The names of the methods and the return values can be whatever you wish.
#Use the leet_classes method to return all of the classes in an array.

class Klassof
  @@alph = ("a".."z").to_a
  def initialize
    @random = rand 137
  end

  def nummaker
     return @random
  end

  def klassmaker
     klass = Class.new {
      def foo
        return rand 1337
      end
      def self.bar
        return @@alph[rand(26) + 1]
      end
    }
  end
end

def leet_classes
  arr = []
  jason = Klassof.new
  1337.times do
    arr.push(jason.klassmaker)
  end
  return arr
end


#A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
#Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.
def panagram?(string)
  alpha = ("a".."z").to_a
  counter = 0
  str = string.delete(" ").downcase
  alpha.each {|x| str.include?(x) ? str.delete(x) : counter += 1 }
  counter == 0 ? true : false
end

#Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.
def sum_pairs(ints, s)
    #your code here
    ans = []
    sol = []
   #0.upto(s) do |x|
   s.downto(0) do |x|
     sol << [s-x, x]
   end

   hash = {}
   #put into ans if sol is included in ints array
   sol.each do |x|
     ans << x if ints.include?(x[0]) and ints.include?(x[1])
   end
   #find max index of ints of both soltions
   ans.each do |arr|
     hash[arr] = [ints.find_index(arr[0]), ints.find_index(arr[1])].max
   end
   hash.sort_by do |k,v|
     v
   end

   return nil if hash.empty?
   hash.each {|x, y| return x}


end


#Convert PascalCase string into snake_case
#Complete the function/method so that it takes CamelCase string and returns the string in snake_case notation. Lowercase characters can be numbers. If method gets number, it should return string.
def to_underscore(string)
  inds = []
  ans = ''
  #split to array on caps and map caps downcase
  caps = string.split(/[^A-Z]*/).each.map(&:downcase)
  #break string up by caps
  caps.each {|x| inds << string.index(x.upcase)}
  #add in "_" and index of cap to ending or to next index of cap letter if it exists
  ans << string[0...inds[1]].downcase
  (inds.length).times do |n|
     ans << "_"+string[inds[n+1]...inds[n+2]].downcase if inds[n+2]
     ans << "_"+string[inds[n+1]..-1].downcase if inds[n+1] and !inds[n+2]
  end
  return ans

end

#Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double Cola" drink vending machine; there are no other people in the queue. The first one in the queue (Sheldon) buys a can, drinks it and doubles! The resulting two Sheldons go to the end of the queue. Then the next in the queue (Leonard) buys a can, drinks it and gets to the end of the queue as two Leonards, and so on.
#Write a program that will return the name of the person who will drink the n-th cola.
def whoIsNext(names, r)
  # your code
  names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

  r.times do |num|
    x = names[0]
    names = names[1..-1]
    2.times {names.push(x)}
  end

  return names[-1]
end
