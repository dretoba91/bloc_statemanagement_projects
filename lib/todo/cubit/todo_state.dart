// ignore_for_file: prefer_const_constructors_in_immutables

part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoChangeState extends TodoState {}

class AddedTodoItem extends TodoState {
  AddedTodoItem({required this.todoLists});

  final List<TodoModels> todoLists;

  @override
  List<Object> get props => [todoLists];
}
