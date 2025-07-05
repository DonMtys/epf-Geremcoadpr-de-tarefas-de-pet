from .Basemodel import BaseModel 

class Lista(BaseModel):
    def __init__(self, id, nome, id_usuario):
        super().__init__(id)     
        self.nome = nome          
        self.id_usuario = id_usuario  

    def to_dict(self):
        return {
            'id': self.id,
            'nome': self.nome,
            'id_usuario': self.id_usuario
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            data['id'],
            data['nome'],
            data['id_usuario']
        )

    def exibir_detalhes(self):
        return f"Lista: {self.nome} | ID: {self.id} | Usuário: {self.id_usuario}"