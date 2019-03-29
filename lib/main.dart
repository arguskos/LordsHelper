import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello/heroes.dart';
import 'package:hello/player.dart';
import 'package:hello/game.dart';



void main() => runApp(MyApp());



class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<WordPair>();   // Add this line.
  final _heroes = <BaseHero>[
    new Archer(),
    new Wizzard()
  ];


  @override
  Widget build(BuildContext context) {

    
      return Scaffold(
    appBar: AppBar(
      title: Text('Startup Name Generator'),
    ),
    body: _buildPlayers(), 
    //_buildSuggestions(),
  );
  }



  Widget _buildHero(BaseHero hero)
  {
  
    return   hero;
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);  // Add this line.
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(   // Add the lines from here... 
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),   
      onTap: () {      // Add 9 lines from here...
        setState(() 
          {
            if (alreadySaved) 
            {
              _saved.remove(pair);
            }
            else
            { 
              _saved.add(pair); 
            } 
          }
        );
    },    
    );
  }

  Widget _buildHeroes()
  {
    return ListView.builder(
      itemCount:  _heroes.length,
      itemBuilder: (context, i ) {
          return _buildHero(_heroes[i]);
        });
  }

  Widget _buildPlayer()
  {
   return new Player();
  }

  Widget _buildPlayers()
  {
    //return _buildPlayer();
    return Row(children: <Widget>[
      Expanded(child: _buildPlayer()),
      Expanded(child: _buildPlayer()),
    //  Expanded(child: _buildPlayer())

    ],
    );
  }

  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class LordsHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Title',
      home: Game( RandomWords()),
    );
    // return MaterialApp(
    //   title: 'LOl',
    //   home: RandomWords(),
    // );
}
}