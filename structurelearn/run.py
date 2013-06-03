import sys
import numpy as np
import mkmatrix
import glob
import re
import string

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

# -- Do Bayes net structure learning in matlab and export .adj.tsv files for the graphs

# Convert .adj.tsv files to .res.tsv files
for adj_tsv_file in glob.glob('*.adj.tsv'):
    dataset = string.split(adj_tsv_file, '_')[0]
    graph_basename = '.'.join(string.split(adj_tsv_file, '.')[0:-2])

    extractions_file = '../data/%s.txt' % dataset
    arg_pairs, ignore = mkmatrix.get_matrix_axes(extractions_file)
    rels = [l.strip() for l in open('%s_sampled_rels.txt' % dataset, 'r')]
    adjmat = np.loadtxt(adj_tsv_file)

    with open('%s.res.tsv' % graph_basename, 'wb') as f:
        for (i, j), value in np.ndenumerate(adjmat):
            if value == 1:
                print >> f, rels[i] + "\t" + rels[j]
