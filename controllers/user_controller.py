from bottle import Bottle, request
from .base_controller import BaseController
from services.user_service import UserService

class UserController(BaseController):
    def __init__(self, app):
        super().__init__(app)

        self.setup_routes()
        self.user_service = UserService()


    # Rotas User
    def setup_routes(self):
        self.app.route('/users', method='GET', callback=self.list_users)
        self.app.route('/users/add', method=['GET', 'POST'], callback=self.add_user)
        self.app.route('/users/edit/<user_id:int>', method=['GET', 'POST'], callback=self.edit_user)
        self.app.route('/users/delete/<user_id:int>', method='POST', callback=self.delete_user)
        self.app.route('/cadastro', method=['GET', 'POST'], callback=self.cadastro_publico)
        # Rota de login
        self.app.route('/login', method=['POST'], callback=self.login)
        # Rota de logout
        self.app.route('/logout', method=['GET'], callback=self.logout)


    def list_users(self):
        users = self.user_service.get_all()
        return self.render('users', users=users)


    def add_user(self):
        if request.method == 'GET':
            return self.render('user_form', user=None, action="/users/add")
        else:
            # POST - salvar usuário
            self.user_service.save()
            self.redirect('/users')


    def edit_user(self, user_id):
        user = self.user_service.get_by_id(user_id)
        if not user:
            return "Usuário não encontrado"

        if request.method == 'GET':
            return self.render('user_form', user=user, action=f"/users/edit/{user_id}")
        else:
            # POST - salvar edição
            self.user_service.edit_user(user)
            self.redirect('/users')


    def delete_user(self, user_id):
        self.user_service.delete_user(user_id)
        self.redirect('/users')


    def cadastro_publico(self):
        if request.method == 'GET':
            return self.render('cadastro')
        else:
            nome = request.forms.get('nome')
            email = request.forms.get('email')
            username = request.forms.get('username')
            password = request.forms.get('password')
            users = self.user_service.get_all()
            last_id = max([u.id for u in users], default=0)
            new_id = last_id + 1
            from models.user import User
            user = User(id=new_id, name=nome, email=email, birthdate="-", username=username, password=password)
            self.user_service.user_model.add_user(user)
            return self.redirect('/')

    def login(self):
        username = request.forms.get('username')
        password = request.forms.get('password')
        users = self.user_service.get_all()
        user = next((u for u in users if getattr(u, 'username', None) == username and getattr(u, 'password', None) == password), None)
        if user:
            from bottle import response
            response.set_cookie('usuario_logado', str(user.id), path='/')
            self.redirect('/')
        else:
            return self.render('listas', erro_login=True)

    def logout(self):
        from bottle import response, redirect
        response.delete_cookie('usuario_logado', path='/')
        redirect('/?logout=1')


user_routes = Bottle()
user_controller = UserController(user_routes)
