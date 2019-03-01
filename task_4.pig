A = load 'data/words.txt' as (line:chararray);
words_to_count = foreach A generate flatten (TOKENIZE(line)) as word_to_count;
word_group = group words_to_count by word_to_count;
word_count = foreach word_group generate group, COUNT(words_to_count);
dump word_count;

