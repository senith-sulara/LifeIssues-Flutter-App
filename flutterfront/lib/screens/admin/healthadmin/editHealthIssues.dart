import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HealthIssuesEditPage extends StatefulWidget {
  HealthIssuesEditPage({Key? key, required this.issue}) : super(key: key);

  final HealthIssueModel issue;
  final HealthIssuesService issueService = HealthIssuesService();

  @override
  _EmployeeEditPageState createState() => _EmployeeEditPageState();
}

class _EmployeeEditPageState extends State<HealthIssuesEditPage> {
  final _formKey = GlobalKey<FormState>();

  late HealthIssueModel issue;
  List<HealthIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    _getEmployees();
    setState(() {
      issue = widget.issue;
    });
  }

  void _getEmployees() {
    widget.issueService.getAll().then((value) => {
          setState(() {
            issues = value;
          })
        });
  }

  void _save() {
    widget.issueService
        .updateIssue(issue)
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
        msg: 'Canceled',
        toastLength: Toast.LENGTH_LONG,
        fontSize: 20,
        backgroundColor: Colors.green);
    Navigator.pop(context, 'Canceled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NevigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 135, 63, 243),
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Edit Health Issues",
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
        ),
      ),
      body: Container(
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
                        image: AssetImage('assets/images/health3.png'),
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
                          icon: Icon(Icons.description),
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
                        maxLength: 600,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.image_rounded),
                          border: OutlineInputBorder(),
                          labelText: 'Enter the image URL',
                        ),
                        initialValue: issue.imageUrl,
                        onChanged: (text) {
                          issue.imageUrl = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Image URL is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.male),
                          border: OutlineInputBorder(),
                          labelText: 'Enter Gender',
                        ),
                        initialValue: issue.ageRange,
                        onChanged: (text) {
                          issue.gender = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Gender is required!';
                          }
                          return null;
                        }),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      maxLength: 35,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_view_day_rounded),
                        border: OutlineInputBorder(),
                        labelText: 'Enter age range Status',
                      ),
                      initialValue: issue.ageRange,
                      onChanged: (text) {
                        issue.ageRange = text;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Age range is required!';
                        }
                        return null;
                      }
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.water_drop),
                          border: OutlineInputBorder(),
                          labelText: 'Enter water consumption',
                        ),
                        initialValue: issue.waterIntakeRange,
                        onChanged: (text) {
                          issue.waterIntakeRange = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required!';
                          }
                          return null;
                        }),

                        const SizedBox(height: 15),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        maxLength: 35,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.av_timer),
                          border: OutlineInputBorder(),
                          labelText: 'Enter workout hrs per week',
                        ),
                        initialValue: issue.workoutRange,
                        onChanged: (text) {
                          issue.workoutRange = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required!';
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
                            color: Colors.white,
                          ),
                          label: const Text('Update'),
                            
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 135, 63, 243),
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
                          icon: const Icon(Icons.cancel, color: Colors.white),
                          label: const Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 246, 92, 81),
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
