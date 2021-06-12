mkdir test-autoenv
conda create -y -n autoenv python=3.9
echo 'conda activate autoenv' > test-autoenv/.in
echo 'PYTHONPATH="$(dirname $0)/src"' >> test-autoenv/.in
echo 'conda deactivate' > test-autoenv/.out
echo 'unset PYTHONPATH' >> test-autoenv/.out
