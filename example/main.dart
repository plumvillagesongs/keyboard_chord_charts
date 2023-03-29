import 'package:chord/chord.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_chord_charts/keyboard_chord_charts.dart';
// Create a [Chord] object
String chord_str = "G7";
Chord chord = Chord(chord_str);

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(chord_str: "G"),
    ),
  );
}
class MyHomePage extends StatefulWidget {
  final String chord_str;

  const MyHomePage({
    required this.chord_str,
  });

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  late String _chord_str;

  @override
  void initState() {
    super.initState();
    _chord_str = widget.chord_str;
  }

  @override
  Widget build(BuildContext context) {
    //print('rebuild MyHomePage');
    return Scaffold(
      appBar: AppBar(
      title: const Text('Keyboard Chord Charts Example'),
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
      const Spacer(),

      TextField(
        onSubmitted: (String value){
        setState(() {
          chord_str = value;
          chord = Chord(chord_str);
        });
      }
      ),
      //displaying input text
      Text(chord_str),
      const SizedBox(height: 24),
      KeyboardChordChart.fromNoteIndexes(
        chord.getPitches(),
        highlightColor: Colors.blue,
        defaultColor: Colors.indigo,
        pitchNotes: chord.pitchNotes().join(' - ') ?? '',
      ),
      ]),
      ),
      );
  }

  void onFloatingButtonClicked() {
    setState(() {
      _chord_str = chord_str;
    });
  }
}
