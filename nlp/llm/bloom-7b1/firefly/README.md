# Bloom 7B1

## Model description

BLOOM is an autoregressive Large Language Model (LLM), trained to continue text from a prompt on vast amounts of text data using industrial-scale computational resources. As such, it is able to output coherent text in 46 languages and 13 programming languages that is hardly distinguishable from text written by humans. BLOOM can also be instructed to perform text tasks it hasn't been explicitly trained for, by casting them as text generation tasks.


## Step 1: Preparing datasets

```
mkdir -p data && cd data
# you can download dataset from huggingface, website here: https://huggingface.co/datasets/BelleGroup/school_math_0.25M
```

## Step 2: Preparing checkpoint

```
mkdir -p checkpoint && cd checkpoint
# you can download weights from hugginface, website here: https://huggingface.co/bigscience/bloom-7b1
```

## Step 3: installation
```
cd firefly
bash build_firefly.sh && bash install firefly
```

## Step 4: Training


```
bash train.sh {num_gpus} {config_file} {train_type}
```
for example train with full sft
```
bash train.sh 16 configs/bloom-sft-full.json full
```
for example train with qlora
```
bash train.sh 1 configs/bloom-sft-qlora.json qlora
```


## Results

| No.  | model     | peft        |    num_gpus        |train_samples_per_second | train_steps_per_second |
| ---- | --------- | ----------- | ------------------ | ----------------------  | -----------------------|
| 1    | bloom-7B1 | QLoRA       | 1                  |          2.041          |                0.128   |
| 2    | bloom-7B1 | Full sft    | 16                 |         4.587           |           0.072        |


## Reference

- [Firefly](https://github.com/yangjianxin1/Firefly)
