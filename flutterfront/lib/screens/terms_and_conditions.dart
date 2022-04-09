import 'package:flutter/material.dart';

import '../componets/usernavigationdrawer.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    Widget aboutUsSection = SizedBox(
      child: Column(
        children: const [
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "We will not use your personal data for any purpose.",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 50,
                    color: Color.fromARGB(253, 255, 208, 208)),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );

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
              "Terms and Conditions",
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(215, 255, 255, 255)),
            ),
          ),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [aboutUsSection],
        ),
      ),
    );
  }
}
