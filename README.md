# TETCI_UIMC

This is the repository for the paper: **Unbalanced Incomplete Multi-view Clustering via the Scheme of View Evolution:
Weak Views are Meat; Strong Views do Eat**  accepted by IEEE Transactions on Emerging Topics in Computational Intelligence (TETCI) by Xiang Fang, Yuchong Hu, Pan Zhou, and Dapeng Oliver Wu.
This demo is only used to reproduce our experimental results, please do not use it for other purposes.

Unbalanced Incomplete Multi-view Clustering
Multi-view clustering has wide applications in many scenarios. 
In these scenarios, original data often contain unbalanced incomplete views. 
In this repository, we implement a novel method Unbalanced Incomplete Multi-view Clustering (UIMC).

We conduct extensive experiments on four real-world datasets, 
and experimental results demonstrate UIMC's superior advantages over other state-of-the-art clustering algorithms. 
The codes of the compared methods can be found on the authors' claimed websites.

## File directory

```bash
.
├── run_UIMC.m				 				  	                                                        # DEMO file of UIMC
├── UIMC.p								  	                                                            # core function of UIMC
├── Digit.mat				  				  	                                                        # data mat files
├── Init_F.m, constructW.m				  			  	                                            # variable initialization
├── NormalizeFea.m			  				  	                                                    # regularization of data
├── ClusteringMeasure.m		                  				                                      # clustering performance
└── EProjSimplex_new.m, EuDist2.m, gamma_norm.m, and L2_distance_1.m, and readsparse.m	  # intermediate functions 
```

## Usage

## Recommended operating environment

MATLAB R2020b, Windows 10, 3.30 GHz E3-1225 CPU, and 64 GB main memory.

### Download the ANIMC repository

0. Install the MATLAB. The scripts have been verified in Matlab 2019b.

1. Download this repository via git
    ```bash
    git clone https://github.com/ZeusDavide/TETCI_UIMC.git
    ```
    or download the [zip file](https://github.com/ZeusDavide/TETCI_UIMC/archive/master.zip) manually.
    
2. Get multi-view dataset: the BUAA dataset from paper "The buaa-visnir face database instructions", 
the 3-Sources dataset from (http://erdos.ucd.ie/datasets/3sources.html), the BBC dataset from (http://mlg.ucd.ie/datasets/segment.html), 
and the Handwritten digit dataset from (http://archive.ics.uci.edu/ml/datasets.html). We only provide the Handwritten digit dataset "digit.mat" in this repository as an example. 
For the other datasets in the experiments, please refer to the corresponding links or articles.

3. Add the root folder to the Matlab path before running the scripts.

### Run UIMC on unbalanced incomplete multi-view data

To reproduce the experimental results in Section "Performance Evaluation" of the paper, we need to run the scripts run_UIMC.m

### Parameter tuning tips:

For nonnegative hyper-parameters (α, β, and η),  we set α=10^{-2}, β=10^{5}, and η=10^{-1}.
In general, increasing iteration number time will promote the clustering performance and consume more time. We recommend its maximum value is 40.


## Contact

[Xiang Fang, HUST](xfang9508@gmail.com)
