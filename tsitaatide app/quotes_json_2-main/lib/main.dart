import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './quotes.dart';

void main() {
  runApp(QuotesApp());
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  _QuotesAppState createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  late String _text;
  late String _author;

  @override
  void initState() {
    super.initState();
    _setQuote();
  }

  void _setQuote() {
    final int randomNumber = Random().nextInt(quotes.length);
    setState(() {
      _text = quotes[randomNumber]['Tsitaat']!;
      _author = quotes[randomNumber]['Autor']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _author,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lobster(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              TextButton(
                onPressed: _setQuote,
                child: Image.asset(
                  'assets/next.png',
                  width: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
