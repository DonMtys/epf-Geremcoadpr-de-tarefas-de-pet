%# views/listas.tpl
<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #23243a 0%, #3a3d5c 100%);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 900px;
        margin: 2.5em auto;
        background: rgba(34, 36, 58, 0.97);
        border-radius: 18px;
        box-shadow: 0 8px 32px rgba(30,30,60,0.25);
        padding: 2.5em 2em 2em 2em;
        position: relative;
        overflow: hidden;
    }
    .container::before {
        content: '';
        position: absolute;
        top: -60px; left: -60px;
        width: 180px; height: 180px;
        background: radial-gradient(circle, #3a3d5c 0%, #23243a 80%);
        opacity: 0.18;
        border-radius: 50%;
        z-index: 0;
    }
    h2 {
        text-align: center;
        color: #fff;
        margin-bottom: 1.5em;
        letter-spacing: 1px;
        font-size: 2.1em;
        font-weight: 700;
        z-index: 1;
        position: relative;
    }
    .centered-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin: 0 auto 2em auto;
        padding: 2em 2em 1em 2em;
        background: #2d2f4a;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.13);
        max-width: 350px;
        z-index: 1;
        position: relative;
    }
    .centered-form label {
        margin-top: 1em;
        margin-bottom: 0.2em;
        align-self: flex-start;
        color: #e0e3ef;
        font-weight: 500;
    }
    .centered-form input {
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
    .centered-form input:focus {
        border: 1.5px solid #6a82fb;
        outline: none;
    }
    .centered-form button {
        margin-top: 1em;
        width: 100%;
        padding: 0.7em;
        background: linear-gradient(90deg, #007bff 60%, #6a82fb 100%);
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1em;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
        box-shadow: 0 1px 4px rgba(0,0,0,0.08);
    }
    .centered-form button:hover {
        background: linear-gradient(90deg, #0056b3 60%, #4e54c8 100%);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 2em 0 1em 0;
        background: #23243a;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.13);
        z-index: 1;
        position: relative;
    }
    th, td {
        padding: 1em 0.7em;
        text-align: center;
    }
    th {
        background: linear-gradient(90deg, #007bff 60%, #6a82fb 100%);
        color: #fff;
        font-weight: 600;
        letter-spacing: 0.5px;
        border-bottom: 2px solid #44476a;
    }
    td {
        color: #e0e3ef;
    }
    tr:nth-child(even) {
        background: #2d2f4a;
    }
    tr:hover {
        background: #35375a;
    }
    a.action-link {
        color: #6a82fb;
        text-decoration: none;
        margin: 0 0.5em;
        font-weight: 500;
        transition: color 0.2s;
    }
    a.action-link:hover {
        color: #fff;
        text-decoration: underline;
    }
    .new-lista-btn {
        display: block;
        width: 220px;
        margin: 2em auto 0 auto;
        padding: 0.9em;
        background: linear-gradient(90deg, #28a745 60%, #43e97b 100%);
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1.1em;
        font-weight: 600;
        text-align: center;
        text-decoration: none;
        box-shadow: 0 1px 4px rgba(0,0,0,0.08);
        transition: background 0.2s;
        cursor: pointer;
    }
    .new-lista-btn:hover {
        background: linear-gradient(90deg, #218838 60%, #38d39f 100%);
    }
</style>

<div class="container">
    <h2>Listas de Tarefas</h2>

    % from bottle import request
    % import urllib.parse

    <div style="position:absolute;top:30px;left:40px;z-index:10;">
    % if request.query.logout == '1':
        <div style="background:#23243a;color:#fff;padding:10px 22px 10px 18px;border-radius:6px;font-weight:600;box-shadow:0 2px 8px rgba(0,0,0,0.13);font-size:1.1em;">Você saiu da conta.</div>
    % end
    </div>

    % if not request.get_cookie('usuario_logado'):
        <!-- Formulário de Login Centralizado -->
        <form action="/login" method="post" class="centered-form">
            % if erro_login:
                <div style="color:#ff6b6b; margin-bottom:1em; text-align:center; font-weight:600;">Usuário ou senha inválidos!</div>
            % end
            <label for="username">Usuário:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Entrar</button>
            <a href="/cadastro" class="new-lista-btn" style="margin-top:1em;background:linear-gradient(90deg,#6a82fb 60%,#007bff 100%);">Cadastrar</a>
        </form>
    % end

    % if request.get_cookie('usuario_logado'):
        <a href="/logout" style="position:absolute;top:30px;left:40px;z-index:10;background:#ff6b6b;color:#fff;padding:8px 18px 8px 18px;border-radius:6px;font-weight:600;text-decoration:none;box-shadow:0 2px 8px rgba(0,0,0,0.13);font-size:1em;">Sair</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>ID do Usuário</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
            % for lista in listas:
                <tr>
                    <td>{{lista.id}}</td>
                    <td>{{lista.nome}}</td>
                    <td>{{lista.id_usuario}}</td>
                    <td>
                        <a href="/listas/editar/{{lista.id}}" class="action-link">Editar</a>
                        <a href="/listas/remover/{{lista.id}}" class="action-link" onclick="return confirm('Tem certeza?')">Remover</a>
                    </td>
                </tr>
            % end
            </tbody>
        </table>
        <a href="/listas/nova" class="new-lista-btn">Nova Lista</a>
    % end
</div>
