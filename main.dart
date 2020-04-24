import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //main purpose is to show other smaller builds
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

//stateful widgets maintain state that might change over the course of the app-
//they're immutable and finalized

class RandomWordsState extends State<RandomWords> {
  //the override annotation marks an instance member as overriding a superclass-
  //with the same name (informs the complier to override an element declared in the-
  //super class which in our case is MyApp)

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0); //fontsize
  @override
  //build method
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  //build suggestions widget
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //the itembuilder call back per suggested word pairing and places each-
        //suggestion into a ListTile row
        itemBuilder: /*1*/ (context, i) {
          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  //adding the build row widget
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

//all this does is create the state class (nothing more)
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
