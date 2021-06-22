
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.37,
              top: 20),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF60BE93),
                Color(0xFF1B8D59),
              ]),
              borderRadius: BorderRadius.circular(20)),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Dial 999 for \nMedical Help\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "If any Symptoms appear",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4)))
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SvgPicture.asset("assets/icons/nurse.svg"),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"))
      ],
    );
  }
}
