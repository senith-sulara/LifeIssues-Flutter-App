import 'package:flutter/material.dart';
import 'package:flutterfront/componets/navigationdrawer.dart';
import 'package:flutterfront/screens/admin/familyadmin/familyissues.dart';
import 'package:flutterfront/screens/admin/financialadmin/financialIssueAdmin.dart';
import 'package:flutterfront/screens/admin/healthadmin/healthissues.dart';
import 'package:flutterfront/screens/admin/socialadmin/socialissueadmin.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 207, 54, 54),
        ),
        child: Stack(children: [
          Scaffold(
            drawer: NevigationDrawer(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 135, 63, 243),
                title: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Admin Home",
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
                    image: AssetImage('assets/images/background2.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Row(
                          children: [
                            Material(
                              color: const Color.fromARGB(255, 119, 1, 148),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black45,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FamilyIssues()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 119, 1, 148),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Ink.image(
                                        image: AssetImage(
                                            'assets/images/familyButton.jpg'),
                                        height: 130,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 7),
                                      const Text(
                                        'Family',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: const Color.fromARGB(255, 119, 1, 148),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SocialIssuesAdmin()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 119, 1, 148),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: AssetImage(
                                              'assets/images/socialbtn.jpg'),
                                          height: 130,
                                          width: 150,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Social',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 35.0),
                        child: Row(
                          children: [
                            Material(
                              color: const Color.fromARGB(255, 119, 1, 148),
                              elevation: 8,
                              borderRadius: BorderRadius.circular(30),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black45,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HealthIssueAdmin()),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 119, 1, 148),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Ink.image(
                                        image: AssetImage(
                                            'assets/images/healthbtn.jpg'),
                                        height: 130,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 7),
                                      const Text(
                                        'Health',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Material(
                                color: const Color.fromARGB(255, 119, 1, 148),
                                elevation: 8,
                                borderRadius: BorderRadius.circular(30),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.black45,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FinancialIssuesAdmin()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 119, 1, 148),
                                          width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Ink.image(
                                          image: AssetImage(
                                              'assets/images/financialbtn.jpg'),
                                          height: 130,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Financial',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
