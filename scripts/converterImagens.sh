# !/bin/bash
cd /workspace/imagens-livros

converte_imagem() {
if [ ! -d png  ]
then
        mkdir png
        if [ $? -eq 0 ]
        then
                echo "Diretorio PNG criado!"
        fi
fi

for imagem in *.jpg
do
        local nome_da_imagem=$(ls $imagem | awk -F. '{ print $1 }')
        convert $nome_da_imagem.jpg png/$nome_da_imagem.png
        echo "Imagem convertida: " $nome_da_imagem
done
}

converte_imagem 2>errors.txt

if [ $? -eq 0 ] 
then 
        echo "Conversion was successful. Checkout png output directory"
else 
        echo "Ops, something wrong happen. We might chekout more information at errors.txt"
fi

