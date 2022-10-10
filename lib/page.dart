import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;
  late String code;
  @override
  Widget build(BuildContext context) {
    int red = _redValue.toInt();
    int green = _greenValue.toInt();
    int blue = _blueValue.toInt();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                code = "($red,$green,$blue)";
                Clipboard.setData(ClipboardData(text: code)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("RGB code copied to clipboard")));
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(red, green, blue, 1),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$red , $green , $blue",
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              child: Column(
                children: [
                  Slider(
                      activeColor: Colors.redAccent,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _redValue.toString(),
                      value: _redValue,
                      onChanged: ((value) {
                        setState(() {
                          _redValue = value;
                        });
                      })),
                  Slider(
                      activeColor: Colors.greenAccent,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _greenValue.toString(),
                      value: _greenValue,
                      onChanged: ((value) {
                        setState(() {
                          _greenValue = value;
                        });
                      })),
                  Slider(
                      activeColor: Colors.blueAccent,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      label: _blueValue.toString(),
                      value: _blueValue,
                      onChanged: ((value) {
                        setState(() {
                          _blueValue = value;
                        });
                      })),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
