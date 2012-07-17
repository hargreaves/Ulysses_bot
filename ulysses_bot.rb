# Brings in text from a file and parses it into an array of words

source_text = File.read("source_text.txt")
source_text_words = source_text.split(' ')

# Create a hash of all word pairs and the words that follow them

word_pairs_and_probabilities = {}
key_length = 2

source_text_words.each_with_index do |word, index|
  hash_key = "#{word} #{source_text_words[index + key_length - 1]}"
  hash_value = source_text_words[index + key_length]
  if word_pairs_and_probabilities[hash_key]
    word_pairs_and_probabilities[hash_key] << hash_value
  else
    word_pairs_and_probabilities[hash_key] = [hash_value]
  end
end

# Flatten the hash to put the keys into an array

word_pairs_array = []
wpp_array = word_pairs_and_probabilities.flatten
(0..wpp_array.length-1).each do |k|
	if wpp_array[k].is_a? String
	word_pairs_array << wpp_array[k]
	end
end


# Select a random word pair and put each word in variables STILL NEEDS MOD FOR KEY_LENGTH > 2

random_word_pair = word_pairs_array.sample
random_word_array = random_word_pair.split(' ')
start_word_1 = random_word_array[0]
start_word_2 = random_word_array[1]


# Determine sentence length

sentence_length = rand(3..15)

# Use the probabilities to put together an array of the sentence STILL NEEDS MOD FOR KEY_LENGTH > 2

sentence_array = ["#{start_word_1}", "#{start_word_2}"]

(0..sentence_length-1).each do |i|
	second_to_lastword = sentence_array[i]
	lastword = sentence_array[i+1]
	probable_following_words = word_pairs_and_probabilities["#{second_to_lastword} #{lastword}"]
	a_following_word = probable_following_words.sample
	sentence_array << a_following_word
end

# Convert the array into a string and puts it

sentence = ""
(0..sentence_array.length-1).each do |j|
	sentence = sentence + sentence_array[j] + " "
end

puts sentence


# simple_hash = {}
# simple_hash["they came"] =["down"]
