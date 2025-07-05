%# views/lista_form.tpl
<form action="{{!request.path}}" method="post">
    <label for="nome">Nome da Lista:</label>
    <input type="text" id="nome" name="nome" value="{{getattr(lista, 'nome', '')}}" required>

    <label for="id_usuario">Usuário:</label>
    <select id="id_usuario" name="id_usuario" required>
        % for usuario in usuarios:
            <option value="{{usuario.id}}" {{'selected' if getattr(lista, 'id_usuario', '') == str(usuario.id) else ''}}>{{usuario.id}} - {{usuario.name}}</option>
        % end
    </select>

    <button type="submit">Salvar</button>
</form>
