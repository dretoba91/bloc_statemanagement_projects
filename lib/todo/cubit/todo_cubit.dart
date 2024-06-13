import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_management_projects/todo/data/todo_lists.dart';
import 'package:bloc_state_management_projects/todo/model/todo_models.dart';
import 'package:equatable/equatable.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  void addNewTodo(String name) {
    todoLists.add(TodoModels(itemName: name, createdAt: DateTime.now()));

    // calling the TodoChange state, so that by the time the todoLists array is passed to the changeTodoList method, the array location reference would have change the AddedTodoItem state will notice a chanhe in the state.
    emit(TodoChangeState());
    changeTodoList(todoLists);
  }

  void changeTodoList(List<TodoModels> lists) {
    emit(AddedTodoItem(todoLists: lists));
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    // log("what changes: ${change.currentState}");
  }
}
