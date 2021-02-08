# !/bin/bash
cd ..
sudo chmod og+wrx workspace/
cd workspace/
sudo chmod og+wrx scripts/
sudo chmod og+wrx imagens-livros/
sudo chmod og+wrx imagens-novos-livros/
ls scripts/ | xargs sudo chmod og+wrx