
LR=1e-4

MASTER_PORT=$(shuf -n 1 -i 10000-65535)

export TARGET_PERFORMANCE=32.53
export TARGET_LOSS=2.84

deepspeed --num_gpus=16 --master_port $MASTER_PORT main.py \
    --deepspeed deepspeed.json \
    --do_train \
    --train_file AdvertiseGen/train.json \
    --test_file AdvertiseGen/dev.json \
    --prompt_column content \
    --response_column summary \
    --overwrite_cache \
    --model_name_or_path data/chatglm2-6b \
    --output_dir ./output/adgen-chatglm2-6b-ft-$LR \
    --overwrite_output_dir \
    --max_source_length 64 \
    --max_target_length 64 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 1 \
    --gradient_accumulation_steps 1 \
    --predict_with_generate \
    --max_steps 5000 \
    --logging_steps 1 \
    --save_steps 1000 \
    --learning_rate $LR \
    --quantization_bit 8 \
    --fp16 
    

