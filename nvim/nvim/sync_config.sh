echo -e "\n... begin nvim config sync ...\n"

set -x

cp -R ~/.config/nvim ~/projects/my-arch-stuff/nvim

cd ~/projects/my-arch-stuff
git status --ignored

{ set +x; } &> /dev/null

read -p " 🛑 Commit ALL changes? (Y/N): " confirm && [[ $confirm == [yY] ]] || exit 1

set -x

git add .
git commit -m 'updated nvim ::: for neovim cross config'
git log --oneline -n 5

{ set +x; } &> /dev/null

echo -e "\n... end ...\n"
