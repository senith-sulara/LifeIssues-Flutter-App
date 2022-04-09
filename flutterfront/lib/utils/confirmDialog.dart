import 'package:flutter/material.dart';

class ConfirmDialog {
  static show(BuildContext context, String message, Function function) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            backgroundColor: const Color.fromARGB(255, 216, 193, 252),
            title: const Center(
                child: Text(
              'Attention!',
              style: TextStyle(
                color: Colors.red,
              ),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.black45,
                        ),
                        label: const Text('Yes'),
                        onPressed: () {
                          function();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.black45,
                        ),
                        label: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ])
              ],
            ),
          );
        });
  }
}
