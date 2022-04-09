import 'package:flutter/material.dart';
import 'package:flutterfront/componets/custom_page_route.dart';
import 'package:flutterfront/screens/admin/adminHome.dart';
import 'package:flutterfront/screens/admin/adminSignin.dart';
import 'package:flutterfront/screens/admin/familyadmin/familyissues.dart';
import 'package:flutterfront/screens/admin/financialadmin/financialIssueAdmin.dart';
import 'package:flutterfront/screens/admin/healthadmin/healthissues.dart';
import 'package:flutterfront/screens/admin/socialadmin/socialissueadmin.dart';

class NevigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  NevigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Admin Panel';
    final email = 'admin@lifes.com';
    final urlImage =
        'https://png.pngtree.com/png-clipart/20190924/original/pngtree-administration-icon-in-trendy-style-isolated-background-png-image_4829127.jpg';

    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 135, 63, 243),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Family Issues',
                icon: Icons.family_restroom,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Social Issues',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Health Issues',
                icon: Icons.health_and_safety,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Financial Issues',
                icon: Icons.money,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(height: 16),
            const Divider(color: Colors.white70),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 5)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromARGB(255, 134, 12, 172),
              child: Icon(Icons.admin_panel_settings_outlined,
                  color: Colors.white),
            )
          ]),
        ),
      );
}

void selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(
          CustomPageRoute(child: AdminHome(), direction: AxisDirection.up));
      break;
    case 1:
      Navigator.of(context).push(CustomPageRoute(
          child: FamilyIssues(), direction: AxisDirection.left));
      break;
    case 2:
      Navigator.of(context).push(CustomPageRoute(
          child: SocialIssuesAdmin(), direction: AxisDirection.left));
      break;
    case 3:
      Navigator.of(context).push(CustomPageRoute(
          child: HealthIssueAdmin(), direction: AxisDirection.left));
      break;
    case 4:
      Navigator.of(context).push(CustomPageRoute(
          child: FinancialIssuesAdmin(), direction: AxisDirection.left));
      break;
    case 5:
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Signin()),
          (route) => false);
      break;
  }
}
