from .base_controller import BaseController
from services.tarefa_service import TarefaService
from models.Tarefa import Tarefa
from bottle import request, redirect

class TarefaController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.setup_routes()
        self.tarefa_service = TarefaService()

    def setup_routes(self):
        self.app.route('/listas/<id_lista:int>/tarefas', method='GET', callback=self.listar_tarefas)
        self.app.route('/listas/<id_lista:int>/tarefas/nova', method=['GET', 'POST'], callback=self.nova_tarefa)
        self.app.route('/listas/<id_lista:int>/tarefas/check/<id_tarefa:int>', method='POST', callback=self.check_tarefa)

    def listar_tarefas(self, id_lista):
        tarefas = self.tarefa_service.get_by_lista(id_lista)
        return self.render('tarefas', tarefas=tarefas, id_lista=id_lista)

    def nova_tarefa(self, id_lista):
        if request.method == 'POST':
            descricao = request.forms.get('descricao')
            last_id = self.tarefa_service.get_next_id()
            tarefa = Tarefa(id=last_id, descricao=descricao, concluida=False, id_lista=id_lista)
            self.tarefa_service.add_tarefa(tarefa)
            redirect(f'/listas/{id_lista}/tarefas')
        return self.render('tarefa_form', id_lista=id_lista)

    def check_tarefa(self, id_lista, id_tarefa):
        tarefa = self.tarefa_service.get_by_id(id_tarefa)
        if tarefa:
            tarefa.concluida = not tarefa.concluida
            self.tarefa_service.update_tarefa(tarefa)
        redirect(f'/listas/{id_lista}/tarefas')
