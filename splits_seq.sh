#!/bin/bash
python create_splits_seq.py --label_frac=1 --k=1 --task=task_tcga_lung_subtyping --val_frac=0.3 --test_frac=0.3 --dataset=TCGA_LUNG