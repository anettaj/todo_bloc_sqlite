import 'package:flutter/material.dart';
import 'package:todo_bloc_sqlite/shared/componant.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
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
          )
        ],
      ),
    );
  }
}
