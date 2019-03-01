A = load 'data/NYSE_daily' using PigStorage('\t');
dump A;
store A into 'output' using PigStorage(',');
