import 'package:flutter/material.dart';
import 'custom_action_button.dart';
import 'custom_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _allowResize = true;
  bool _allowChangePrimerColor = true;
  double _iconSize = 100;
  Color _iconColor = Colors.blue;
  double _redValue = 255;
  double _greenValue = 255;
  double _blueValue = 255;

  void _updateIconColor() {
    setState(() {
      _iconColor = Color.fromRGBO(
          _redValue.toInt(), _greenValue.toInt(), _blueValue.toInt(), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Icon'),
        actions: _allowResize
            ? <Widget>[
                CustomActionButton(
                  icon: Icons.looks_one,
                  onPressed: () => setState(() => _iconSize = 100),
                  size: 24.0,
                ),
                CustomActionButton(
                  icon: Icons.looks_two,
                  onPressed: () => setState(() => _iconSize = 200),
                  size: 48.0,
                ),
                CustomActionButton(
                  icon: Icons.looks_3,
                  onPressed: () => setState(() => _iconSize = 300),
                  size: 72.0,
                ),
                CustomActionButton(
                  icon: Icons.remove,
                  onPressed: () => setState(() {
                    _iconSize = (_iconSize - 50).clamp(50, 300).toDouble();
                  }),
                  size: 24.0,
                ),
                CustomActionButton(
                  icon: Icons.add,
                  onPressed: () => setState(() {
                    _iconSize = (_iconSize + 50).clamp(50, 300).toDouble();
                  }),
                  size: 24.0,
                ),
              ]
            : <Widget>[],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Icon(
                Icons.alarm,
                size: _iconSize,
                color: _iconColor,
              ),
            ),
          ),
          if (_allowChangePrimerColor) ...[
            CustomSlider(
              value: _redValue,
              onChanged: (value) {
                setState(() {
                  _redValue = value;
                  _updateIconColor();
                });
              },
              color: Colors.red,
            ),
            CustomSlider(
              value: _greenValue,
              onChanged: (value) {
                setState(() {
                  _greenValue = value;
                  _updateIconColor();
                });
              },
              color: Colors.green,
            ),
            CustomSlider(
              value: _blueValue,
              onChanged: (value) {
                setState(() {
                  _blueValue = value;
                  _updateIconColor();
                });
              },
              color: Colors.blue,
            ),
          ]
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Settings'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            CheckboxListTile(
              title: Text('Allow resize?'),
              value: _allowResize,
              onChanged: (bool? value) {
                setState(() {
                  _allowResize = value ?? _allowResize;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Allow change primer color?'),
              value: _allowChangePrimerColor,
              onChanged: (bool? value) {
                setState(() {
                  _allowChangePrimerColor = value ?? _allowChangePrimerColor;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
