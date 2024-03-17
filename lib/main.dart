import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_sqlite/controller/cubit/cubit.dart';
import 'package:todo_bloc_sqlite/controller/cubit/states.dart';
import 'package:todo_bloc_sqlite/shared/Styles/themes.dart';
import 'package:todo_bloc_sqlite/views/Test_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> TodoCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomeScreeen()
      ),
    );
  }
}
