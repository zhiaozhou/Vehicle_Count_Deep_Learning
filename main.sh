cd /home/paperspace/Vehicle_Count/slim
nohup python train_image_classifier.py \
    --train_dir=/home/paperspace/Vehicle_Count/my_train \
    --dataset_dir=/home/paperspace/Vehicle_Count/data/train \
    --num_samples=97309 \
    --num_classes=41 \
    --model_name=inception_v4 \
    --checkpoint_exclude_scopes=InceptionV4/Logits,InceptionV4/Aux_logits \
    --trainable_scopes=InceptionV4/Logits,InceptionV4/Aux_logits \
    --learning_rate=0.01 \
    --learning_rate_decay_factor=0.5\
    --num_epochs_per_decay=50 \
    --ignore_missing_vars=True \
    --max_number_of_steps=240000 \
    --batch_size=64 > output.log 2>&1 & 


python eval_image_classifier.py --dataset_dir=/home/paperspace/Vehicle_Count/data/validation --model_name=inception_resnet_v2 --checkpoint_path=/home/paperspace/Vehicle_Count/my_train_resnet --eval_dir=/home/paperspace/Vehicle_Count/my_eval_resnet --batch_size=64 --num_examples=32989 --num_classes=41 \

python eval_image_classifier.py --dataset_dir=/home/paperspace/Vehicle_Count/data/ --dataset_split_name=validation --model_name=inception_v4 --checkpoint_path=/home/paperspace/Vehicle_Count/my_train --eval_dir=/home/paperspace/Vehicle_Count/my_eval --batch_size=64 --num_examples=32989  

cd /home/paperspace/Vehicle_Count/slim
nohup python train_image_classifier.py \
    --train_dir=/home/paperspace/Vehicle_Count/my_train_resnet \
    --dataset_dir=/home/paperspace/Vehicle_Count/data/train \
    --checkpoint_path=/home/paperspace/Vehicle_Count/checkpoints/inception_resnet_v2_2016_08_30.ckpt \
    --num_samples=97309 \
    --num_classes=41 \
    --model_name=inception_resnet_v2 \
    --checkpoint_exclude_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits \
    --learning_rate=0.01 \
    --max_number_of_steps=240000 \
    --batch_size=64 > output.log 2>&1 & 
    
    

nohup python train_image_classifier.py     --train_dir=/home/paperspace/Vehicle_Count/my_train_resnet \     --dataset_dir=/home/paperspace/Vehicle_Count/data/train \   --num_samples=97309     --num_classes=41    --model_name=inception_resnet_v2     --checkpoint_path=/home/paperspace/Vehicle_Count/checkpoints/inception_resnet_v2_2016_08_30.ckpt \ --learning_rate=0.01 --learning_rate_decay_factor=0.50 --num_epochs_per_decay=200 --batch_size=64  --max_number_of_steps=240000 --optimizer=adam --learning_rate_decay_type=polynomial --checkpoint_exclude_scopes=InceptionResnetV2/Logits,InceptionResnetV2/AuxLogits  > output.log 2>&1 &



python object_detection/train.py \
    --logtostderr \
    --pipeline_config_path=${定義的Config} \
    --train_dir=${訓練結果要放的檔案路徑}

1
2
3
4
5
nohup python object_detection/train.py \
    --logtostderr \
    --pipeline_config_path=/home/paperspace/Vehicle_Count/detection_training/frcn.config/ \
    --train_dir=object_detection/train/ > output.log 2>&1 &
    
python object_detection/eval.py \
    --logtostderr \
    --pipeline_config_path=/home/paperspace/Vehicle_Count/detection_training/frcn.config/ \
    --checkpoint_dir=object_detection/train/ \
    --eval_dir=object_detection/eval/
    
    
python object_detection/export_inference_graph.py \
    --input_type image_tensor \
    --pipeline_config_path /home/paperspace/Vehicle_Count/detection_training/frcn.config/ \
    --trained_checkpoint_prefix object_detection/train/model.ckpt-17604\
    --output_directory output/output_inference_graph.pb