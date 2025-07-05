%# views/tarefas.tpl
<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #23243a 0%, #3a3d5c 100%);
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }
    .container {
        max-width: 600px;
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
    .nova-tarefa-btn {
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
    .nova-tarefa-btn:hover {
        background: linear-gradient(90deg, #218838 60%, #38d39f 100%);
    }
    .check-btn {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 1.3em;
        color: #43e97b;
        margin-right: 0.5em;
        vertical-align: middle;
        transition: color 0.2s;
    }
    .check-btn.checked {
        color: #007bff;
        text-decoration: line-through;
    }
    .finalizado-msg {
        position: absolute;
        top: 18px;
        left: 30px;
        background: #28a745;
        color: #fff;
        padding: 10px 22px 10px 18px;
        border-radius: 6px;
        font-weight: 600;
        box-shadow: 0 2px 8px rgba(0,0,0,0.13);
        font-size: 1.1em;
        z-index: 10;
    }
</style>

<div class="container">
    % if tarefas and all([t.concluida for t in tarefas]):
        <div class="finalizado-msg">Todas as tarefas desta lista foram concluídas! 🎉</div>
    % end
    <h2>Tarefas da Lista</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Concluir</th>
            </tr>
        </thead>
        <tbody>
        % for tarefa in tarefas:
            <tr>
                <td>{{tarefa.id}}</td>
                <td style="text-align:left;">
                    % if tarefa.concluida:
                        <span style="text-decoration:line-through;color:#aaa;">{{tarefa.descricao}}</span>
                    % else:
                        {{tarefa.descricao}}
                    % end
                </td>
                <td>
                    <form action="/listas/{{id_lista}}/tarefas/check/{{tarefa.id}}" method="post" style="display:inline;">
                        <button type="submit" class="check-btn{{' checked' if tarefa.concluida else ''}}" title="Marcar como concluída">
                            % if tarefa.concluida:
                                &#10003;
                            % else:
                                &#9633;
                            % end
                        </button>
                    </form>
                </td>
            </tr>
        % end
        </tbody>
    </table>
    <a href="/listas/{{id_lista}}/tarefas/nova" class="nova-tarefa-btn">Adicionar Tarefa</a>
    <a href="/listas" class="nova-tarefa-btn" style="background:linear-gradient(90deg,#6a82fb 60%,#007bff 100%);margin-top:1em;">Voltar para Listas</a>
</div>
