from mkmatrix import get_matrix_axes
import numpy as np
import sys

arg_pairs, rels = get_matrix_axes(sys.argv[1])
adjmat = np.loadtxt(sys.argv[2])

for (i, j), value in np.ndenumerate(adjmat):
    if value == 1:
        print rels[i] + "\t" + rels[j]

