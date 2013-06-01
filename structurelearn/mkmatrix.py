import sys

# Get the dimensions of the matrix
arg_pairs = set()
rels = set()
with open(sys.argv[1], 'rb') as fin:
    for line in fin:
        split_line = line.split('\t')
        arg1 = split_line[0]
        rel = split_line[1]
        arg2 = split_line[2]
        arg_pairs.add((arg1, arg2))
        rels.add(rel)
arg_pairs = sorted(list(arg_pairs))
rels = sorted(list(rels))
print arg_pairs
print
print rels

import numpy as np
matrix = np.zeros(dtype=np.int, shape=(len(arg_pairs), len(rels)))

# Fill in the matrix using counts of occurrences
with open(sys.argv[1], 'rb') as fin:
    for line in fin:
        split_line = line.split('\t')
        arg1 = split_line[0]
        rel = split_line[1]
        arg2 = split_line[2]
        row = arg_pairs.index((arg1, arg2))
        col = rels.index(rel)
        matrix[row, col] += 1

np.savetxt(sys.argv[2], matrix, delimiter='\t', fmt='%d')    