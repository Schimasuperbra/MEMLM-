# MEMLM
Here is the source code for Multi Ensemble Machine Learning Model.  
Multi Ensemble Machine Learning Model is a novel machine-learning based model for palaeoecology.  
The source data are marked at data/Data_source.txt. Download and use of data shall be subject to respective database terms!
After download. please separately save the corresponding taxa composition dataset and environmental dataset as CSV files.

For paleoclimate reconstruction:

Please use run.ipynb for cross-validation and paleoclimate reconstruction. You can easily use it to modify the example code to yours. 
After running the program, it automatically outputs tables of attribute importance values, reconstructed climate tables (including uncertainty ranges), CV validation prediction values, and CV validation set performance tables.

For testing the robustness of a reconstruction:

Step 1: Perform 1000 reconstructions based on random environments: using the built-in functionality in the ipynb, make_recons_mee, you can directly save the results of 1000 reconstructions.
Step 2: Using R, load the randomTFF_v2 and randomTF_ml functions from the robutstness_test document. These two functions are modifications of the randomTF function for this study. Perform testing the robustness of a reconstruction analysis corresponding to traditional methods and MEM methods. Generate results with R scripts.
Note: The time spent on 999 reconstructions is very long, but currently there is indeed no alternative.

For visualization code:
This vis.ipunb includes all reconstruction chart codes mentioned in the main paper.
Note: The data tables used are compiled based on the results
