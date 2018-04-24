import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class QuotesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Inspirational Quotes',
      home: new RandomQuotes(),
    );
  }
}

class RandomQuotes extends StatefulWidget{
  @override
  createState() => new RandomQuotesState();
}

class RandomQuotesState extends State<RandomQuotes>{

  var _randomQuote = 'Click More To Read Inspirational Quotes';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Inspirational Quotes',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0
                ),),
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/images/quotes.jpeg"),
              fit: BoxFit.cover,
          ),
          new ListView(
            children: <Widget>[
              new Center(
                child: new Padding(
                  padding: new EdgeInsets.all(70.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(_randomQuote,
                        style: new TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Germania'
                        ),),
                      new Padding(
                        padding: new EdgeInsets.all(100.0),
                      ),
                      new MaterialButton(
                        height: 40.0,
                        minWidth: 200.0,
                        color: Colors.red,
                        textColor: Colors.white,
                        child: new Stack(
                          children: <Widget>[
                            new Text("More",
                              style: new TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Poopins',
                                fontWeight: FontWeight.w600,
                              ),),

                          ],
                        ),
                        onPressed: _getRandomQuote,
                        splashColor: Colors.redAccent,

                      )

                    ],
                  ),),

              )
            ],
          )

        ],
      )

      );

  }


  _getRandomQuote() async{

    var url = 'https://us-central1-tested-201415.cloudfunctions.net/getrandomquote-function';
    var httpClient = new HttpClient();

    String result;
    try{
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['quote'] + "\n\n-- " + data['person'];
      } else {
        result =
        'Error getting a random quote:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Check Internet Connection.If Off Please Turn On.';
    }
    if (!mounted) return;

    setState(() {
      _randomQuote = result;
    });


    }
}