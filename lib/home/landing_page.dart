import 'package:flutter/material.dart';
import './quotes_page.dart';

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/images/home.jpeg"),
              fit: BoxFit.cover,

          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Inspire Me",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'
                  ),),
              new Icon(Icons.arrow_downward, size: 30.0, color: Colors.white,),
              new Text("Get Started",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Momtserrat'
                  ),),
              new Padding(padding: const EdgeInsets.only(bottom: 30.0),
              ),
              new MaterialButton(
                  height: 50.0,
                  minWidth: 150.0,
                  color: Colors.yellow,
                  child: new Stack(
                    children: <Widget>[
                      new Icon(Icons.arrow_forward_ios, size: 35.0, color: Colors.black,),
//                      new Text("Get Started",
//                          style: new TextStyle(
//                            color: Colors.black54,
//                            fontSize: 10.0,
//                            fontFamily: 'Montserrat'
//                          ),)
                    ],
                  ) ,
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuotesPage())),
                  splashColor: Colors.redAccent,
              )
              

            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text("Powered By FutureLabs",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat'
                  ),),
            ],
          )
        ],

      ),

    );


  }
}