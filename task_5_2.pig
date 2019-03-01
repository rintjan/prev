A = load 'data/tw.txt' using PigStorage('\t') as (uid:int, fid:int);
grpd = group A by uid;
followers = foreach grpd generate group, SUM(A.fid) as tf;
SPLIT followers INTO upper IF $1>=8, lower IF $1<=8;
dump upper;
