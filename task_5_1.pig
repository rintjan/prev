A = load 'data/tw.txt' using PigStorage('\t') as (uid:int, fid:int);
grpd = group A by uid;
followers = foreach grpd generate group, SUM(A.fid) as tf;
dump followers;

