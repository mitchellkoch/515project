import sys
import numpy as np

# Get the dimensions of the matrix
def get_matrix_axes(extractions_file):
    arg_pairs = set()
    rels = set()
    with open(extractions_file, 'rb') as fin:
        for line in fin:
            split_line = line.split('\t')
            arg1 = split_line[0]
            rel = split_line[1]
            arg2 = split_line[2]
            arg_pairs.add((arg1, arg2))
            rels.add(rel)
    arg_pairs = sorted(list(arg_pairs))
    rels = sorted(list(rels))
    return arg_pairs, rels

def mkmatrix(arg_pairs, rels, extractions_file, outfile):
    matrix = np.zeros(dtype=np.int, shape=(len(arg_pairs), len(rels)))

    # Fill in the matrix using counts of occurrences
    with open(extractions_file, 'rb') as fin:
        for line in fin:
            split_line = line.split('\t')
            arg1 = split_line[0]
            rel = split_line[1]
            arg2 = split_line[2]
            row = arg_pairs.index((arg1, arg2))
            if rel in rels:
                col = rels.index(rel)
                matrix[row, col] += 1

    np.savetxt(outfile, matrix, delimiter='\t', fmt='%d')    
