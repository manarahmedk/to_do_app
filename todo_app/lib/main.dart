import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/screens/splash_screen.dart';
import 'package:todo_app/view_model/bloc/observer.dart';
import 'package:todo_app/view_model/bloc/todo_cubit/todo_cubit.dart';
import 'package:todo_app/view_model/data/local/shared_prefernce.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer=MyBlocObserver();
  LocalData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ToDoCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

