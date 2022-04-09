import 'package:flutter/material.dart';
import 'package:flutterfront/models/financialIssue.model.dart';

import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FinancialIssuesEditPage extends StatefulWidget {
  FinancialIssuesEditPage({Key? key, required this.issue}) : super(key: key);

  final AdminIssueModel issue;
  final FinancialIssuesService issueService = FinancialIssuesService();

  @override
  _FinancialEditPageState createState() => _FinancialEditPageState();
}

class _FinancialEditPageState extends State<FinancialIssuesEditPage> {
  final _formKey = GlobalKey<FormState>();

  late AdminIssueModel issue;
  List<AdminIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      issue = widget.issue;
    });
  }

  void _save() {
    widget.issueService
        .updateFinancialIssue(issue)
        .then((value) => {
              Fluttertoast.showToast(
                  msg: 'Update Successfully',
                  toastLength: Toast.LENGTH_LONG,
                  fontSize: 20,
                  backgroundColor: Colors.green),
              Navigator.pop(context, 'Saved')
            })
        .catchError((err) => {print(err)});
  }

  void _cancel() {
    Fluttertoast.showToast(
        msg: 'Cancelled',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 20,
        backgroundColor: Colors.green);
    Navigator.pop(context, 'Cancelled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NevigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 135, 63, 243),
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Edit Financial Issues",
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 207, 54, 54),
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/750x/27/25/09/272509956d731b4bb4f2489fa8bf029e.jpg"),
              fit: BoxFit.cover),
        ),
        height: 900,
        child: Stack(
          children: [
            Positioned(
                top: 500,
                left: 0,
                child: Container(
                  width: 410,
                  height: 210,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ero.png'),
                        fit: BoxFit.fill),
                  ),
                )),
            SingleChildScrollView(
              padding: const EdgeInsets.all(35),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 250,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.title),
                          border: OutlineInputBorder(),
                          labelText: 'Type the title',
                        ),
                        initialValue: issue.title,
                        onChanged: (text) {
                          issue.title = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Title is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.numbers),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Monthly Income',
                        ),
                        initialValue: issue.monthlyIncome,
                        onChanged: (text) {
                          issue.monthlyIncome = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Monthly Income is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.save,
                            color: Colors.black54,
                          ),
                          label: const Text('Update'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _save();
                            }
                          },
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.cancel, color: Colors.black54),
                          label: const Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            _cancel();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
