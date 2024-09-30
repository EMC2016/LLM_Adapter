# Adapters on LLM

## Objective
1. Design and implement different adapters on LLMs, evaluate their performance on different fields of datasets.

2. Create an adapter explainer and deploy on a web server.


## Installation

### On MacOS 

1.  **Clone the Repository**

```bash
git clone https://github.com/EMC2016/LLM_Adapter.git
```

2. **Download Data**
```bash
cd LLM_Adapter
mkdir data
cd data
./downloadDatasets.sh
```

3. **Environment Setup**

```bash
python3 -m venv env
source env/bin/activate
```

4. **Packages Installation**
```bash
pip3 install torch torchvision torchaudio
pip3 install adapters accelerate datasets sentencepiece protobuf evaluate scikit-learn
```
 
### On Docker 


## Train Adapter

```bash
python roberta_seqbn.py \
    --model_name_or_path roberta-base \
    --train_file data/rct-sample-revise/train.jsonl \
    --validation_file data/rct-sample-revise/test_sample.jsonl \
    --per_device_train_batch_size 8 \
    --per_device_eval_batch_size 8 \
    --do_train \
    --do_eval \
    --output_dir ./results/rct-20k-roberta-seqbn \
    --train_adapter \
    --adapter_config seq_bn \
    --overwrite_output_dir 1 \ 
    --max_seq_length 1024 \
    --num_train_epochs 10
```

