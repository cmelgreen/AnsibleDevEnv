cd ~

sudo apt update && sudo apt -y upgrade
sudo apt install -y ansible

mv AnsibleDevEnv/setup.yml ~/
ansible-playbook setup.yml
rm setup.yml
rm setup.retry

. .bash_profile

mv AnsibleDevEnv/buildtools.yml ~/
ansible-playbook buildtools.yml
rm buildtools.yml
rm buildtools.retry

rm -rf AnsibleDevEnv
