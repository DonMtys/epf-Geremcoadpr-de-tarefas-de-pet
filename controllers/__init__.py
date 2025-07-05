from controllers.lista_controller import ListaController
from controllers.user_controller import UserController
from controllers.tarefa_controller import TarefaController

def init_controllers(app):
    ListaController(app)
    UserController(app)
    TarefaController(app)