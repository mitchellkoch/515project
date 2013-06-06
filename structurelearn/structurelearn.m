cd bnt
addpath(genpathKPM(pwd))
cd ..

load -ascii coffee_mat.tsv

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

load -ascii book_mat.tsv

N = size(book_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(book_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save book_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

smoothed_book_mat = book_mat + 0.1;
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_book_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save book_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs

% Repeat for egypt dataset

load -ascii egypt_mat.tsv

N = size(egypt_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(egypt_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save egypt_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

smoothed_egypt_mat = egypt_mat + 0.1;
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_egypt_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save egypt_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs

% Repeat for tomhanks dataset

load -ascii tomhanks_mat.tsv

N = size(tomhanks_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(tomhanks_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save tomhanks_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

smoothed_tomhanks_mat = tomhanks_mat + 0.1;
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_tomhanks_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save tomhanks_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs

% Repeat for voldemort dataset

load -ascii voldemort_mat.tsv

N = size(voldemort_mat, 2);
ns = ones(N, 1);
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(voldemort_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph = cell2mat(sampled_graphs(end));
save voldemort_graph_mcmc_100samps_10burnin.adj.tsv final_graph -ascii -tabs

smoothed_voldemort_mat = voldemort_mat + 0.1;
tic; [sampled_graphs, accept_ratio, num_edges] = learn_struct_mcmc(smoothed_voldemort_mat', ns, 'nsamples', 100, 'burnin', 10); toc
final_graph2 = cell2mat(sampled_graphs(end));
save voldemort_graph_mcmc_100samps_10burnin_smoothed.adj.tsv final_graph2 -ascii -tabs
