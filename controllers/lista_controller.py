from .base_controller import BaseController
from services.lista_service import ListaService
from models.Lista import Lista
from bottle import request, redirect

class ListaController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.setup_routes()
        self.lista_service = ListaService()

    def setup_routes(self):
        self.app.route('/listas', method='GET', callback=self.listar_listas)
        self.app.route('/listas/nova', method=['GET', 'POST'], callback=self.nova_lista)
        self.app.route('/listas/editar/<id:int>', method=['GET', 'POST'], callback=self.editar_lista)
        self.app.route('/listas/remover/<id:int>', method='GET', callback=self.remover_lista)

    def listar_listas(self):
        listas = self.lista_service.get_all()
        return self.render('listas', listas=listas, erro_login=False)

    def nova_lista(self):
        if request.method == 'POST':
            nome = request.forms.get('nome')
            id_usuario = request.get_cookie('usuario_logado')
            last_id = max([l.id for l in self.lista_service.get_all()], default=0)
            nova = Lista(id=last_id+1, nome=nome, id_usuario=id_usuario)
            self.lista_service.add_lista(nova)
            redirect('/listas')
        return self.render('lista_form', lista=None)

    def editar_lista(self, id):
        lista = self.lista_service.get_by_id(id)
        if not lista:
            redirect('/listas')
        if request.method == 'POST':
            lista.nome = request.forms.get('nome')
            lista.id_usuario = request.forms.get('id_usuario')
            self.lista_service.update_lista(lista)
            redirect('/listas')
        return self.render('lista_form', lista=lista)

    def remover_lista(self, id):    
        self.lista_service.delete_lista(id)
        redirect('/listas')
