import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
 final bool isChecked ;
 final String taskTitle;
 final Function chceckboxCallback;


  TaskTile({this.isChecked,this.taskTitle,this.chceckboxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null //checking for checkbox state and drawning line through text
        ),
      ),
      trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.lightBlue,
          onChanged: chceckboxCallback,
      )

    );
  }
}
