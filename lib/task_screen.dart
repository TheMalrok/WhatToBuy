import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/tasks_list.dart';
import 'widgets/tasks.dart';
import 'widgets/dialogForm.dart';
import 'widgets/showAlertDialog.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List <Task> tasks = [
    Task(name: 'milk'),
    Task(name: 'sugar'),
    Task(name: 'chips'),
    Task(name: 'oil'),
    Task(name: 'water'),
    Task(name: 'chocolate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String result = await showInformationDialog(context);
          if (result.isNotEmpty){
            setState(() {
              tasks.add(Task(name: result));
            });
          }
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.00, right: 30.00, bottom: 30.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar( // list icon in white circle on the TOP
                      backgroundColor: Colors.white,
                      radius: 30.00,
                      child: Icon(Icons.shopping_cart,
                      color: Colors.lightBlue,
                      size: 30.00,
                      )
                    ),
                    SizedBox(width:18.00),
                    Text('WhatToBuy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.00,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('${tasks.length} items to buy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(width: 18.00),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(9.0))
                      ),
                      height: 30.0,
                      child: TextButton(
                        onPressed: () async {
                         final bool shouldRemove = await showAlertDialog(context);
                          if (shouldRemove==false){
                            setState(() {
                              tasks.removeRange(0, tasks.length);
                            });
                          }
                          },
                        child: Text('Remove All',
                          style: TextStyle(
                            color: Colors.lightBlue
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.00),
                    topRight: Radius.circular(20.00)),
              ),
                child: TasksList(tasks),
            ),
          )
        ],
      ),
    );
  }
}

