import 'package:flutter/material.dart';
import 'package:fluttercon_stripe/alert.dart';
import 'package:fluttercon_stripe/payment_element.dart';
import 'package:js/js.dart';

import 'dart:html' as html;

///import 'example.dart';

void main() {
 
  ///  createAlert('Welcome to FlutterCon! $url');
  // 2. html.window.alert('Welcome to FlutterCon! ${html.window.location.}');
  // 3. alert(window.location.href);
  // 4. welcomeUser(User(id: 'id', email: 'email'));

  /// 5.a callback = allowInterop(() => print('User on boarded'));
  /// 5.b  welcomeUser(User(id: 'id', email: 'email'));
  runApp(const MyApp());
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(48.0),
        alignment: Alignment.center,
        child: const PaymentElement(),
      ),
    );
  }
}
