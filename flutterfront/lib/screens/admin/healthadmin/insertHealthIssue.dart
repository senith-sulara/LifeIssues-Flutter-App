import 'package:flutter/material.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:flutterfront/screens/admin/healthadmin/healthissues.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HealthCreatePage extends StatefulWidget {
  HealthCreatePage({Key? key}) : super(key: key);

  // final String title;
  final HealthIssuesService healthIssuesService = HealthIssuesService();

  @override
  _HealthCreatePageState createState() => _HealthCreatePageState();
}

class _HealthCreatePageState extends State<HealthCreatePage> {
  set issues(List<HealthIssueModel> issues) {}

  @override
  void initState() {
    super.initState();
    _getHealthIssueAdmin();
  }

  void _getHealthIssueAdmin() {
    widget.healthIssuesService.getAll().then((value) => {
          setState(() {
            issues = value;
          })
        });
  }

  final _formKey = GlobalKey<FormState>();
  HealthInsert healthinsert = HealthInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  String _genderController = "Male";
  String _ageRangeController = "20-30";
  String _workoutRangeController = "0-1Hrs";
  String _waterIntakeController = "0.5L-1L";

  List<String> listOfStrings = ["Male", "Female"];
  List<String> listOfAgeRange = ["20-30", "30-40", "40-60"];
  List<String> listOfWorkoutHours = ["0-1Hrs", "1-3Hrs", "3-5Hrs"];
  List<String> listOfWaterIntake = ["0.5L-1L", "1L-3L"];

  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // drawer: NevigationDrawer(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 135, 63, 243),
              title: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Enter Health Issues",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(215, 255, 255, 255)),
                ),
              ),
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 247, 213, 255)),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 207, 54, 54),
              image: DecorationImage(
                  image: AssetImage('assets/images/background2.jpg'),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 40.0, right: 40.0, bottom: 5.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(199, 158, 126, 173),
                                      )),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 40, 1, 100)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 40, 1, 100)),
                                  ),
                                  labelText: 'Enter Title',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 40, 1, 100),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Title can't be empty";
                                  }
                                  if (value.length < 5) {
                                    return 'Enter minimum 5';
                                  }

                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextFormField(
                                  controller: _imageUrlController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(255, 40, 1, 100),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 40, 1, 100)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 40, 1, 100)),
                                      ),
                                      labelText: 'Enter your image Url',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 40, 1, 100),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Image Url can't be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 15.0, bottom: 5.0),
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 1, 100)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 3.0, bottom: 10.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(255, 40, 1, 100),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 40, 1, 100)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 40, 1, 100)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Gender can't be empty";
                                      }
                                      return null;
                                    },
                                    value: _genderController,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    elevation: 10,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 40, 1, 100)),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _genderController = newValue!;
                                      });
                                    },
                                    items: listOfStrings
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 5.0),
                                child: Text(
                                  'Age range',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 1, 100)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(255, 40, 1, 100),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 40, 1, 100)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 40, 1, 100)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Age Range Status can't be empty";
                                      }
                                      return null;
                                    },
                                    value: _ageRangeController,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    elevation: 10,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 40, 1, 100)),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _ageRangeController = newValue!;
                                      });
                                    },
                                    items: listOfAgeRange
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 5.0),
                                child: Text(
                                  'Workout per week',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 1, 100)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(255, 40, 1, 100),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 40, 1, 100)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 40, 1, 100)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Workout field can't be empty";
                                      }
                                      return null;
                                    },
                                    value: _workoutRangeController,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    elevation: 10,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 40, 1, 100)),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _workoutRangeController = newValue!;
                                      });
                                    },
                                    items: listOfWorkoutHours
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Text(
                                  'Water consumption per day',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 79, 0, 110)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(90.0)),
                                          borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                255, 106, 11, 247),
                                          )),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 106, 11, 247)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 106, 11, 247)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "This field can't be empty";
                                      }
                                      return null;
                                    },
                                    value: _waterIntakeController,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    elevation: 10,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 40, 1, 100)),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _waterIntakeController = newValue!;
                                      });
                                    },
                                    items: listOfWaterIntake
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 610,
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
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 40),
          child: FloatingActionButton.extended(
            onPressed: () {
              if (_formKey.currentState!.validate() || validate) {
                Map<String, String> data = {
                  "title": _titleController.text,
                  "imageUrl": _imageUrlController.text,
                  "gender": _genderController,
                  "ageRange": _ageRangeController,
                  "workoutRange": _workoutRangeController,
                  "waterIntakeRange": _waterIntakeController,
                };
                print(data);
                var result =
                    healthinsert.post("/healthIssueDetails/insert", data);
                if (result == null) {
                  Fluttertoast.showToast(
                      msg: "Unsccessfully", // message
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.red // duration
                      );
                } else {
                  Fluttertoast.showToast(
                      msg: "Save Successfully", // message
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green // duration
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthIssueAdmin()),
                  );
                }
              } else {
                Fluttertoast.showToast(
                    msg: "Please Fill all Fields", // message
                    toastLength: Toast.LENGTH_LONG,
                    fontSize: 20,
                    backgroundColor: Colors.red // duration
                    );
              }
            },
            label: const Text(
              'Save',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
            icon: const Icon(Icons.arrow_circle_right_rounded,
                color: Colors.white),
            backgroundColor: const Color.fromRGBO(145, 143, 225, 0.85),
          ),
        ),
      ],
    );
  }
}
