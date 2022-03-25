import 'package:flutter/material.dart';
import 'package:flutter_festival_gdg_bogor_1/data/forecast_data.dart';
import 'package:flutter_festival_gdg_bogor_1/widgets/weekly_forecast_list.dart';

void main() => runApp(const HorizonsApp());

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              stretch: true,
              onStretchTrigger: () async {
                // await Server.requestNewData();
              },
              backgroundColor: Colors.teal[800],
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                title: const Text('Horizons'),
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: <Color>[Colors.teal[800]!, Colors.transparent],
                    ),
                  ),
                  child: Image.network(
                    headerImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const WeeklyForecastList(),
          ],
        ),
      ),
    );
  }
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
