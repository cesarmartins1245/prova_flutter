# Prova Flutter
---

## **Descrição**

Este projeto consiste em um aplicativo de autenticação e captura de informações que apresenta duas telas principais: Tela de Login e Tela de Captura de Informações.

## **Tela de Login**

Uma tela de autenticação onde o usuário é obrigado a digitar seu login e senha.

### Componentes da Tela

- Um Campo de senha
- Um campo de texto para representar o Login
- Um Label descrito "Política de privacidade"

### Comportamento da Tela

- Verifica e alerta se ambos os campos de Login e senha estão preenchidos.
- O campo senha não pode ter menos que dois caracteres.
- O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'.
- Ambos os campos não podem ultrapassar 20 caracteres.
- Ambos os campos não podem terminar com o caractere de espaço no final.
- Se ambas as informações estiverem preenchidas, deve ir para a próxima tela.
- Ao tocar no label "Política de privacidade", uma página web direcionada para o google.com.br deve ser aberta.

## **Tela de Captura de Informações**

A tela deve salvar as informações digitadas pelo usuário em um card, listando essas informações salvas e dando a opção de editar ou excluir. Essas informações não podem ser perdidas ao fechar o app, ou seja, ao abrir a tela as informações salvas anteriormente devem ser mostradas na ordem.

### Componentes da Tela

- Um card principal e central
- Um campo de texto

### Comportamento da Tela

- O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode ser perdido ao interagir com a tela.
- Ao acionar o "enter", o campo tem que verificar se a informação foi preenchida.
- O Card principal deve receber a informação digitada do campo.
- As informações precisam ser salvas e lidas utilizando a biblioteca shared_preferences (https://pub.dev/packages/shared_preferences)
- O Ícone de excluir deve abrir um pop-up confirmando a ação.
- Obrigatória a utilização do plugin MOBX para a construção da tela.
