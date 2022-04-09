import 'package:flutter/material.dart';
import 'package:flutterfront/componets/navigationdrawer.dart';
import 'package:flutterfront/models/socialIssue.dart';
import 'package:flutterfront/screens/admin/socialadmin/insertSocialIssue.dart';
import 'package:flutterfront/screens/admin/socialadmin/socialEditadmin.dart';
import 'package:flutterfront/screens/admin/socialadmin/socialadminDetails.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:flutterfront/utils/confirmDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SocialIssuesAdmin extends StatefulWidget {
  SocialIssuesAdmin({Key? key}) : super(key: key);

  // final String title;
  final SocialIssuesService socialIssuesService = SocialIssuesService();
  // final ProjectService projectService = new ProjectService();

  @override
  _SocialIssuePageState createState() => _SocialIssuePageState();
}

class _SocialIssuePageState extends State<SocialIssuesAdmin> {
  List<SocialIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    _getSocialIssues();
  }

  void _getSocialIssues() {
    widget.socialIssuesService.getAll().then((value) => {
          setState(() {
            issues = value;
          })
        });
  }

  void _detailIssues(SocialIssueModel issue) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SocialIssueDetails(issue: issue)),
    );
  }

  void _createIssues() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SocialCreatePage()),
    );
    _getSocialIssues();
  }

  void _editeIssues(SocialIssueModel issue) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => SocialIssuesEditPage(issue: issue)),
    );
    _getSocialIssues();
  }

  void _deleteIssues(SocialIssueModel issue) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.socialIssuesService
            .deleteIssue(issue)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getSocialIssues()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NevigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 135, 63, 243),
          title: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "Social Issues",
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
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(25.0),
            scrollDirection: Axis.vertical,
            children: issues
                .map((data) => Card(
                      color: Color.fromARGB(255, 177, 139, 238),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage('${data.imageUrl}')),
                        title: Text(data.title.toString()),
                        trailing: PopupMenuButton(
                          onSelected: (option) {
                            if (option == 'detail') {
                              _detailIssues(data);
                            } else if (option == 'edit') {
                              _editeIssues(data);
                            } else {
                              _deleteIssues(data);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'detail',
                              child: Row(children: const [
                                Icon(Icons.info),
                                SizedBox(width: 10),
                                Text('Detail'),
                              ]),
                            ),
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(children: const [
                                Icon(Icons.edit),
                                SizedBox(width: 10),
                                Text('Edit'),
                              ]),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(children: const [
                                Icon(Icons.delete),
                                SizedBox(width: 10),
                                Text('Delete'),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createIssues();
        },
        tooltip: 'Create issue',
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(246, 155, 132, 238),
      ),
    );
  }
}
