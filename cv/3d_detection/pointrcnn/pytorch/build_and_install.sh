# Copyright (c) 2024, Shanghai Iluvatar CoreX Semiconductor Co., Ltd.
# All Rights Reserved.

cd pointnet2_lib/pointnet2
python3 setup.py install
cd ../../

cd lib/utils/iou3d/
python3 setup.py install

cd ../roipool3d/
python3 setup.py install

cd ../../../tools
