import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view_model/bloc/todo_cubit/todo_states.dart';
import '../../../model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<ToDoStates>{

  ToDoCubit() : super(ToDoInitialState());

  int currentIndex=0;

  static ToDoCubit get(context)=>BlocProvider.of<ToDoCubit>(context);

  var titleController=TextEditingController();
  var detailsController=TextEditingController();
  var startDateController=TextEditingController();
  var endDateController=TextEditingController();

  var editTitleController=TextEditingController();
  var editDetailsController=TextEditingController();
  var editStartDateController=TextEditingController();
  var editEndDateController=TextEditingController();

  var formKey=GlobalKey<FormState>();
  var editFormKey=GlobalKey<FormState>();

  List<TaskModel> tasks=[];

  void addTask(){
    TaskModel task=TaskModel(
      title: titleController.text,
      describtion: detailsController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
    );
    tasks.add(task);
    clearAllData();
    emit(AddTaskState());
  }

  void editTask(){
    tasks[currentIndex].title=editTitleController.text;
    tasks[currentIndex].describtion=editDetailsController.text;
    tasks[currentIndex].startDate=editStartDateController.text;
    tasks[currentIndex].endDate=editEndDateController.text;
    emit(EditTaskState());
  }
  void deleteTask(){
    tasks.removeAt(currentIndex);
    emit(DeleteTaskState());
  }
  void clearAllData(){
    titleController.clear();
    detailsController.clear();
    startDateController.clear();
    endDateController.clear();
    emit(ClearAllDataState());
  }

}