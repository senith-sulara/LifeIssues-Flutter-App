import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';

void main() {
  runApp(const AboutPage());
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: NevigationDrawer(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 63, 243),
            bottom: const PreferredSize(
              preferredSize: Size(40, 50),
              child: SizedBox(
                height: 30,
                child: TabBar(
                  padding: EdgeInsets.only(bottom: 0.0),
                  tabs: [
                    Text('Family',
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 203, 245))),
                    Text('Social',
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 203, 245))),
                    Text('Health',
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 203, 245))),
                    Text('Financial',
                        style: TextStyle(
                            color: Color.fromARGB(255, 224, 203, 245))),
                  ],
                  indicatorColor: Color.fromARGB(255, 207, 60, 236),
                ),
              ),
            ),
            title: const Text(
              'About The App',
              style: TextStyle(
                  fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
            iconTheme:
                const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
          ),
          body: const TabBarView(
            children: [
              SizedBox(
                width: 100.0,
                child: Image(
                  image: AssetImage('assets/images/family.png'),
                ),
              ),
              Image(
                image: AssetImage('assets/images/social3.png'),
              ),
              Image(
                image: AssetImage('assets/images/view2.png'),
              ),
              Image(
                image: AssetImage('assets/images/money2.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
