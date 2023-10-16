import 'package:flutter/material.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
import 'package:todo_app/view_model/utils/colors.dart';
import '../../../model/task_model.dart';
import '../../../view_model/bloc/todo_cubit/todo_cubit.dart';
import '../../screens/edit_task_screen.dart';

class TaskBuilder extends StatelessWidget {
  TaskModel taskModel;
  void Function()? onTap;

  TaskBuilder({required this.taskModel,this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = ToDoCubit.get(context);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap:onTap,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.orange.withOpacity(0.25),
            border: Border.all(
              color: Colors.orange,
              width: 3,
            ),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: taskModel.title,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.black,
              ),
              TextCustom(
                text: taskModel.describtion,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.timer_outlined,),
                  SizedBox(
                    width: 8,
                  ),
                  TextCustom(
                    text: taskModel.startDate,
                    color: AppColors.black,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.timer_off_outlined,),
                  SizedBox(
                    width: 8,
                  ),
                  TextCustom(
                    text: taskModel.endDate,
                    color: AppColors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
