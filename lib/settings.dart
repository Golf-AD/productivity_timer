//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets.dart';
//import 'timer.dart';
//import 'timermodel.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Settings By <^Golf^>'),),
      /*body: Container(
        child: Text('Hello World By Golf'),*/
      body: Settings(),
    );

  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  //TextEditingController txtWork;
  //TextEditingController txtShort;
  //TextEditingController txtLong;

  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;
  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";


  //int workTime;
  //int shortBreak;
  //int longBreak;

  late int workTime;
  late int shortBreak;
  late int longBreak;
  //SharedPreferences prefs;
  late SharedPreferences prefs;
  //double get buttonSize => null!;
  //late double buttonSize;

  @override
  void initState() {
    TextEditingController txtWork = TextEditingController();
    TextEditingController txtShort = TextEditingController();
    TextEditingController txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    TextStyle textStyle = TextStyle(fontSize: 24);
    //late double buttonSize;
    return Container(
      child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            Text("Work", style: textStyle),
            Text(""),
            Text(""),
            //SettingsButton(Color(0xff455A64), "-", -1, WORKTIME, updateSetting),
            //SettingsButton(Color(0xff455A64), "-", -1),
            //SettingsButton(Color(0x64ff455a), "-", buttonSize, -1, WORKTIME, updateSetting),
            SettingsButton(Color(0x64ff455a), "-", 8.0, -1, WORKTIME, updateSetting),
            TextField(
                style: textStyle,
                controller: txtWork,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number),
            //SettingsButton(Color(0xff009688), "+", 1, WORKTIME, updateSetting),
            //SettingsButton(Color(0xff009688), "+", 1),
            //SettingsButton(Color(0xff009688), "+", buttonSize, 1, WORKTIME, updateSetting),
            SettingsButton(Color(0xff009688), "+", 8.0, 1, WORKTIME, updateSetting),
            Text("Short", style: textStyle),
            Text(""),
            Text(""),
            //SettingsButton(Color(0xff455A64), "-", -1, SHORTBREAK, updateSetting),
            //SettingsButton(Color(0xff455A64), "-", -1),
            //SettingsButton(Color(0xff455A64), "-", buttonSize, -1, SHORTBREAK, updateSetting),
            SettingsButton(Color(0xff455A64), "-", 8.0, -1, SHORTBREAK, updateSetting),
            TextField(
                style: textStyle,
                textAlign: TextAlign.center,
                controller: txtShort,
                keyboardType: TextInputType.number),
            //SettingsButton(Color(0xff009688), "+", 1, SHORTBREAK, updateSetting),
            //SettingsButton(Color(0xff009688), "+", 1),
            //SettingsButton(Color(0xff009688), "+", buttonSize, 1, SHORTBREAK, updateSetting),
            SettingsButton(Color(0xff009688), "+", 8.0, 1, SHORTBREAK, updateSetting),
            Text(
              "Long", style: textStyle),
            Text(""),
            Text(""),
            //SettingsButton( Color(0xff455A64), "-",-1, LONGBREAK, updateSetting),
            //SettingsButton( Color(0xff455A64), "-",-1),
            //SettingsButton(Color(0xff455A64), "-", buttonSize, -1, LONGBREAK, updateSetting),
            SettingsButton(Color(0xff455A64), "-", 8.0, -1, LONGBREAK, updateSetting),
            TextField(
                style: textStyle,
                textAlign: TextAlign.center,
                controller: txtLong,
                keyboardType: TextInputType.number),
            //SettingsButton(Color(0xff009688), "+", 1, LONGBREAK, updateSetting),
            //SettingsButton(Color(0xff009688), "+", 1),
            //SettingsButton(Color(0xff009688), "+", buttonSize, 1, LONGBREAK, updateSetting),
            SettingsButton(Color(0xff009688), "+", 8.0, 1, LONGBREAK, updateSetting),
          ],
          padding: const EdgeInsets.all(20.0),
      ),
    );
  }

  //Read Value
  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    //int workTime = prefs.getInt(WORKTIME);
    int? workTime = prefs.getInt(WORKTIME);
    if (workTime==null) {
      await prefs.setInt(WORKTIME, int.parse('30'));
    }
    //int shortBreak = prefs.getInt(SHORTBREAK);
    int? shortBreak = prefs.getInt(SHORTBREAK);
    if (shortBreak==null) {
      await prefs.setInt(SHORTBREAK, int.parse('5'));
    }
    //int longBreak = prefs.getInt(LONGBREAK);
    int? longBreak = prefs.getInt(LONGBREAK);
    if (longBreak==null) {
      await prefs.setInt(LONGBREAK, int.parse('20'));
    }
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  //Write Value which user updated value
  void updateSetting(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          //int workTime = prefs.getInt(WORKTIME);
          workTime = prefs.getInt(WORKTIME)!;
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;
      case SHORTBREAK:
        {
          //int short = prefs.getInt(SHORTBREAK);
          int short = prefs.getInt(SHORTBREAK)!;
          short += value;
          if (short >= 1 && short <= 120) {
            prefs.setInt(SHORTBREAK, short);
            setState(() {
              txtShort.text = short.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          //int long = prefs.getInt(LONGBREAK);
          int long = prefs.getInt(LONGBREAK)!;
          long += value;
          if (long >= 1 && long <= 180) {
            prefs.setInt(LONGBREAK, long);
            setState(() {
              txtLong.text = long.toString();
            });
          }
        }
        break;
    }
  }
 /*
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>('txtWork', txtWork));
  }*/

}

