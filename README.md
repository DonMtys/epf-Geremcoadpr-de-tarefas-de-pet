## Objetivo

Desenvolver um sistema web de listas de tarefas multiusuário, utilizando Python, Bottle, padrão MVC, orientação a objetos e persistência em JSON. O sistema permite cadastro, login, criação, edição e remoção de listas e tarefas, com interface moderna e autenticação.

## Demonstração 
Pagina inicial 

![image](https://github.com/user-attachments/assets/72e2af02-6de4-41df-9c0f-188cde0d77cf)

Pagina de Cadastro

![image](https://github.com/user-attachments/assets/e1266441-d348-47a7-afeb-83ed593d0da7)

Pagina de Lista 

![image](https://github.com/user-attachments/assets/0aa8b6fc-ff5d-44bf-bc91-f7716ead63fb)

Pagina de Tarefas 

![image](https://github.com/user-attachments/assets/9ec8b900-20e2-4c8c-9e50-41da45f246a6)



## Etapas do Desenvolvimento

### 1. Estruturação do Projeto

- Organizei o projeto em pastas: `models`, `controllers`, `services`, `views`, `static` e `data`.
- Segui o padrão MVC para separar responsabilidades.

### 2. Implementação dos Models

- Criei a classe `BaseModel` para servir de superclasse, centralizando o atributo `id` e métodos utilitários.
- Implementei as classes `Usuario`, `Lista` e `Tarefa`, todas herdando de `BaseModel`, cada uma com seus atributos e métodos próprios.
- Garanti métodos como `to_dict`, `from_dict` e `exibir_detalhes` para facilitar a persistência e exibição.

### 3. Persistência em JSON

- Implementei a leitura e escrita dos dados em arquivos `.json` na pasta `data/`, garantindo persistência simples e eficiente.

### 4. Camada de Serviços

- Criei arquivos em `services/` para centralizar a lógica de manipulação dos dados (CRUD) de cada entidade, separando regras de negócio do restante do sistema.

### 5. Controllers

- Implementei controllers para cada entidade, herdando de `BaseController` para aproveitar métodos comuns (renderização, redirecionamento, rotas estáticas).
- Cada controller define as rotas e a lógica de interação entre usuário, dados e interface.

### 6. Views (Templates)

- Desenvolvi templates `.tpl` em `views/` para cada tela do sistema (login, cadastro, listas, tarefas, formulários).
- Adicionei feedback visual, mensagens de erro/sucesso e modal de confirmação.

### 7. Interface e Estilização

- Criei arquivos CSS modernos e responsivos em `static/css/`.
- Implementei dark mode, animações e feedback visual para melhorar a experiência do usuário.

### 8. Funcionalidades Extras

- Adicionei autenticação, proteção de rotas, filtro de listas por usuário logado, validação de campos e mensagens de feedback.
- Implementei botão de concluir tarefa e mensagem de finalização de lista.

## Como Executar

1. Crie o ambiente virtual:
   ```
   python -m venv venv
   ```
2. Ative o ambiente:
   - Linux/Mac: `source venv/bin/activate`
   - Windows: `venv\Scripts\activate`
3. Instale as dependências:
   ```
   pip install -r requirements.txt
   ```
4. Rode a aplicação:
   ```
   python main.py
   ```
5. Acesse no navegador:  
   [http://localhost:8080](http://localhost:8080)

## Personalização

Para adicionar novas entidades:
- Crie a classe em `models/`
- Crie o service correspondente em `services/`
- Crie o controller em `controllers/`
- Crie as views em `views/`
- Atualize rotas e navegação conforme necessário


## UML 


![image](https://github.com/user-attachments/assets/74ce7a65-5223-4b17-ae79-c4cf3d8c2e15)
