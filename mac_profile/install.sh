
echo "GO for instal (Ctrl-c if not):"
read tooo

sed  "s/dahni@atleadit.com/$USER@$(hostname)/g" .gitconfig >> ~/.gitconfig

cat ./.profile >> ~/.profile

cp -i ./git*.sh ~/

source ~/.profile
