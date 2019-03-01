A = load 'data/words.txt' as (line);
crctd = foreach A GENERATE REPLACE (line,'([^a-zA-Z0-9\\s]+)',' ') as corrected;
words = foreach crctd GENERATE FLATTEN (TOKENIZE(corrected)) as word;
order_by_word_asc = ORDER words BY word;
order_by_word_desc = ORDER words by word DESC; 
dump order_by_word_desc;

