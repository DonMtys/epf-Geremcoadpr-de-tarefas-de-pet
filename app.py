from bottle import Bottle, redirect
from config import Config

class App:
    def __init__(self):
        self.bottle = Bottle()
        self.config = Config()


    def setup_routes(self):
        from controllers import init_controllers

        print('🚀 Inicializa rotas!')
        init_controllers(self.bottle)
        
        # Redireciona '/' para '/listas'
        @self.bottle.route('/')
        def index():
            redirect('/listas')


    def run(self):
        self.setup_routes()
        self.bottle.run(
            host=self.config.HOST,
            port=self.config.PORT,
            debug=self.config.DEBUG,
            reloader=self.config.RELOADER
        )


def create_app():
    return App()
