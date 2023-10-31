import 'package:chapter_10_covid_app/Services/statsServices.dart';
import 'package:chapter_10_covid_app/View/WorldStats.dart';
import 'package:chapter_10_covid_app/View/countries.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class IndividualCountry extends StatefulWidget {
  String name;
  int cases, deaths, recovered, active, critical, deathstoday, recoveredtoday;
  String image;
  IndividualCountry(
      {required this.active,
      required this.cases,
      required this.critical,
      required this.deaths,
      required this.deathstoday,
      required this.name,
      required this.recovered,
      required this.recoveredtoday,
      required this.image});

  @override
  State<IndividualCountry> createState() => _IndividualCountryState();
}

class _IndividualCountryState extends State<IndividualCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReuseableRow(
                          title: 'Total', value: widget.cases.toString()),
                      ReuseableRow(
                          title: 'Deaths', value: widget.deaths.toString()),
                      ReuseableRow(
                          title: 'Recovered',
                          value: widget.recovered.toString()),
                      ReuseableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReuseableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReuseableRow(
                          title: 'Recovered Today',
                          value: widget.recoveredtoday.toString()),
                      ReuseableRow(
                          title: 'Deaths Today',
                          value: widget.deathstoday.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image.toString()))
            ],
          )
        ],
      )),
    );
  }
}
