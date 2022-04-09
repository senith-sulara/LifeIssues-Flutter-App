import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:flutterfront/screens/admin/healthadmin/editHealthIssues.dart';
import 'package:flutterfront/screens/admin/healthadmin/healthIssueItem.dart';
import 'package:flutterfront/screens/admin/healthadmin/insertHealthIssue.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:flutterfront/utils/confirmDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HealthIssueAdmin extends StatefulWidget {
  HealthIssueAdmin({Key? key}) : super(key: key);

  // final String title;
  final HealthIssuesService healthIssuesService = HealthIssuesService();
  // final ProjectService projectService = new ProjectService();

  @override
  _HealthIssueAdminPageState createState() => _HealthIssueAdminPageState();
}

class _HealthIssueAdminPageState extends State<HealthIssueAdmin> {
  List<HealthIssueModel> issues = [];

  @override
  void initState() {
    super.initState();
    _getHealthIssueAdmin();
  }

  void _getHealthIssueAdmin() {
    widget.healthIssuesService.getAll().then((value) => {
          setState(() {
            issues = value;
          })
        });
  }

  void _detailIssues(HealthIssueModel issue) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HealthIssueItem(issue: issue)),
    );
  }

  void _createIssues() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HealthCreatePage()),
    );
    _getHealthIssueAdmin();
  }

  void _editeIssues(HealthIssueModel issue) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => HealthIssuesEditPage(issue: issue)),
    );
    _getHealthIssueAdmin();
  }

  void _deleteIssues(HealthIssueModel issue) {
    ConfirmDialog.show(
      context,
      'Are you sure you want to delete?',
      () => ({
        widget.healthIssuesService
            .deleteIssue(issue)
            .then((value) => {
                  Fluttertoast.showToast(
                      msg: 'Successfully Deleted',
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.green),
                  _getHealthIssueAdmin()
                })
            .catchError((e) => {print(e.toString())})
      }),
    );
  }

  // bool _canDelete(FamilyIssueModel issue) {
  //   for (var project in projects) {
  //     if (project.responsible.email == issue.email) return false;
  //   }
  //   return true;
  // }

  // void _getProjects() {
  //   widget.projectService.getAll().then((value) => {
  //         setState(() {
  //           projects = value;
  //         })
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NevigationDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 135, 63, 243),
          title: const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              "Health Issues",
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
              image: AssetImage('assets/images/background2.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(25.0),
            scrollDirection: Axis.vertical,
            children: issues
                .map((data) => Card(
                      color: const Color.fromARGB(255, 177, 139, 238),
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
                                Icon(Icons.insert_drive_file_rounded),
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
        backgroundColor: const Color.fromARGB(246, 155, 132, 238),
      ),
    );
  }
}
