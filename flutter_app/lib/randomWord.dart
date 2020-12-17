import 'package:english_words/english_words.dart';
import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';


class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsPair();
  }
}

class RandomWordsPair extends State<RandomWords>{
  final wordPairArr = <WordPair>[];
  final Set<WordPair> saved = new Set<WordPair>();
  final font = TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final wordsPair = WordPair.random();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("the second page"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: getList(),
    );
  }

  Widget getList(){
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context,i){
        if(i.isOdd)
          return Divider();
        final index = i ~/ 2;
        if(i >= wordPairArr.length){
          wordPairArr.addAll(prefix0.generateWordPairs().take(10));
        }
        return getRow(wordPairArr[i]);
      },
    );
  }

  Widget getRow(WordPair wordPair) {
    final bool alreadySaved = saved.contains(wordPair);
    return ListTile(
      title: Text(
          wordPair.asCamelCase,
          style: font,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color : alreadySaved ? Colors.lightBlue : null
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            saved.remove(wordPair);
          }else{
            saved.add(wordPair);
          }
        });
      },
    );
  }
  void pushSaved(){
    Navigator.of(context).push(
        new MaterialPageRoute<void>(
            // ignore: missing_return
            builder: (BuildContext context){
              final Iterable<ListTile> tiles = saved.map(
                  (WordPair pair){
                    return new ListTile(
                      title: new Text(
                        pair.asCamelCase,
                        style: font,
                      ),
                    );
                  },
              );
              final List<Widget> diveded = ListTile
              .divideTiles(
                  context: context,
                  tiles: tiles,
              ).toList();
              return new Scaffold(
                appBar: new AppBar(
                  title: const Text("saved items"),
                ),
                body: new ListView(children: diveded),
              );
            },
        ),
    );
  }
}