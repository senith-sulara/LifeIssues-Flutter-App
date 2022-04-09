import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/models/familyIssue.model.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:marquee/marquee.dart';

class FamilyIssuesInFive extends StatefulWidget {
  FamilyIssuesInFive({Key? key}) : super(key: key);

  final FamilyIssuesByService familyIssuesService = FamilyIssuesByService();

  @override
  _FamilyIssuePageState createState() => _FamilyIssuePageState();
}

class _FamilyIssuePageState extends State<FamilyIssuesInFive> {
  List<FamilyIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    _getFamilyIssues();
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
            title: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: animatedHeader('Family Issues in Next Five Years'),
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
                              leading: CircleAvatar(
                                  backgroundColor: Colors.white,
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
      ),
    );
  }

  Widget animatedHeader(String text) => Container(
        height: 30,
        margin: const EdgeInsets.only(top: 5),
        child: Marquee(
          text: text,
          style: const TextStyle(
              fontSize: 24, color: Color.fromARGB(215, 255, 255, 255)),
          blankSpace: 80,
          velocity: 100,
          pauseAfterRound: const Duration(seconds: 1),
        ),
      );
}
