import 'package:covid_app/constants.dart';
import 'package:covid_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'COVID-19',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme:
                Theme.of(context).textTheme.apply(displayColor: kTextColor)),
        home: CustomDrawerCovidApp());
  }
}

class CustomDrawerCovidApp extends StatefulWidget {
  CustomDrawerCovidApp({Key key}) : super(key: key);

  @override
  _CustomDrawerCovidAppState createState() => _CustomDrawerCovidAppState();
}

class _CustomDrawerCovidAppState extends State<CustomDrawerCovidApp>
    with SingleTickerProviderStateMixin {
  // ? Animation var
  AnimationController animationController;
  // ?utils for animation
  static const double maxSlide = 225;
  double minSlideEdge = 60;
  double maxSlideEdge = maxSlide - 15;
  bool _canBeDragable = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _dragStarted(DragStartDetails details) {
    bool _isopenFromLeft = animationController.isDismissed &&
        details.globalPosition.dx < minSlideEdge;

    bool _isopenFromRight = animationController.isCompleted &&
        details.globalPosition.dx > maxSlideEdge;

    _canBeDragable = _isopenFromLeft || _isopenFromRight;
  }

  void _dragUpdate(DragUpdateDetails details) {
    if (_canBeDragable) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value += delta;
    }
  }

  void _dragend(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() == 365.5) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, snapshot) {
          var slide = maxSlide * animationController.value;
          var scale = 1 - (animationController.value * 0.3);
          return Stack(
            children: [
              MyDrawer(
                function: toggle,
              ),
              GestureDetector(
                onHorizontalDragStart: _dragStarted,
                onHorizontalDragUpdate: _dragUpdate,
                onHorizontalDragEnd: _dragend,
                child: Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: HomePage(
                      func: toggle,
                    )),
              )
            ],
          );
        });
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}

class MyDrawer extends StatelessWidget {
  final Function function;
  const MyDrawer({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF60BE93),
            Color(0xFF1B8D59),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Column(
                      children: [
                        Text("COVID-19",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                        Text(
                          "Keep safe, Keep Well and most of all KEEP THE FAITH\n We will get this through together",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontSize: 12, color: Colors.white),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          child: GestureDetector(
            onTap: function,
            child: SvgPicture.asset(
              "assets/icons/menu.svg",
              color: Colors.white,
            ),
          ),
          top: 40,
          right: 20,
        ),
        Positioned(
          child: SvgPicture.asset("assets/icons/virus.svg"),
          top: 80,
          left: 50,
        ),
        Positioned(
          child: SvgPicture.asset("assets/icons/virus.svg"),
          bottom: 80,
          left: 50,
        ),
        Positioned(
          child: SvgPicture.asset("assets/icons/virus.svg"),
          top: 50,
          left: 140,
        ),
        Positioned(
          child: SvgPicture.asset("assets/icons/virus.svg"),
          bottom: 50,
          left: 150,
        ),
      ],
    );
  }
}

