from django.db import models


class Todo(models.Model):
    title = models.CharField(max_length=255, null=False, blank=False)
    description = models.CharField(max_length=255, blank=True, null=True)
    picture = models.CharField(max_length=255, blank=True, null=True)

    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)

    @property
    def tasks(self):
        return Task.objects.filter(todo_id=self.pk)[::-1]


class Task(models.Model):
    todo = models.ForeignKey(Todo, null=False)
    active = models.BooleanField(default=False)
    archived = models.BooleanField(default=False)
    text = models.CharField(max_length=255, null=False)

    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)