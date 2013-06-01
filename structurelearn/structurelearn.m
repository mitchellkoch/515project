cd bnt
addpath(genpathKPM(pwd))
cd ..

load -ascii coffee_mat.tsv
load -ascii book_mat.tsv

% imagesc(coffee_mat)
% imagesc(book_mat)

N = size(coffee_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(coffee_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save coffee_graph_mcmc_100samps_10burnin.tsv final_graph -ascii -tabs
