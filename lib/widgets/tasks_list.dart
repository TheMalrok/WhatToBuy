import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'tasks.dart';

class TasksList extends StatefulWidget {
  final List <Task> tasks;
  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked:widget.tasks[index].isDone,
          chceckboxCallback: (bool checkboxState){
            setState((){
              widget.tasks[index].toggleDone();
            }
            );
          }
      );
    },
      itemCount: widget.tasks.length,
    );
  }
}
