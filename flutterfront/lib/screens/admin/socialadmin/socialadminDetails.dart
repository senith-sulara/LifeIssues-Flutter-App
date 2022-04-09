import 'package:flutter/material.dart';
import 'package:flutterfront/models/socialIssue.dart';

class SocialIssueDetails extends StatefulWidget {
  const SocialIssueDetails({Key? key, required this.issue}) : super(key: key);

  final SocialIssueModel issue;

  @override
  _SocialDetailPageState createState() => _SocialDetailPageState();
}

class _SocialDetailPageState extends State<SocialIssueDetails> {
  final _formKey = GlobalKey<FormState>();

  late SocialIssueModel issue;

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
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 135, 63, 243),
              title: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "Social Issues Details",
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
                  image: NetworkImage(
                      "https://i.pinimg.com/750x/27/25/09/272509956d731b4bb4f2489fa8bf029e.jpg"),
                  fit: BoxFit.cover),
            ),
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
                              labelText: 'Civil Status',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.civilstatus),
                        const SizedBox(height: 15),
                        TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.numbers),
                              border: OutlineInputBorder(),
                              labelText: 'Age Renge',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 79, 0, 110),
                                fontSize: 20.0,
                              ),
                            ),
                            initialValue: issue.age),
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
                            image: AssetImage('assets/images/ero.png'),
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
