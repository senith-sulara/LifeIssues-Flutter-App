import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/screens/UserFamily/family_s.dart';
import 'package:flutterfront/screens/admin/familyadmin/familyissues.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Familys extends StatefulWidget {
  const Familys({Key? key}) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Familys> {
  final _globalkey = GlobalKey<FormState>();
  FamilyInsert familyInsert = FamilyInsert();
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
  String _civilController = "Married";
  List<String> listOfStrings = ["Male", "Female", "Other"];
  List<String> listOfCivil = ["Married", "Unmarried"];

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _jobController = TextEditingController();

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
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Family Issues",
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
                image: AssetImage('assets/images/familyback.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 480,
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
              ListView(
                children: [
                  Form(
                    key: _globalkey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
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
                              padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 0, 110)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 30.0),
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
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 20,
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
                            TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              controller: _ageController,
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
                                labelText: 'Enter Your Age',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 79, 0, 110),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) return "Age can't be empty";
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: TextFormField(
                                controller: _jobController,
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
                                    labelText: 'Enter your job status',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 79, 0, 110),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "Job Status can't be empty";
                                  return null;
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                              child: Text(
                                'Civil Status',
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
                                    if (value!.isEmpty)
                                      return "Email can't be empty";
                                    return null;
                                  },
                                  value: _civilController,
                                  icon: const Icon(Icons.arrow_downward),
                                  iconSize: 20,
                                  elevation: 10,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _civilController = newValue!;
                                    });
                                  },
                                  items: listOfCivil
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
                "gender": _genderController,
                "age": _ageController.text,
                "job": _jobController.text,
                "civilstatus": _civilController,
              };
              print(data);
              var result = familyInsert.post("/userDetails/insert", data);
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
                  MaterialPageRoute(builder: (context) => FamilyIssuesInFive()),
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
                fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
          ),
          icon:
              const Icon(Icons.arrow_circle_right_rounded, color: Colors.white),
          backgroundColor: const Color.fromRGBO(145, 143, 225, 0.85),
        ),
      ),
    ]);
  }
}
