import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:flutterfront/services/api_service.dart';

class HealthIssue extends StatefulWidget {
  HealthIssue({Key? key}) : super(key: key);

  final HealthIssuesService healthIssuesService = HealthIssuesService();

  @override
  _HealthIssuePageState createState() => _HealthIssuePageState();
}

class _HealthIssuePageState extends State<HealthIssue> {
  List<HealthIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    _getHealthIssues();
  }

  void _getHealthIssues() {
    widget.healthIssuesService.getAll().then((value) => {
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
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "Health Issues in Next Five Years",
                style: TextStyle(
                    fontSize: 18.0, color: Color.fromARGB(215, 255, 255, 255)),
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
                          image: AssetImage('assets/images/health2.jpg'),
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
                            color: Color.fromRGBO(202, 177, 242, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('${data.imageUrl}')),
                              title: Text(data.title.toString()),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20, left: 20),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text(
              'Back',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
            icon: const Icon(Icons.update, color: Colors.white),
            backgroundColor: const Color.fromRGBO(145, 143, 225, 0.85),
          ),
        ),
      ),
    );
  }
}
