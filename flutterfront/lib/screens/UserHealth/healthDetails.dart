import 'package:flutter/material.dart';
import 'package:flutterfront/screens/UserHealth/healthIssues.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Health> {
  final _globalkey = GlobalKey<FormState>();
  HealthInsert healthInsert = HealthInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  String _genderController = "Male";
  String _ageRangeController = "20-30";
  String _workoutRangeController = "0-1Hrs";
  String _waterIntakeController = "0.5L-1L";

  List<String> listOfStrings = ["Male", "Female"];
  List<String> listOfAgeRange = ["20-30", "30-40", "40-60"];
  List<String> listOfWorkoutHours = ["0-1Hrs", "1-3Hrs", "3-5Hrs"];
  List<String> listOfWaterIntake = ["0.5L-1L", "1L-3L"];

  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 63, 243),
            title: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Health Details",
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(215, 255, 255, 255)),
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
                image: AssetImage('assets/images/familyback.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 510,
                  left: 0,
                  child: Container(
                    width: 410,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/health.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )),
              ListView(
                children: [
                  Form(
                    key: _globalkey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 40.0, right: 40.0, bottom: 10.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(90.0)),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(199, 158, 126, 173),
                                    )),
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(199, 158, 126, 173)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(199, 158, 126, 173)),
                                ),
                                labelText: 'Enter Your Name',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 79, 0, 110),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty)
                                  return "Name can't be empty";
                                if (value.length < 3) return 'Enter minimum 3';
                                return null;
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 0, 110)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              199, 158, 126, 173),
                                        )),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                199, 158, 126, 173)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 158, 126, 173)),
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
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
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
                              padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
                              child: Text(
                                'Select your age range',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 0, 110)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              199, 158, 126, 173),
                                        )),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                199, 158, 126, 173)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 158, 126, 173)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Age range can't be empty";
                                    }
                                    return null;
                                  },
                                  value: _ageRangeController,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  elevation: 10,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
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
                              padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
                              child: Text(
                                'Workout hours per week',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 0, 110)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              199, 158, 126, 173),
                                        )),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                199, 158, 126, 173)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 158, 126, 173)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Workout hours can't be empty";
                                    }
                                    return null;
                                  },
                                  value: _workoutRangeController,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  elevation: 10,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
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
                              padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
                              child: Text(
                                'Water consumption per day',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 0, 110)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(90.0)),
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              199, 158, 126, 173),
                                        )),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                199, 158, 126, 173)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 158, 126, 173)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "water consuption can't be empty";
                                    }
                                    return null;
                                  },
                                  value: _waterIntakeController,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  elevation: 10,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
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
            ],
          ),
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton.extended(
          onPressed: () {
            if (_globalkey.currentState!.validate() || validate) {
              Map<String, String> data = {
                "name": _nameController.text,
                "ageRange": _ageRangeController,
                "gender": _genderController,
                "workoutRange": _workoutRangeController,
                "waterIntakeRange": _waterIntakeController,
              };
              print(data);
              var result = healthInsert.post("/healthDetails/insert", data);
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
                  MaterialPageRoute(builder: (context) => HealthIssue()),
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
            'Next',
            style: TextStyle(
                fontSize: 20.0, color: Color.fromARGB(215, 255, 255, 255)),
          ),
          icon: const Icon(Icons.arrow_right, color: Colors.white),
          backgroundColor: const Color.fromRGBO(145, 143, 225, 0.85),
        ),
      ),
    ]);
  }
}
