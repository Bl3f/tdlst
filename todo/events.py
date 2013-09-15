from django_socketio import events
from todo.models import Todo, Task

@events.on_message(channel="^todo-")
def add_task_handler(request, socket, context, message):
    """
    Handler for add task on a todo
    """
    if message.get("action") == "add_task":
        todo = Todo.objects.get(pk=message.get("todo"))

        task = Task()
        task.todo = todo
        task.active = True
        task.text = message.get("task")
        task.save()

        joined = {
            "action": "new_task",
            "task": task.text,
            "task_id": task.pk,
            "active": task.active,
            "archived": task.archived,
            "todo_id": todo.pk,
        }
        socket.send_and_broadcast_channel(joined)

