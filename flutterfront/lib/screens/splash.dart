import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/componets/custom_page_route.dart';
import 'package:flutterfront/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:life_solutions/screens/family_s.dart';
// import 'package:life_solutions/screens/familysolutions.dart';
//import 'package:life_solutions/screens/familyissues.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _navigatetohome();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animationController.repeat();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context,
        CustomPageRoute(child: const Home(), direction: AxisDirection.left));
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
        fontSize: 36.0, fontFamily: 'Horizon', decoration: TextDecoration.none);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/Elip.png",
            width: 140,
            height: 140,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 120,
            left: 130,
            child: AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Welcome',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ]),
            // child: Text(
            //   "Welcome",
            //   style: GoogleFonts.reggaeOne(
            //       fontSize: 36,
            //       decoration: TextDecoration.none,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       color: const Color.fromARGB(255, 9, 51, 31)),
            // ),
          ),
          Positioned(
            top: 180,
            left: 190,
            child: Text(
              "to",
              style: GoogleFonts.reggaeOne(
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 95, 3, 148)),
            ),
          ),
          Positioned(
            top: 230,
            left: 115,
            child: AnimatedTextKit(animatedTexts: [
              ColorizeAnimatedText(
                'Life Issues',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ]),
            // child: Text(
            //   "Life Solutions",
            //   style: GoogleFonts.reggaeOne(
            //       fontSize: 36,
            //       decoration: TextDecoration.none,
            //       fontWeight: FontWeight.w700,
            //       fontStyle: FontStyle.italic,
            //       color: const Color.fromARGB(255, 9, 51, 31)),
            // ),
          ),
          Positioned(
              top: 618,
              left: 290,
              child: Container(
                  width: 121,
                  height: 194,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/rectangle137.png'),
                        fit: BoxFit.fill),
                  ))),
          Positioned(
              top: 567,
              left: -10,
              child: Container(
                width: 425,
                height: 338,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/rectangle135.png'),
                      fit: BoxFit.contain),
                ),
              )),
          Positioned(
              top: 338,
              left: -50,
              child: Container(
                  width: 121,
                  height: 194,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/polygon1.png'),
                        fit: BoxFit.fill),
                  ))),
          Positioned(
            top: 290,
            left: 0,
            child: Container(
                width: 450,
                height: 530,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/rectangle136.png'),
                      fit: BoxFit.fill),
                )),
          ),
          Positioned(
              top: 460,
              left: 45,
              child: AnimatedBuilder(
                animation: animationController,
                child: Container(
                  width: 325,
                  height: 216,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/imagesplash.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animationController.value * 6,
                    child: child,
                  );
                },
              )),
          Positioned(
              top: 778,
              left: 155,
              child: Text(
                'from 2022_REG_37',
                style: GoogleFonts.roboto(
                    fontSize: 13,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(166, 107, 6, 138)),
              )),
        ],
      ),
    );
  }
}
