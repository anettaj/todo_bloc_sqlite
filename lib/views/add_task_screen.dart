import 'package:flutter/material.dart';
import 'package:todo_bloc_sqlite/shared/componant.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController desController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  validator: (String? value){
                    if(value!.isEmpty)
                      {
                        return 'Please add your title';
                      }
                  },
                  label: 'title',
                  hintText: "Add your Title",
                  prefixIcon: Icons.title
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: timeController,
                  keyboardType: TextInputType.datetime,
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Please add your Time';
                    }
                  },
                  label: 'time',
                  hintText: "Add Time",
                  prefixIcon: Icons.watch_later_outlined,
                onTap: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.now())
                        .then((value){
                          timeController.text=value!.format(context);
                    })
                        .catchError((error){
                          timeController.clear();
                    });
                }
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Please add your Date';
                    }
                  },
                  label: 'Date',
                  hintText: "Add your Date",
                  prefixIcon: Icons.calendar_today_sharp,
                onTap: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2040-12-30')
                    )
                        .then((value) {
                      dateController.text= DateFormat.yMd().format(value!);
                    })
                        .catchError((error){
                          dateController.clear();
                    });
                }
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  controller: desController,
                  keyboardType: TextInputType.text,
                  maxlines: 5,
                  validator: (String? value){
                    if(value!.isEmpty)
                    {
                      return 'Please add your Description';
                    }
                  },
                  label: 'Description',
                  hintText: "Add your Discription",
                  prefixIcon: Icons.note
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(onPressed: (){},
                minWidth: double.infinity,
                color: Colors.deepOrange,
              child: Text("Add Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
