# !/bin/bash
cd /workspace/imagens-livros

if [ ! -d png  ]
then
	mkdir png
	echo "Diretório PNG criado!"
fi

for imagem in *.jpg
do
	nome_da_imagem=$(ls $imagem | awk -F. '{ print $1 }')
	convert $nome_da_imagem.jpg png/$nome_da_imagem.png
	echo "Imagem convertida:"+$nome_da_imagem
done
