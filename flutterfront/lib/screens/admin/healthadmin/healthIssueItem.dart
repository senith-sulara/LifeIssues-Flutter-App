import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HealthIssueItem extends StatefulWidget {
  const HealthIssueItem({Key? key, required this.issue}) : super(key: key);

  final HealthIssueModel issue;

  @override
  _HealthIDetailPageState createState() => _HealthIDetailPageState();
}

class _HealthIDetailPageState extends State<HealthIssueItem> {
  final _formKey = GlobalKey<FormState>();

  late HealthIssueModel issue;

  @override
  void initState() {
    super.initState();
    setState(() {
      issue = widget.issue;
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
                  "View Health Issues",
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
            height: 800,
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.title),
                              border: OutlineInputBorder(),
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.title),
                        const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.image),
                              border: OutlineInputBorder(),
                              labelText: 'Image URL',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.imageUrl),
                        const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.male),
                              border: OutlineInputBorder(),
                              labelText: 'Gender',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.gender),
                        const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: 'Age Range',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.ageRange),
                        const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.water_drop),
                              border: OutlineInputBorder(),
                              labelText: 'Water Intake ',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.waterIntakeRange),
                             const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.timer),
                              border: OutlineInputBorder(),
                              labelText: 'Workout',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.workoutRange),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 480,
                    left: 0,
                    child: Container(
                      width: 410,
                      height: 210,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/health2.jpg'),
                            fit: BoxFit.fill),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
