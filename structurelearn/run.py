import sys
import numpy as np
import mkmatrix
import adj2tsv

datasets = ['book', 'coffee', 'egypt', 'tomhanks', 'voldemort']

# Convert datasets to matrix form, sampling # relations down to 150
np.random.seed(60)
for dataset in datasets:
    extractions_file = '../data/%s.txt' % dataset
    arg_pairs, rels = mkmatrix.get_matrix_axes(extractions_file)
    sampidx = np.random.choice(len(rels), min(len(rels), 150), replace=False)
    sampled_rels = sorted([rels[i] for i in sampidx])
    with open('%s_sampled_rels.txt' % dataset, 'wb') as f:
        for rel in sampled_rels:
            print >> f, rel
    mkmatrix.mkmatrix(arg_pairs, sampled_rels, extractions_file, '%s_mat.tsv' % dataset)
