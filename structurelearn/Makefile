# Use run.py now instead

coffee_mat.tsv:
	python mkmatrix.py ../data/coffee.txt coffee_mat.tsv

book_mat.tsv:
	python mkmatrix.py ../data/book.txt book_mat.tsv

coffee_graph_mcmc_100samps_10burnin.dot: coffee_graph_mcmc_100samps_10burnin.tsv
	python adj2dot.py ../data/coffee.txt coffee_graph_mcmc_100samps_10burnin.tsv > coffee_graph_mcmc_100samps_10burnin.dot

coffee_graph_mcmc_100samps_10burnin.res.tsv: coffee_graph_mcmc_100samps_10burnin.adj.tsv
	python adj2tsv.py ../data/coffee.txt coffee_graph_mcmc_100samps_10burnin.adj.tsv > coffee_graph_mcmc_100samps_10burnin.res.tsv

coffee_graph_mcmc_100samps_10burnin_smoothed.res.tsv: coffee_graph_mcmc_100samps_10burnin_smoothed.adj.tsv
	python adj2tsv.py ../data/coffee.txt coffee_graph_mcmc_100samps_10burnin_smoothed.adj.tsv > coffee_graph_mcmc_100samps_10burnin_smoothed.res.tsv

