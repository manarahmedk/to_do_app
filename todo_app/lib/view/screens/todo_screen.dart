import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
import 'package:todo_app/view/screens/edit_task_screen.dart';
import 'package:todo_app/view_model/bloc/todo_cubit/todo_states.dart';
import 'package:todo_app/view_model/utils/colors.dart';
import 'package:todo_app/view_model/utils/lottie.dart';
import '../../view_model/bloc/todo_cubit/todo_cubit.dart';
import '../components/builders/task_builder.dart';
import 'add_task_screen.dart';

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: TextCustom(
          text: 'To Do App',
        ),
      ),
      body: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Visibility(
            visible: cubit.tasks.isNotEmpty,
            child: ListView.separated(
              itemBuilder: (context, index) => TaskBuilder(
                taskModel: cubit.tasks[index],
                onTap: () {
                  cubit.currentIndex = index;
                  cubit.setData(index);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskScreen(
                        taskModel: cubit.tasks[index],
                      ),
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemCount: cubit.tasks.length,
            ),
            replacement: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(AppLotties.empty),
                  const TextCustom(
                    text: 'No Tasks Added !',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: AppColors.orange,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        backgroundColor: AppColors.orange,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
