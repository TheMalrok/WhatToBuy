import 'package:flutter/material.dart';


Future showInformationDialog(BuildContext context) async {

  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      final TextEditingController _textEditingController = TextEditingController();

      return AlertDialog(
        content: Form(
          child: TextFormField(
            controller: _textEditingController,
            autofocus: true,
            textAlign: TextAlign.center,
            //validator: (value){return value.isNotEmpty ? null : 'Invalid Filed';},
            decoration: const InputDecoration(hintText: 'What should i add:'),
          )
        ),
        actions: <Widget> [
          TextButton(
              child: Text('Add to list'),
              onPressed:() {
                if (_textEditingController.text!=null)
                {Navigator.pop(context, _textEditingController.text);}
                }
          )
        ],
      );
    }
  );
}