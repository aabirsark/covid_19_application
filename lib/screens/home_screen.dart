import 'package:covid_app/constants.dart';
import 'package:covid_app/screens/detail_Screen.dart';
import 'package:covid_app/widgets/help_card.dart';
import 'package:covid_app/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final Function func;
  const HomePage({Key key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.06),
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: func,
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.06),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CasesCard(
                    title: "Confiremed Cases",
                    ourColor: Colors.orange,
                    cases: "10,000",
                    func: () {
                      Navigator.push(
                          context,
                          _createRoute(
                              color: Colors.orange, title: "Confiremed Cases"));
                    },
                  ),
                  CasesCard(
                    title: "Active Cases",
                    ourColor: Colors.blue,
                    cases: "15,000",
                    func: () {
                      Navigator.push(
                          context,
                          _createRoute(
                              color: Colors.blue, title: "Active Cases"));
                    },
                  ),
                  CasesCard(
                    title: "Deaths",
                    ourColor: Colors.red,
                    cases: "1,000",
                    func: () {
                      Navigator.push(context,
                          _createRoute(color: Colors.red, title: "Deaths"));
                    },
                  ),
                  CasesCard(
                    title: "Recoverd",
                    ourColor: Colors.green,
                    cases: "20,000",
                    func: () => Navigator.push(
                        context,
                        _createRoute(
                            color: Color(0xFF1B8D59), title: "Recoverd")),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            BuildPreventationCard(context: context)
          ],
        ),
      ),
    );
  }

  Route _createRoute({color, title}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondryAnimation) => DetailsPage(
              mainColor: color,
              title: title,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // ? animation var
          Offset begin = Offset(0.0, 0.1);
          Offset end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}

class BuildPreventationCard extends StatelessWidget {
  const BuildPreventationCard({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preventations",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PreventationCard(
                svgSrc: "assets/icons/use_mask.svg",
                title: "Use Mask",
              ),
              PreventationCard(
                svgSrc: "assets/icons/hand_wash.svg",
                title: "Wash Hands",
              ),
              PreventationCard(
                svgSrc: "assets/icons/Clean_Disinfect.svg",
                title: "Clean Disinfect",
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          HelpCard()
        ],
      ),
    );
  }
}

class PreventationCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventationCard({
    Key key,
    @required this.svgSrc,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
