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
save coffee_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

% Try smoothing
smoothed_coffee_mat = coffee_mat + 0.1;
% ns = [];
% types = cellfun(@(x)'gaussian',cell(1,N), 'UniformOutput', false);
% paramss = cellfun(@(x){},cell(1,N), 'UniformOutput', false);
% tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_coffee_mat', ns, 'nsamples', 100, 'burnin', 10, 'type', types, 'params', paramss); toc
% -- can't get Gaussian nodes to work

tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_coffee_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save coffee_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs

% Repeat for book dataset

N = size(book_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(book_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save book_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

smoothed_book_mat = book_mat + 0.1;
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_book_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save book_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs
