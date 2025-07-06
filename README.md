## Objetivo

Desenvolver um sistema web de listas de tarefas multiusuário, utilizando Python, Bottle, padrão MVC, orientação a objetos e persistência em JSON. O sistema permite cadastro, login, criação, edição e remoção de listas e tarefas, com interface moderna e autenticação.

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

### 9. Documentação e Diagrama

- Escrevi o README.md explicando a estrutura, execução e personalização do sistema.
- Modelei o diagrama UML das classes, mostrando herança e associações.

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
