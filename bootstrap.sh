sudo apt update && sudo apt -y upgrade
sudo apt install -y ansible
mv AnsibleDevEnv/setup.yml ~/
ansible-playbook setup.yml
. .bash_profile
