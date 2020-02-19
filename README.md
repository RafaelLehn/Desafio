# Desafio Casas Bahia

## Descrição

A aplicação funciona semelhantemente ao app oficial Casas Bahia. Temos as telas de inicio, produtos, detalhe do produto, carrinho e conta.

## Instalação

Basta clonar o repositório do projeto em sua máquina.
Após isso abra o terminal e vá até a pasta do projeto para instalar os pods ou atualiza-los caso necessário
```bash
pod install
```
É necessário o Xcode instalado com simulador ou um Iphone com a versão atualizada do sistema operacional(iOS 13.2).

## Resultado
No caso o projeto não pedia a criação de quatro telas com a parte de tab bar controlller mas senti necessidade de fazer para realmente dar uma cara para o app, uma certa identidade.
Um dos desafios principais foi a questão do collection view que eu nunca havia utilizado em um projeto, por ser semelhante ao table view eu já tinha certa noção de como fazer para implementar esse elemento ao projeto.
Minha linha de racíocinio era receber as informações, utilizando MVC totalmente no app, por falta de tempo eu não implementei isso em todo o projeto.
Utilizei dois pods principais nesse projeto que eram o Alamofire e o Kingfisher.

O Alamofire para a parte de requisição HTTP para as plataformas iOS e macOS.

E o Kingfisher para a parte das imagens. Ele faz o download da imagem do URL, a enviará para o cache da memória e do disco e a exibirá no imageView. Quando você define o mesmo URL posteriormente, a imagem será recuperada do cache e mostrada imediatamente.

Em relação ao tempo gasto no projeto teve duração de algo em torno de 20 horas de tempo de execução ao longo de duas semanas.
