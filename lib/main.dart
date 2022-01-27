import 'package:flutter/material.dart';
import 'package:productivity_timer/timermodel.dart';
import 'package:productivity_timer/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './timer.dart';
import './timermodel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import './widgets.dart';
import './settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer By {<^Golf^>}',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerHomepage(),
    );
  }
}

class TimerHomepage extends StatelessWidget{
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {

    //final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    final List<PopupMenuItem<String>> menuItems = <PopupMenuItem<String>>[];
    menuItems.add(PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));

    timer.startWork();

    return Scaffold(
        appBar: AppBar(
          title: Text('My Work Timer By #{<^Golf^>}#'),
            actions: [
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return menuItems.toList();
                  },
                onSelected: (s) {
                  if(s=='Settings') {
                    goToSettings(context);
                  }
                },
                ),
            ],
        ),


        body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
    final double availableWidth = constraints.maxWidth;
    return Column(children: [
    Row (
    children: [
    Padding(padding: EdgeInsets.all(defaultPadding),),
    Expanded(child: ProductivityButton(color: Color(0xff009688),
    text: "Work", onPressed: () => timer.startWork(),
      //onPressed: emptyMethod,
      size: 8.0,)),
      Padding(padding: EdgeInsets.all(defaultPadding),),

    Padding(padding: EdgeInsets.all(defaultPadding),),
    Expanded(child: ProductivityButton(color: Color(0xff607D8B),
    text: "Short Break",onPressed: () => timer.startBreak(true),
      //onPressed: emptyMethod,
      size: 8.0,)),
      Padding(padding: EdgeInsets.all(defaultPadding),),

    Padding(padding: EdgeInsets.all(defaultPadding),),
    Expanded(child: ProductivityButton(color: Color(0xff455A64),
    text: "Long Break",onPressed: () => timer.startBreak(false),
      //onPressed: emptyMethod,
      size: 8.0,)),
      Padding(padding: EdgeInsets.all(defaultPadding),),
    ],
    ),



      Expanded(
        child: StreamBuilder(
        initialData: '00:00',
          //initialData: TimerModel('00:00', 1),
        stream: timer.stream(),
        builder: (BuildContext context, AsyncSnapshot snapshot){

          TimerModel timer = (snapshot.data == '00:00') ? TimerModel('00:00', 1):
              snapshot.data;
          //TimerModel timer = snapshot.data;
          return Expanded(child: CircularPercentIndicator(
            radius: availableWidth / 2,
            lineWidth: 10.0,
            percent: timer.percent,
            center: Text(timer.time,
                style: Theme.of(context).textTheme.headline4),
            progressColor: Color(0xff009688),
          ));
        },)),

    Expanded(child: Text("Hello_{สวัสดี ณัฐพัชร์ จิรธนาธิษณ์_<(^Golf^)>}")),

    Row (
    children: [
    Padding(padding: EdgeInsets.all(defaultPadding),),
    Expanded(child: ProductivityButton(color: Color(0xff212121),
    text: "Stop",onPressed: () => timer.stopTimer(),
      //onPressed: emptyMethod,
          size: 8.0,)),

    Padding(padding: EdgeInsets.all(defaultPadding),),
    Expanded(child: ProductivityButton(color: Color(0xff009688),
    text: "Restart",onPressed: () => timer.startTimer(),
      //onPressed: emptyMethod,
          size: 8.0,)),

    Padding(padding: EdgeInsets.all(defaultPadding),),
    ],
    ),
    ],);
    })
    );
  }

  void emptyMethod() {}

  void goToSettings(BuildContext context) {
    //print('in gotoSettings');
    Navigator.push(
        //context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }
}


