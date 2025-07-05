%# views/tarefa_form.tpl
<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #23243a 0%, #3a3d5c 100%);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 420px;
        margin: 3.5em auto;
        background: rgba(34, 36, 58, 0.97);
        border-radius: 18px;
        box-shadow: 0 8px 32px rgba(30,30,60,0.25);
        padding: 2.5em 2em 2em 2em;
        position: relative;
        overflow: hidden;
    }
    h2 {
        text-align: center;
        color: #fff;
        margin-bottom: 1.5em;
        letter-spacing: 1px;
        font-size: 1.7em;
        font-weight: 700;
        z-index: 1;
        position: relative;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 1.2em;
    }
    label {
        color: #e0e3ef;
        font-weight: 500;
        margin-bottom: 0.2em;
    }
    input {
        width: 100%;
        padding: 0.5em;
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
    button:hover {
        background: linear-gradient(90deg, #0056b3 60%, #4e54c8 100%);
    }
    .voltar {
        display: block;
        margin: 1.5em auto 0 auto;
        text-align: center;
        color: #6a82fb;
        text-decoration: none;
        font-weight: 500;
        font-size: 1em;
        transition: color 0.2s;
    }
    .voltar:hover {
        color: #fff;
        text-decoration: underline;
    }
</style>

<div class="container">
    <h2>Adicionar Tarefa</h2>
    <form action="" method="post">
        <label for="descricao">Descrição da Tarefa:</label>
        <input type="text" id="descricao" name="descricao" required>
        <button type="submit">Salvar</button>
    </form>
    <a href="/listas/{{id_lista}}/tarefas" class="voltar">&larr; Voltar para Tarefas</a>
</div>
