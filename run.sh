#!/bin/bash

# default using gpt-4-1106-preview (128k) in core.llm.py api_func

# using SQL-Llama endpoint
# export OPENAI_API_BASE='http://0.0.0.0:8000/v1'

# Generate SQL on foo dataset for env test
# This will get ./outputs/foo/output_bird.json and ./outputs/foo/predict_test.json
# proxy 
source activate macsql
export http_proxy="socks5h://10.176.24.76:10802"
export https_proxy="socks5h://10.176.24.76:10802"


# python ./run.py --dataset_name "bird" \
#    --dataset_mode="test" \
#    --input_file "./data/foo/test.json" \
#    --db_path "./data/foo/test_databases" \
#    --tables_json_path "./data/foo/test_tables.json" \
#    --output_file "./outputs/foo/output_bird.json" \
#    --log_file "./outputs/foo/log.txt"

# echo "Generate SQL on env test data done!"


#################### BIRD dev 【run】count=1534 #########
# # Generate SQL on BIRD dev dataset
# python ./run.py --dataset_name="bird" \
#    --dataset_mode="dev" \
#    --input_file="./data/bird/dev.json" \
#    --db_path="./data/bird/dev_databases/" \
#    --tables_json_path "./data/bird/dev_tables.json" \
#    --output_file="./outputs/bird/output_bird.json" \
#    --log_file="./outputs/bird/log.txt"


# use gold schema
# python ./run.py --dataset_name="bird" \
#    --dataset_mode="dev" \
#    --input_file="./data/bird/dev.json" \
#    --db_path="./data/bird/dev_databases/" \
#    --tables_json_path "./data/bird/dev_tables.json" \
#    --output_file="./outputs/bird_gold_schema/output_bird.json" \
#    --log_file="./outputs/bird_gold_schema/log.txt" \
#    --use_gold_schema


# #################### BIRD dev 【evaluation】=1534, see evaluation_bird_ex_ves.sh #########


# #################### Spider dev 【run】count=1034 #########
# Generate SQL on SPIDER dev dataset
# python ./run.py --dataset_name "spider" \
#    --dataset_mode="dev" \
#    --input_file "./data/spider/dev.json" \
#    --db_path "./data/spider/database" \
#    --tables_json_path "./data/spider/tables.json" \
#    --output_file "./outputs/spider/output_spider.json" \
#    --log_file "./outputs/spider/log.txt" \
#    --start_pos 0 \

# #################### Spider dev 【evaluation】EX and EM count=1034 #########
# python ./evaluation/evaluation_spider.py \
#    --gold "./data/spider/dev_gold.sql" \
#    --db "./data/spider/database" \
#    --table "./data/spider/tables.json" \
#    --pred "./outputs/spider/pred_dev.sql" \
#    --etype "exec"

# echo "Done!"

#################### SCIENCE dev 【run】count=1534 #########
# # Generate SQL on SCIENCE dev dataset
python ./run.py --dataset_name="science" \
   --dataset_mode="dev" \
   --input_file="./data/science/dev/dev.json" \
   --db_path="./data/science/dev/dev_databases/" \
   --tables_json_path "./data/science/dev/dev_tables.json" \
   --output_file="./outputs/science/output_science.json" \
   --log_file="./outputs/science/log.txt"

echo "Done!"
