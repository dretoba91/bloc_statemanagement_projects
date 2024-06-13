import 'package:bloc_state_management_projects/todo/cubit/todo_cubit.dart';
import 'package:bloc_state_management_projects/todo/pages/add_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo app with Cubit',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Todo items 📝',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF000000),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<TodoCubit, TodoState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is AddedTodoItem) {
                    final todos = state.todoLists;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.arrow_right_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              todos[index].itemName,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        });
                  }
                  return const SizedBox(
                    height: 600,
                    child: Center(
                      child: Text(
                        'Add new items',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodo()),
          );
        },
        backgroundColor: Colors.pink[200],
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
