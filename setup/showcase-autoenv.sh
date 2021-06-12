mkdir test-autoenv
conda create -y -n autoenv python=3.9
echo 'conda activate autoenv' > test-autoenv/.in
echo 'conda deactivate' > test-autoenv/.out
