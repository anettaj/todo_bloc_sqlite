import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_bloc_sqlite/controller/cubit/states.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit():super(InitialTodoStates());

  static TodoCubit get(context) => BlocProvider.of(context);
  Database? database;

  void createDatabase() {
    openDatabase('taskstodo.db',
      version: 1,
      onCreate: (database, version) {
        print('The database is created');
        database.execute(
            'CREATE TABLE tasks'
                '(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,description TEXT,status TEXT)')
            .then((value) {
          print('table is created');
        })
            .catchError((error) {
          print('error in creating a table');
        });
      },
      onOpen: (database) {
        print('database file is opened');
      },
      
    ).then((value) {
      database=value;
      emit(CreateTodoDatabaseState());
    }).catchError((error){
      print('error in opening the file');

    });
  }

  void insertToDatabase({
      required title,
      required date,
      required time,
      required description,
    String status='new'
    })
    {
      database?.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks'
          '(title,date,time,description,status) VALUES'
          '("$title","$date","$time","$description","$status")')
          .then((value) {
            print('$value');
            emit(InsertingIntoTodoDatabaseState());
      })
          .catchError((error){
        print('error in inserting into the database');
      });
    });
    }


}