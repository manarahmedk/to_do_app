import 'package:flutter/material.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
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
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                        readOnly: true,
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
                        readOnly: true,
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
              ),
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.addTask();
                      Navigator.pop(context);
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
      ),
    );
  }
}
