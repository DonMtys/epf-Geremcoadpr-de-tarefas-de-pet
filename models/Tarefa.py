from .Basemodel import BaseModel  

class Tarefa(BaseModel):  
    def __init__(self, id, descricao, concluida, id_lista):
        super().__init__(id)      
        self.descricao = descricao    
        self.concluida = concluida   
        self.id_lista = id_lista      

    def to_dict(self):
        return {
            'id': self.id,
            'descricao': self.descricao,
            'concluida': self.concluida,
            'id_lista': self.id_lista
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            data['id'],
            data['descricao'],
            data['concluida'],
            data['id_lista']
        )

    def exibir_detalhes(self):
        status = "Concluída" if self.concluida else "Pendente"
        return f"Tarefa: {self.descricao} | Status: {status} | ID: {self.id} | Lista: {self.id_lista}"