import 'dart:async';
import 'package:flutter/material.dart';

class ExampleStream extends StatefulWidget {
  const ExampleStream({Key? key}) : super(key: key);

  @override
  _ExampleStreamState createState() => _ExampleStreamState();
}

class _ExampleStreamState extends State<ExampleStream> {
  int count = 0;
  StreamController _streamController = new StreamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Stream'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          initialData: count,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Text(count.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {_streamController.add(count++)},
      ),
    );
  }
}
