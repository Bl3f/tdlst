from django.shortcuts import render, redirect
from todo.models import Todo, Task


def home(request):
    template_name = "todo/home.html"

    if request.method == 'POST':
        task = Task()
        task.active = True
        task.text = request.POST.get('task')
        task.todo = Todo.objects.get(pk=request.POST.get('todo_id'))
        task.save()

    todo = Todo.objects.all()[0]

    return render(request, template_name, {'todo': todo})


def delete(request, task_id):
    task = Task.objects.get(pk=task_id)
    task.delete()

    return redirect(home)


def toggle(request, task_id):
    task = Task.objects.get(pk=task_id)
    task.active = not task.active
    task.save()

    return redirect(home)