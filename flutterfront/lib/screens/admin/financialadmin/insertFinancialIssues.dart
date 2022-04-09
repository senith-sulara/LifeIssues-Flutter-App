import 'package:flutter/material.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class InsertFinancialIssues extends StatefulWidget {
  InsertFinancialIssues({Key? key}) : super(key: key);

  @override
  _FinancialCreatePageState createState() => _FinancialCreatePageState();
}

class _FinancialCreatePageState extends State<InsertFinancialIssues> {
  final _formKey = GlobalKey<FormState>();
  FinanceInsert socialInsert = FinanceInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  final _titleController = TextEditingController();
  final _monthlyIncomController = TextEditingController();

  @override
  void onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  Future<void> refresh() async {
    _titleController.text = '';
    _monthlyIncomController.text = '';
    errorText = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                  "Create Financial Issues",
                  style: TextStyle(
                      fontSize: 24.0,
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
                  image: AssetImage('assets/images/insertback.jpg'),
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
                LiquidPullToRefresh(
                  color: const Color.fromARGB(255, 199, 69, 231),
                  onRefresh: refresh,
                  child: ListView(
                    children: [
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 40.0, right: 40.0, bottom: 10.0),
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
                                    labelText: 'Enter Title',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 79, 0, 110),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Title can't be empty";
                                    }
                                    if (value.length < 3)
                                      return 'Enter minimum 3';
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextFormField(
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    controller: _monthlyIncomController,
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
                                      labelText: 'Enter Monthly Income',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 79, 0, 110),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return "Monthly Income can't be empty";
                                      return null;
                                    },
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      // Positioned(
                      //     top: 610,
                      //     left: 0,
                      //     child: Container(
                      //       width: 410,
                      //       height: 210,
                      //       decoration: const BoxDecoration(
                      //         image: DecorationImage(
                      //             image: AssetImage('assets/images/ero.png'),
                      //             fit: BoxFit.fill),
                      //       ),
                      //     )),
                    ],
                  ),
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
              if (_formKey.currentState!.validate() || validate) {
                Map<String, String> data = {
                  "title": _titleController.text,
                  "monthlyIncome": _monthlyIncomController.text,
                };
                print(data);
                var result =
                    socialInsert.post("/financeIssuesDetails/addIssues", data);
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
                  // Navigator.of(context).push(CustomPageRoute(
                  //     child: FamilyIssues(), direction: AxisDirection.left));
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
            icon: const Icon(Icons.save, color: Colors.white),
            backgroundColor: const Color.fromRGBO(145, 143, 225, 0.85),
          ),
        ),
      ],
    );
  }
}
