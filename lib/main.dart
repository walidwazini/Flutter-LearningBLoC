import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:learning_bloc/BLoC/BLoC_Counter.dart';


import './Cubit/counter_cubit.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'BLoC Arena'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            BlocConsumer<CounterCubit, CounterState>(
              listener:(context, state) {
                if (state.wasIncremented == true){
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Incremented'), duration: Duration(milliseconds: 300),)
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Decremented'), duration: Duration(milliseconds: 300),)
                  );
                }
              } ,
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text('WOahh, NEGATIVE VALUE ${state.counterValue
                      .toString()} ');
                }  else if (state.counterValue % 2 == 0) {
                  return Text(
                    'Yeay! ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else
                return Text(state.counterValue.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              },
            ),
            SizedBox(height: 23,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                //tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                //tooltip: 'Increment',
                child: Icon(Icons.add),
              )
            ],)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
