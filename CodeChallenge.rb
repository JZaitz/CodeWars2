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
