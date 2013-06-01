from mkmatrix import get_matrix_axes
import numpy as np
import sys

arg_pairs, rels = get_matrix_axes(sys.argv[1])
adjmat = np.loadtxt(sys.argv[2])

print 'digraph {'
for idx, relname in enumerate(rels):
    print "%d [label=\"%s\"]" % (idx, relname)
for (i, j), value in np.ndenumerate(adjmat):
    if value == 1:
        print str(i) + " -> " + str(j)
print '}'
