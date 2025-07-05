from controllers.lista_controller import ListaController
from controllers.user_controller import UserController

def init_controllers(app):
    ListaController(app)
    UserController(app)