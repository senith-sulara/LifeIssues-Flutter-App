import 'package:flutter/material.dart';

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
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 63, 243),
            foregroundColor:const Color.fromARGB(255, 255, 255, 255),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Family',
                  
                ),
                Tab(
                  icon: Icon(Icons.group),
                  text: 'Social',
                ),
                Tab(
                  icon: Icon(Icons.local_hospital),
                  text: 'Health',
                ),
                Tab(
                  icon: Icon(Icons.attach_money),
                  text: 'Financial',
                ),
              ],
            ),
            title: const Text('About The App'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 25.0),
                        child: Container(
                          width: 350.0,
                          height: 180.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/herso.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 350.0,
                          height: 250.0,
                          decoration: const BoxDecoration(  
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 234, 222, 246),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              "User can enter few details related to the quesion which related to familiy issues which have to face in day to day life and user will be able to get the problems that their might have to face in with in next five years which related to family issues.",
                              style:
                                  TextStyle(
                                    color: Color.fromARGB(255, 71, 23, 230),
                                    fontSize: 20.0,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/health.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 350.0,
                          height: 250.0,
                          decoration: const BoxDecoration(  
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 234, 222, 246),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              "User can enter few details related to the quesion which related to social circumstance which have to face in day to day life and user will be able to get the problems that their might have to face in with in next five years which related to social issues.",
                              style:
                                  TextStyle(
                                    color: Color.fromARGB(255, 71, 23, 230),
                                    fontSize: 20.0,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/health2.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 350.0,
                          height: 250.0,
                          decoration: const BoxDecoration(  
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 234, 222, 246),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              "User can enter few details related to the quesion which related to health issues which have to face in day to day life and user will be able to get the problems that their might have to face in with in next five years which related to health issues.",
                              style:
                                  TextStyle(
                                    color: Color.fromARGB(255, 71, 23, 230),
                                    fontSize: 20.0,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: Container(
                  width: (MediaQuery.of(context).size.width),
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/finance3.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 350.0,
                          height: 250.0,
                          decoration: const BoxDecoration(  
                            borderRadius:BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 234, 222, 246),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              "User can enter few details related to the quesion which related to finance circumstance which have to face in day to day life and user will be able to get the problems that their might have to face in with in next five years which related to finance issues.",
                              style:
                                  TextStyle(
                                    color: Color.fromARGB(255, 71, 23, 230),
                                    fontSize: 20.0,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Image(
              //     image: AssetImage('assets/images/family.png'),
              //   ),
              // Image(
              //   image: AssetImage('assets/images/social3.png'),
              // ),
              // Image(
              //   image: AssetImage('assets/images/view2.png'),
              // ),
              // Image(
              //   image: AssetImage('assets/images/money2.png'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
