cd ~

sudo apt update && sudo apt -y upgrade
sudo apt install -y ansible

mv AnsibleDevEnv/setup.yml ~/
ansible-playbook setup.yml
rm setup.yml
rm setup.retry

. .bash_profile

mv AnsibleDevEnv/buildpipeline.yml ~/
ansible-playbook buildpipeline.yml
rm buildpipeline.yml
rm buildpipeline.retry

rm -rf AnsibleDevEnv
