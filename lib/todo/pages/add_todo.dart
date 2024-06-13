// ignore_for_file: must_be_immutable

import 'package:bloc_state_management_projects/todo/cubit/todo_cubit.dart';
import 'package:bloc_state_management_projects/todo/data/todo_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new item',
          style: GoogleFonts.poppins(
            color: const Color(0xFF000000),
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'add an item',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TodoCubit>(context)
                      .addNewTodo(_controller.text.trim());
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF000000),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
