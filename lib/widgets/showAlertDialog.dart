import 'package:flutter/material.dart';

Future showAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      final bool shouldRemove = false;
      return   AlertDialog(
        title: Text("Remove?"),
        content: Text("Are You sure you want to remove all items from the list?"),
        actions: [
        TextButton(
          child: Text("Cancel"),
            onPressed:  () {
              Navigator.pop(context); //just close this alert dialog
               },
      ),
       TextButton(
          child: Text("Remove All"),
            onPressed:  () {
              Navigator.of(context).pop(shouldRemove);// pass 'true' result to global bool shouldRemove
            },
          )
        ],
      );
    }
  );
}

