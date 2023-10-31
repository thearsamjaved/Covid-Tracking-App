import 'package:chapter_10_covid_app/Services/statsServices.dart';
import 'package:chapter_10_covid_app/View/individual_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchcontroller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search Country',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statServices.countrStats(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ),
                            Divider(),
                          ],
                        ));
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name = snapshot.data![index]["country"];
                    if (searchcontroller.text.isEmpty) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IndividualCountry(
                                      name: snapshot.data![index]['country']
                                          .toString(),
                                      cases: snapshot.data![index]['cases'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      active: snapshot.data![index]['active'],
                                      deaths: snapshot.data![index]['deaths'],
                                      recovered: snapshot.data![index]
                                          ['recovered'],
                                      deathstoday: snapshot.data![index]
                                          ['todayDeaths'],
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      recoveredtoday: snapshot.data![index]
                                          ['todayRecovered'],
                                    ),
                                  ));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]["country"]),
                              subtitle: Text(
                                  snapshot.data![index]["cases"].toString()),
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data![index]
                                      ["countryInfo"]["flag"])),
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    } else if (name
                        .toLowerCase()
                        .contains(searchcontroller.text.toLowerCase())) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IndividualCountry(
                                      name: snapshot.data![index]['country']
                                          .toString(),
                                      cases: snapshot.data![index]['cases'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      active: snapshot.data![index]['active'],
                                      deaths: snapshot.data![index]['deaths'],
                                      recovered: snapshot.data![index]
                                          ['recovered'],
                                      deathstoday: snapshot.data![index]
                                          ['todayDeaths'],
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      recoveredtoday: snapshot.data![index]
                                          ['todayRecovered'],
                                    ),
                                  ));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]["country"]),
                              subtitle: Text(
                                  snapshot.data![index]["cases"].toString()),
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data![index]
                                      ["countryInfo"]["flag"])),
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              }
            },
          ))
        ],
      )),
    );
  }
}
