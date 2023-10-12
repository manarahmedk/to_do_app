import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
import 'package:todo_app/view/screens/todo_screen.dart';
import 'package:todo_app/view_model/utils/colors.dart';
import '../../view_model/bloc/todo_cubit/todo_cubit.dart';
import '../components/widgets/my_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: TextCustom(
          text: ' Add Task ',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: 'Title',
                    keyboardType: TextInputType.text,
                    controller: cubit.titleController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.title_outlined,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please, Enter your Task title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: 'Description',
                    keyboardType: TextInputType.text,
                    controller: cubit.detailsController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.description_outlined,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please, Enter your Task Description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: 'Start Date',
                    keyboardType: TextInputType.none,
                    controller: cubit.startDateController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.timer_outlined,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please, Enter your Task Start Date';
                      }
                      return null;
                    },
                    onTap: () async {
                      final value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));
                      if (value != null) {
                        cubit.startDateController.text =
                            "${value.year}-${value.month}-${value.day}";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    hintText: 'End Date',
                    keyboardType: TextInputType.none,
                    controller: cubit.endDateController,
                    prefixIcon: Icons.timer_off_outlined,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please, Enter your Task End Time';
                      }
                      return null;
                    },
                    onTap: () async {
                      final value = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));
                      if (value != null) {
                        cubit.endDateController.text =
                            "${value.year}-${value.month}-${value.day}";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.addTask(
                      task: TaskModel(
                        title: cubit.titleController.text,
                        describtion: cubit.detailsController.text,
                        startDate: cubit.startDateController.text,
                        endDate: cubit.endDateController.text,
                      ),
                    );
                    cubit.clearAllData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToDoScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.orange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: TextCustom(
                  text: 'Add Task',
                  fontSize: 15,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
