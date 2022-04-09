import 'package:flutter/material.dart';
import 'package:flutterfront/componets/custom_page_route.dart';
import 'package:flutterfront/models/admin.dart';
import 'package:flutterfront/screens/admin/adminHome.dart';
import 'package:flutterfront/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://10.0.2.2:8060/admin/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': admin.email,
          'password': admin.password
        });
    print(res.statusCode);
    if (res.statusCode == 200 || res.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Login Successfully", // message
          toastLength: Toast.LENGTH_LONG,
          fontSize: 20,
          backgroundColor: Colors.green // duration
          );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AdminHome()),
          (route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Login Unsccessfully", // message
          toastLength: Toast.LENGTH_LONG,
          fontSize: 20,
          backgroundColor: Colors.red // duration
          );
    }
  }

  bool show = true;

  Admin admin = Admin('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 60,
            left: 140,
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            )),
        ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Admin Signin",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: const Color.fromARGB(255, 199, 69, 231)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: admin.email),
                        onChanged: (value) {
                          admin.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid email';
                          }
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(172, 158, 5, 209),
                            ),
                            hintText: 'Enter Email',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(172, 199, 31, 255))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(172, 199, 31, 255))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        obscureText: show,
                        controller: TextEditingController(text: admin.password),
                        onChanged: (value) {
                          admin.password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(172, 158, 5, 209),
                            ),
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              icon: Icon(show
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  show = !show;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(172, 199, 31, 255))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(172, 199, 31, 255))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: Container(
                        height: 50,
                        width: 400,
                        child: FlatButton(
                            color: const Color.fromARGB(255, 199, 69, 231),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                save();
                              } else {
                                print("not ok");
                              }
                            },
                            child: const Text(
                              "Signin",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(195, 16, 16, 0),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: InkWell(
                            child: const Text('User Home',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue)),
                            onTap: () {
                              Navigator.of(context).push(CustomPageRoute(
                                  child: const Home(),
                                  direction: AxisDirection.up));
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
