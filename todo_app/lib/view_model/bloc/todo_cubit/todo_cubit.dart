import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view_model/bloc/todo_cubit/todo_states.dart';
import '../../../model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<ToDoStates>{

  ToDoCubit() : super(ToDoInitialState());

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

  void addTask({
    required TaskModel task}){
    tasks.add(task);

    emit(AddTaskState());
  }

  void clearAllData(){
    titleController.text='';
    detailsController.text='';
    startDateController.text='';
    endDateController.text='';
    emit(ClearAllDataState());
  }
  void editTask({
    required int index}){
    tasks.removeAt(index);
    emit(DeleteTaskState());
  }

  void deleteTask({
    required int index}){
    tasks.removeAt(index);
    emit(DeleteTaskState());
  }

}