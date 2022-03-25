import 'package:flutter/material.dart';
import 'package:flutter_festival_gdg_bogor_1/data/forecast_data.dart';

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final DailyForecast dailyForecast = dummyData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          DecoratedBox(
                            position: DecorationPosition.foreground,
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: <Color>[
                                  Colors.grey[800]!,
                                  Colors.transparent
                                ],
                              ),
                            ),
                            child: Image.network(
                              dailyForecast.imageId,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Text(
                              dailyForecast.getDate(currentDate.day).toString(),
                              style: textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              dailyForecast.getWeekday(currentDate.weekday),
                              style: textTheme.headline5,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              dailyForecast.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
                        style: textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 7,
      ),
    );
  }
}
