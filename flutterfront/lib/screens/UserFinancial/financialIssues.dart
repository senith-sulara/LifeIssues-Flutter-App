import 'package:flutter/material.dart';
import 'package:flutterfront/models/financialIssue.model.dart';

import 'package:flutterfront/services/api_service.dart';

class FniancialIssuesInFive extends StatefulWidget {
  FniancialIssuesInFive({Key? key}) : super(key: key);

  // final String title;
  final FinancialIssuesService familyIssuesService = FinancialIssuesService();
  // final ProjectService projectService = new ProjectService();

  @override
  _FamilyIssuePageState createState() => _FamilyIssuePageState();
}

class _FamilyIssuePageState extends State<FniancialIssuesInFive> {
  List<AdminIssueModel> issues = [];
  // List<Project> projects = new List();

  @override
  void initState() {
    super.initState();
    _getFamilyIssues();
    // _getProjects();
  }

  void _getFamilyIssues() {
    widget.familyIssuesService.getAll().then((value) => {
          setState(() {
            issues = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 63, 243),
            title: const Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Text(
                'Financial Issues in Next Five Years',
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
                image: AssetImage('assets/images/issueback.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 470,
                  left: 0,
                  child: Container(
                    width: 420,
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/herso.png'),
                          fit: BoxFit.fill),
                    ),
                  )),
              Center(
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 25.0, right: 25.0, bottom: 100.0),
                  scrollDirection: Axis.vertical,
                  children: issues
                      .map((data) => Card(
                            color: const Color.fromRGBO(202, 177, 242, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: Text(data.monthlyIncome.toString()),
                              title: Text(data.title.toString()),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
