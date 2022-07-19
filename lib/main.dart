import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(create: (context)=>CounterProvider(),
      child:MyHomePage(title: '',) ,
      ),
    )
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
     var provider =Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              provider.count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed:(){
               provider.reset();
            }, child: Text('Reset'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          provider.increment();
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

    );
  }
}


class CounterProvider extends ChangeNotifier{
  int count=0;
  void increment(){
    count +=1;
    notifyListeners();
  }

  void reset(){
    count=0;
    notifyListeners();
  }
}