import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTimeRange selectedDates = DateTimeRange(start: DateTime.now(), end: DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${selectedDates.duration.inDays}'),
          ElevatedButton(onPressed: () async {
            final DateTimeRange? datetimerange = await showDateRangePicker(context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000));
            if(datetimerange != null){
              setState(() {
                selectedDates = datetimerange;
              });
            }
          }, child: Text('Choose Dates'))
        ],
      ),),
    );
  }
}

