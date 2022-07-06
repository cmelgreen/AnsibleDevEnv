# get email, assume github username is same and split it off from domain
echo Email for github?
read -r email
name=$(echo "$email" | grep -o '^[^@]*')

# Setup basic development env
cd ~

sudo apt update && sudo apt -y upgrade
sudo apt install -y ansible

sleep 10

mv AnsibleDevEnv/setup.yml ~/
sudo ansible-playbook setup.yml
rm setup.yml
rm setup.retry

. .bash_profile

sleep 10

# Add infrastructure as code tools
mv AnsibleDevEnv/buildtools.yml ~/
sudo ansible-playbook buildtools.yml
rm buildtools.yml
rm buildtools.retry

rm -rf AnsibleDevEnv

#setup github
git config --global user.name "$name"
git config --global user.email "$email"
git config --global color.ui true

yes "" | ssh-keygen -t rsa -C "$email"
cat "$HOME"/.ssh/id_rsa.pub
