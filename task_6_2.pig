A = load 'data/words.txt' as (line);
crctd = foreach A GENERATE REPLACE (line,'([^a-zA-Z0-9\\s]+)',' ') as corrected;
words = foreach crctd GENERATE FLATTEN (TOKENIZE(corrected)) as word;
word_group = group words by word;
word_count = foreach word_group generate group, COUNT(words);
grpd_count = group word_count by $1;
describe word_count;
dump grpd_count;
