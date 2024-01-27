import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: cal(),
    );
  }
}

class cal extends StatefulWidget {
  const cal({super.key});

  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {
  var _num = '0';
  var _operation = '';
  var _count = 0;

  Widget appBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calculate,
            color: Colors.brown,
          ),
          Text(
            '  MY CALCULATOR',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget calculate() {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _num,
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget button({
    required String txt,
    required Color c,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _count = 0;
          if (txt != 0) {
            if (_num == '0') {
              _num = _num.replaceRange(0, 1, txt);
            } else {
              _num = _num + txt;
            }
            if (txt == 'C' || txt == '=') {
              _count = 0;
              _num = '0';
            }
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(color: c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: GoogleFonts.poppins(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget icon({required IconData icon, required Color c}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_num.length > 1) {
            _num = _num.substring(0, _num.length - 1);
          } else {
            _num = '0';
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(color: c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget operator({
    required String txt,
    required Color c,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          var lastchar = _num[_num.length - 1];
          
          if (_num.length > 1) {
            _operation = txt;
            _count++;
            if (lastchar == '%' ||
              lastchar == '+' ||
              lastchar == '-' ||
              lastchar == 'x') {
            _num = _num.substring(0, _num.length - 1) + _operation;
          }else {
              _num = _num + txt;
            }
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(color: c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: GoogleFonts.poppins(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Container(
          child: Column(
            children: [
              appBar(),
              calculate(),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: button(txt: 'C', c: Colors.grey)),
                  Expanded(child: icon(icon: Icons.backspace, c: Colors.grey)),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: button(txt: '7', c: Colors.orange)),
                  Expanded(child: button(txt: '8', c: Colors.orange)),
                  Expanded(child: button(txt: '9', c: Colors.orange)),
                  Expanded(child: operator(txt: '%', c: Colors.grey)),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: button(txt: '4', c: Colors.orange)),
                  Expanded(child: button(txt: '5', c: Colors.orange)),
                  Expanded(child: button(txt: '6', c: Colors.orange)),
                  Expanded(child: operator(txt: 'x', c: Colors.grey)),
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: button(txt: '1', c: Colors.orange)),
                  Expanded(child: button(txt: '2', c: Colors.orange)),
                  Expanded(child: button(txt: '3', c: Colors.orange)),
                  Expanded(child: operator(txt: '-', c: Colors.grey)),
                ],
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: button(txt: '0', c: Colors.orange),
                    ),
                    Expanded(
                      flex: 1,
                      child: operator(txt: '+', c: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: button(txt: '=', c: Colors.deepOrangeAccent))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
