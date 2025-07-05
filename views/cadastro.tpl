%# views/cadastro.tpl
<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #23243a 0%, #3a3d5c 100%);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }
    .cadastro-container {
        max-width: 400px;
        margin: 4em auto;
        background: #2d2f4a;
        border-radius: 12px;
        box-shadow: 0 4px 24px rgba(30,30,60,0.18);
        padding: 2.5em 2em 2em 2em;
        color: #e0e3ef;
    }
    h2 {
        text-align: center;
        color: #fff;
        margin-bottom: 1.5em;
        letter-spacing: 1px;
        font-size: 2em;
        font-weight: 700;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin-top: 1em;
        margin-bottom: 0.2em;
        color: #e0e3ef;
        font-weight: 500;
    }
    input {
        width: 100%;
        padding: 0.5em;
        margin-bottom: 0.5em;
        border: 1px solid #44476a;
        border-radius: 4px;
        font-size: 1em;
        background: #23243a;
        color: #fff;
        transition: border 0.2s;
    }
    input:focus {
        border: 1.5px solid #6a82fb;
        outline: none;
    }
    button {
        margin-top: 1.5em;
        width: 100%;
        padding: 0.7em;
        background: linear-gradient(90deg, #28a745 60%, #43e97b 100%);
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1.1em;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
        box-shadow: 0 1px 4px rgba(0,0,0,0.08);
    }
    button:hover {
        background: linear-gradient(90deg, #218838 60%, #38d39f 100%);
    }
    .voltar {
        display: block;
        text-align: center;
        margin-top: 1.5em;
        color: #6a82fb;
        text-decoration: none;
        font-weight: 500;
    }
    .voltar:hover {
        color: #fff;
        text-decoration: underline;
    }
</style>

<div class="cadastro-container">
    <h2>Cadastro de Usuário</h2>
    <form action="/cadastro" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required>
        <label for="username">Usuário:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" required>
        <button type="submit">Cadastrar</button>
    </form>
    <a href="/" class="voltar">Voltar para o Login</a>
</div>
