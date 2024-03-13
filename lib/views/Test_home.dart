import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_sqlite/controller/cubit/cubit.dart';
import 'package:todo_bloc_sqlite/controller/cubit/states.dart';

class HomeScreeen extends StatefulWidget {
  const HomeScreeen({super.key});

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var cubit=TodoCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  IconButton(
                      onPressed: (){
                        cubit.createDatabase();
                      },
                      icon: Icon(
                        Icons.add,
                      )
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
