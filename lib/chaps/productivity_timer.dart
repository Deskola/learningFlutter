import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tutorial/chaps/timerContent/settings.dart';
import 'package:tutorial/chaps/timerContent/timermodel.dart';

//Local files
import 'package:tutorial/commonwidgets/timerWidget.dart';
import 'package:tutorial/chaps/timerContent/timer.dart';

class ProductivityTimer extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final List<PopupMenuItem<String>> menuItems = [];
    menuItems.add(PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Timer'),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return menuItems.toList();
            },
            onSelected: (s) {
              if (s == 'Settings') {
                goToSettings(context);
              }
            },
          )
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final double availableWidth = constraints.maxWidth;
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Work',
                      onPressed: () => timer.startWork(),
                      size: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff607D8B),
                      text: 'Short Break',
                      onPressed: () => timer.startBreake(true),
                      size: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff455A64),
                      text: 'Long Break',
                      onPressed: () => timer.startBreake(false),
                      size: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ],
            ),
            Expanded(
                child: StreamBuilder(
                    initialData: TimerModel('00:00', 1),
                    stream: timer.stream(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      TimerModel timer = snapshot.data;
                      return Container(
                          child: CircularPercentIndicator(
                        radius: availableWidth / 2,
                        lineWidth: 10.0,
                        percent: timer.percent,
                        center: Text(timer.time,
                            style: Theme.of(context).textTheme.headline4),
                        progressColor: Color(0xff009688),
                      ));
                    })),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff212121),
                      text: 'Stop',
                      onPressed: () => timer.stopTimer(),
                      size: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
                Expanded(
                  child: ProductivityButton(
                      color: Color(0xff009688),
                      text: 'Restart',
                      onPressed: () => timer.startTimer(),
                      size: 100),
                ),
                Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  void emptyMethod() {}
  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }
}
