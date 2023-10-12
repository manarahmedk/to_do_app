import 'package:flutter/material.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
import 'package:todo_app/view/screens/todo_screen.dart';
import 'package:todo_app/view_model/utils/colors.dart';

import '../../model/task_model.dart';
import '../../view_model/bloc/todo_cubit/todo_cubit.dart';
import '../components/widgets/my_text_form_field.dart';

class EditTaskScreen extends StatelessWidget {

  TaskModel taskModel;
  int index;

  EditTaskScreen({required this.taskModel,required this.index});

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    cubit.editTitleController.text=taskModel.title;
    cubit.editDetailsController.text=taskModel.describtion;
    cubit.editStartDateController.text=taskModel.startDate;
    cubit.editEndDateController.text=taskModel.endDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: TextCustom(text: ' Edit Task ',),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: cubit.editFormKey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: 'Title',
                    keyboardType: TextInputType.text,
                    controller: cubit.editTitleController,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.title_outlined,
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please, Enter your Task Title';
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
                    controller: cubit.editDetailsController,
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
                    controller: cubit.editStartDateController,
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
                        cubit.editStartDateController.text =
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
                    controller: cubit.editEndDateController,
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
                        cubit.editEndDateController.text =
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
                  if (cubit.editFormKey.currentState!.validate()) {
                    taskModel.title=cubit.editTitleController.text;
                    taskModel.describtion=cubit.editDetailsController.text;
                    taskModel.startDate=cubit.editStartDateController.text;
                    taskModel.endDate=cubit.editEndDateController.text;
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
                  text: 'Edit Task',
                  fontSize: 15,
                  color: AppColors.white,
                ),
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
                    cubit.deleteTask(index: index);
                    cubit.clearAllData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToDoScreen(),
                      ),
                    );
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.orange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: TextCustom(
                  text: 'Delete Task',
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
