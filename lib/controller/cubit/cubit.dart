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
      emit(SuccessCreateTodoDatabaseState());
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
            emit(SuccessInsertingIntoTodoDatabaseState());
      })
          .catchError((error){
        print('error in inserting into the database');
      });
    });
    }
  List tasks=[];
    void gettingDataFromDatabase(){
      database!.rawQuery('SELECT * FROM tasks').then((value) {
        value.forEach((element){
          tasks.add(element);
        });
        print('data is appearing');
        print(value);
        emit(SuccessGettingDataFromDatabaseState());
      }).catchError((error){
        print('Error when getting the data ${error.toString()}');
      });
    }
    void updateDataIntoDatabase(
        {
          required String title,
          required String date,
          required String time,
          required String description,
          required int id
    })
    {
      database!.update('tasks', {
        "title":title,
        "date":date,
        "time":time,
        "description":description
      },
        where: 'id=?',
        whereArgs:[id]).then((value){
          print('$value updating data has successfully done');
          getDatabasesPath();
      }).catchError((error){
        print('error when updating data');
      });
    }

    void deleteDataFromDatabase({required int id}){
      database!.rawDelete('DELETE FROM tasks WHERE id=?',[id])
          .then((value){
        print('$value deleting data has successfully done');
        gettingDataFromDatabase();
      }).catchError((error){
        print('error when deleting data');
      });
    }
}