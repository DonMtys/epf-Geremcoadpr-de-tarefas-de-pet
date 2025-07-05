import json
import os
from models.Lista import Lista

DATA_PATH = os.path.join(os.path.dirname(__file__), '..', 'data', 'Lista.json')

class ListaService:
    def get_all(self):
        with open(DATA_PATH, 'r', encoding='utf-8') as f:
            data = json.load(f)
        return [Lista.from_dict(item) for item in data]

    def save_all(self, listas):
        with open(DATA_PATH, 'w', encoding='utf-8') as f:
            json.dump([lista.to_dict() for lista in listas], f, ensure_ascii=False, indent=4)

    def add_lista(self, lista):
        listas = self.get_all()
        listas.append(lista)
        self.save_all(listas)

    def get_by_id(self, lista_id):
        listas = self.get_all()
        for lista in listas:
            if lista.id == lista_id:
                return lista
        return None

    def update_lista(self, lista):
        listas = self.get_all()
        for idx, l in enumerate(listas):
            if l.id == lista.id:
                listas[idx] = lista
                break
        self.save_all(listas)

    def delete_lista(self, lista_id):
        listas = self.get_all()
        listas = [l for l in listas if l.id != lista_id]
        self.save_all(listas)
    