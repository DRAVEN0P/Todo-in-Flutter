from django.contrib import admin
from django.urls import path
from .views import TodoCreate, TodoStatus

urlpatterns = [
    path('',TodoCreate.as_view()),
    path('<int:pk>',TodoStatus.as_view()),
]
