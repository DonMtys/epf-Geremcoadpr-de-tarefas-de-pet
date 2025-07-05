from .Basemodel import BaseModel  

class Usuario(BaseModel):
    def __init__(self, id, nome, email, senha):
        super().__init__(id)
        self.nome = nome
        self.email = email
        self.senha = senha

    def to_dict(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'email': self.email,
            'senha': self.senha
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            data['id'],
            data['nome'],
            data['email'],
            data['senha']
        )

    def exibir_detalhes(self):
        return f"Usuário: {self.nome} | Email: {self.email} | ID: {self.id}"