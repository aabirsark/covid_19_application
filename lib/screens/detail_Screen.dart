import 'package:covid_app/constants.dart';
import 'package:covid_app/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final Color mainColor;
  const DetailsPage({Key key, @required this.title, @required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 53,
                          color: Colors.black.withOpacity(0.1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndMore(mainColor: mainColor, title: title),
                    SizedBox(
                      height: 10,
                    ),
                    CaseNUmber(mainColor: mainColor, context: context),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                          color: kTextMediumColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    WeeklyChart(color: mainColor),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextINfoPer(
                              mainColor: mainColor,
                              percent: "6.49",
                              sub: "From Last Week"),
                          TextINfoPer(
                              mainColor: mainColor,
                              percent: "9.82",
                              sub: "Recovery Rate")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 53,
                          color: Colors.black.withOpacity(0.1))
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Global Map",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Text("")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      "assets/icons/map.svg",
                      color: mainColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CaseNUmber extends StatelessWidget {
  const CaseNUmber({
    Key key,
    @required this.mainColor,
    @required this.context,
  }) : super(key: key);

  final Color mainColor;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "512 ",
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: mainColor, height: 1.2),
        ),
        Text(
          "5.65% ",
          style: TextStyle(color: mainColor),
        ),
        SvgPicture.asset(
          "assets/icons/increase.svg",
          color: mainColor,
        )
      ],
    );
  }
}

class TitleAndMore extends StatelessWidget {
  const TitleAndMore({
    Key key,
    @required this.mainColor,
    @required this.title,
  }) : super(key: key);

  final Color mainColor;
  final title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        SvgPicture.asset(
          "assets/icons/menu.svg",
          color: mainColor,
        )
      ],
    );
  }
}

class TextINfoPer extends StatelessWidget {
  const TextINfoPer({
    Key key,
    @required this.mainColor,
    @required this.percent,
    @required this.sub,
  }) : super(key: key);

  final Color mainColor;
  final String percent;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$percent %\n",
          style: TextStyle(fontSize: 20, color: mainColor)),
      TextSpan(
          text: sub, style: TextStyle(color: kTextMediumColor, height: 1.5))
    ]));
  }
}
