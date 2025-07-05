from models.Tarefa import Tarefa
import json
import os

DATA_PATH = os.path.join(os.path.dirname(__file__), '..', 'data', 'Tarefas.json')

class TarefaService:
    def get_all(self):
        with open(DATA_PATH, 'r', encoding='utf-8') as f:
            data = json.load(f)
        return [Tarefa.from_dict(item) for item in data]

    def save_all(self, tarefas):
        with open(DATA_PATH, 'w', encoding='utf-8') as f:
            json.dump([tarefa.to_dict() for tarefa in tarefas], f, ensure_ascii=False, indent=4)

    def add_tarefa(self, tarefa):
        tarefas = self.get_all()
        tarefas.append(tarefa)
        self.save_all(tarefas)

    def get_by_id(self, tarefa_id):
        tarefas = self.get_all()
        for tarefa in tarefas:
            if tarefa.id == tarefa_id:
                return tarefa
        return None

    def update_tarefa(self, tarefa):
        tarefas = self.get_all()
        for idx, t in enumerate(tarefas):
            if t.id == tarefa.id:
                tarefas[idx] = tarefa
                break
        self.save_all(tarefas)

    def delete_tarefa(self, tarefa_id):
        tarefas = self.get_all()
        tarefas = [t for t in tarefas if t.id != tarefa_id]
        self.save_all(tarefas)