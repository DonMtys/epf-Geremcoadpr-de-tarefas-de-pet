class BaseModel:
    def __init__(self, id):
        self.id = id 

    def to_dict(self):
        return {'id': self.id}

    @classmethod
    def from_dict(cls, data):
        return cls(data['id'])

    def exibir_detalhes(self):
        return f"ID: {self.id}"