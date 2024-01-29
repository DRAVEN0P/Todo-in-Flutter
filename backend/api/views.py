from api.models import Todo
from api.serializers import TodoSerializer as tds
from rest_framework import generics

class TodoCreate(generics.ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = tds

class TodoStatus(generics.RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = tds