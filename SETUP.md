# Step 1
Ran the following commands one by one:

This command generates 1024 patches
`
python create_patches_fp.py --source=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/WSI/Lung --slide_name_file=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/slide_name_df.csv --preset=/mnt/linux/programmes/itu/semester5/thesis1/ViLa-MIL/presets/tcga.csv --save_dir=output --patch_size=1024 --step_size=1024 --seg --patch --uuid_name_file=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/uuid_file_name.xlsx
`
This command generates 2048 patches
`
python create_patches_fp.py --source=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/WSI/Lung --slide_name_file=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/slide_name_df.csv --preset=/mnt/linux/programmes/itu/semester5/thesis1/ViLa-MIL/presets/tcga.csv --save_dir=output --patch_size=2048 --step_size=2048 --seg --patch --uuid_name_file=/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/uuid_file_name.xlsx
`

# Step 2
Run the feature_extraction/patch_generation.py file 2 times with following configuration
1st time:
line 12,15 should not be commented and line 13,16 should be commented

2nd time
line 13,16 should not be commented and line 12,15 should be commented

first time will create patches in gen_patches/small folder
2nd time will create patches in gen_patches/large folder


# Step 3
`
"program": "${workspaceFolder}/feature_extraction/patch_extraction.py",
"console": "integratedTerminal",
"args": [
    "--patches_path=/mnt/linux/programmes/itu/semester5/thesis1/ViLa-MIL/gen_patches",
    "--library_path=patch_features",
    "--model_name=clip_RN50",
    "--batch_size=16"
]
`

# Step 4

Copy the following file
/mnt/linux/programmes/itu/semester5/thesis1/tcga-lung/slide_name_df.csv

to  ${workspaceFolder}/TCGA_Lung_subtyping.csv

# Step 5
Change the line 39 in create_splits_seq.py file to following:
`
label_dict = {'Neoadjuvant therapy':0,'Prior malignancy': 1,'Synchronous malignancy':2, np.nan:3},
`

add following at line 96 in the file datasets/dataset_generic.py
`
label = label.astype(float)
`

`
"program": "${workspaceFolder}/create_splits_seq.py",
"console": "integratedTerminal",
"args": [
    "--label_frac=1",
    "--k=1",
    "--task=task_tcga_lung_subtyping",
    "--val_frac=0.3",
    "--test_frac=0.3",
    "--dataset=TCGA_LUNG"
]
`

splits folder generated
