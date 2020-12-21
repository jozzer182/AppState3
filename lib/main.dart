import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier {
  bool a = false, b = false, c = false;
  void cerebro({bool av, bool bv}) {
    a = av ?? a;
    b = bv ?? b;
    c = a | b;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Counter>(
                  builder: (context, counter, child) => CupertinoSwitch(
                    value: counter.a,
                    onChanged: (bool value) {
                      var counter = context.read<Counter>();
                      counter.cerebro(av: value);
                    },
                  ),
                ),
                Text("OR"),
                Consumer<Counter>(
                  builder: (context, counter, child) => CupertinoSwitch(
                    value: counter.b,
                    onChanged: (bool value) {
                      var counter = context.read<Counter>();
                      counter.cerebro(bv: value);
                    },
                  ),
                ),
                Text("="),
                Consumer<Counter>(
                  builder: (context, counter, child) => CupertinoSwitch(
                    value: counter.c,
                    onChanged: (bool value) {
                    },
                  ),
                ),
                RaisedButton(
                  child: Text("ir a la pantalla azul"),
                  onPressed: (){
                    Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context){return Pantalla2();})
                     );
                  },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  const Pantalla2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}