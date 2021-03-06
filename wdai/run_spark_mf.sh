#!/usr/bin/env bash
script_path=`readlink -f $0`
script_dir=`dirname $script_path`
spark_dir=`dirname $script_dir`

numIterations=10
rank=10
lambda=0.05

master_ip=10.52.1.36
data_path=data/mllib/sample_binary_classification_data.txt
#data_path=/tank/projects/biglearning/wdai/datasets/mlr_datasets/synth_bin/lr2sp_dim100000_s10000000_nnz1000
#data_path=/l0/synth_bin/lr2sp_dim100000_s10000000_nnz1000
#data_path=/l0/url_reputation/url.train
#data_path=/tank/projects/biglearning/wdai/spark/spark-1.2.1/data/mllib/sample_linear_regression_data.txt
#data_path=/tank/projects/biglearning/wdai/datasets/lasso/synth_small/sparse500
#data_path=/tank/projects/biglearning/wdai/datasets/lasso/ad/ad
#data_path=/l0/ad/ad
#data_path=/tank/projects/biglearning/wdai/datasets/mf/netflix/netflix.entrylist
data_path=/tank/projects/biglearning/wdai/datasets/mf/netflix_small/netflix_small.entrylist
#data_path=/l0/netflix_small/netflix_small.entrylist
#data_path=/l0/netflix/netflix.entrylist
#data_path=/l0/subset20/url.20.train
#data_path=/l0/url_reputation/url.test
#data_path=/tank/projects/biglearning/wdai/datasets/mlr_datasets/url_reputation/url.train
#data_path=/tank/projects/biglearning/wdai/petuum/exp_apps/new_mlr/datasets/binary_lr_small_libsvm1.train.0
#data_path=/l0/datasets/lr2_high_dim_tiny_libsvm1.train.0
#data_path=/l0/datasets/lr2_dim1k_s100k_libsvm1.train.0
#data_path=/tank/projects/biglearning/wdai/petuum/exp_apps/new_mlr/datasets/lr2_high_dim_tiny_libsvm1.train.0
#data_path=/tank/projects/biglearning/wdai/petuum/exp_apps/new_mlr/datasets/lr2_dim100_tiny_libsvm1.train.0
#data_path=/l0/datasets/lr2_dim100_tiny_libsvm1.train.0
#data_path=/tank/projects/biglearning/wdai/petuum/exp_apps/new_mlr/datasets/lr2sp_dim2000_s10000_nnz1000
#data_path=/l0/datasets/lr2sp_dim2000_s10000_nnz1000
#data_path=/l0/datasets/lr2sp_dim20000_s1000000_nnz1000
#data_path=/tank/projects/biglearning/wdai/petuum/exp_apps/new_mlr/datasets/kdda/kdda

cmd="time $spark_dir/bin/spark-submit \
    --class MatrixFactorization \
    --master spark://${master_ip}:7077 \
    --driver-memory 100G \
    $script_dir/mf/target/mf-1.0.jar \
    --numIterations ${numIterations} \
    --lambda ${lambda} \
    --rank ${rank}
    ${data_path}"
echo $cmd
eval $cmd
