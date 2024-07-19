import 'package:corona_app/countries_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Services/Utilities/states_servies.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({super.key});

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: StatesServies.getAllData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SpinKitFadingCircle(
              color: Colors.white,
              size: 50,
              controller: controller,
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.teal.shade800,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      PieChart(
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValueBackground: true,
                            showChartValuesOutside: true,
                          ),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          animationDuration: const Duration(
                            microseconds: 1200,
                          ),
                          dataMap: {
                            'Total': double.parse(
                                snapshot.data!.affectedCountries.toString()),
                            'Recovered': double.parse(
                                snapshot.data!.todayRecovered.toString()),
                            'Deaths': double.parse(
                                snapshot.data!.deathsPerOneMillion.toString()),
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .06,
                        ),
                        child: Card(
                          color: Colors.teal.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ReUseAble(
                                    title: 'Total Cases',
                                    value: snapshot.data!.updated.toString()),
                                ReUseAble(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString()),
                                ReUseAble(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString()),
                                ReUseAble(
                                    title: 'Case Per Million',
                                    value: snapshot.data!.casesPerOneMillion
                                        .toString()),
                                ReUseAble(
                                    title: 'Death per Million',
                                    value: snapshot.data!.deathsPerOneMillion
                                        .toString()),
                                ReUseAble(
                                    title: 'Affected Countries',
                                    value: snapshot.data!.affectedCountries
                                        .toString())
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CountriesScreen()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xff1aa260),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(child: Text('Track Countries')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          
        });
  }
}

class ReUseAble extends StatelessWidget {
  String title, value;
  ReUseAble({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        // vertical: 5
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(title), Text(value)],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
