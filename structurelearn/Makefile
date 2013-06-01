coffee_mat.tsv:
	python mkmatrix.py ../data/coffee.txt coffee_mat.tsv

book_mat.tsv:
	python mkmatrix.py ../data/book.txt book_mat.tsv

coffee_graph_mcmc_100samps_10burnin.dot: coffee_graph_mcmc_100samps_10burnin.tsv
	python adj2dot.py ../data/coffee.txt coffee_graph_mcmc_100samps_10burnin.tsv > coffee_graph_mcmc_100samps_10burnin.dot
