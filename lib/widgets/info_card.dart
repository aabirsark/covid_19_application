import 'package:covid_app/widgets/liner_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class CasesCard extends StatelessWidget {
  final String cases;
  final String title;
  final Color ourColor;
  final Function func;
  const CasesCard({
    Key key,
    @required this.cases,
    @required this.title,
    @required this.ourColor, @required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: func,
        child: Container(
          width: constraints.maxWidth / 2 - 5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10.0, top: 5.0),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: ourColor.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/running.svg",
                          color: ourColor, height: 20, width: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: kTextColor),
                          children: [
                            TextSpan(
                                text: "$cases \n",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "people",
                                style: TextStyle(fontSize: 12, height: 2))
                          ]),
                    ),
                    Expanded(
                        child: LineReportChart(
                      color: ourColor,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
