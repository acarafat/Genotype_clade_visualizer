# FMDV genotype exploration

We have FMDV serotype O seqenced from Bangladesh. Many of those fall in previously established subgroup of India 2001 lineages. But other form new clades. Aim of this project is to visualize these sequences in 2D spaces where linear distance among them represents genetic distance to each other. We are planning to use multidimensional scaling method to be implemented in R. 

## Sequence file

The aligned sequence files are in `data/seqs/`
For the primary development, we are using `FMDV_typeO_tree_trimmed.fas`. This is the file which was originally used to make phylogenetic tree.

## Distance matrix creation

Distance matrix files are in `data/distance_matrix` folder
Distance matrix was created using MEGA5.2. We used Kimura-2 parametric model, Transition+Transversion, Gamma distributed (4), Pair-wise deletion. Both matrix and column format generated in csv format:
	`fmdv_dist_col.txt`
	`fmdv_dist_mat.txt`


## Multidimentional Scaling in R
MDS script in `../Scripts` folder
Script name: `clade_mds.R`
