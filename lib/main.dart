import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/counter_bloc.dart';
import 'package:flutter_web/counter_event.dart';
import 'package:flutter_web/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text("Counter")),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Center(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    icon: Icon(Icons.remove)),
                Text('${state.value}'),
                IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// class CounterPage extends StatefulWidget {
//   @override
//   _CounterPageState createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   late CounterBloc _counterBloc;

//   @override
//   void initState() {
//     super.initState();
//     _counterBloc = CounterBloc();
//   }

//   @override
//   void dispose() {
//     _counterBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _counterBloc,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Counter App'),
//         ),
//         body: BlocBuilder<CounterBloc, CounterState>(
//           builder: (context, state) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Counter Value:',
//                   ),
//                   Text(
//                     '${state.value}',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         floatingActionButton: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//               onPressed: () =>
//                   context.read<CounterBloc>().add(IncrementEvent()),
//               tooltip: 'Increment',
//               child: Icon(Icons.add),
//             ),
//             SizedBox(height: 10),
//             FloatingActionButton(
//               onPressed: () =>
//                   context.read<CounterBloc>().add(DecrementEvent()),
//               tooltip: 'Decrement',
//               child: Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
