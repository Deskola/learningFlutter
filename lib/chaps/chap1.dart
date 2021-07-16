import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "iPay",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Builder(builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Hello World Travel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Discover the World',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                        )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.network(
                        'https://picsum.photos/200',
                        height: 200,
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.all(15),
                        child: RaisedButton(
                        child: Text('Contact'),
                        onPressed: () => contactUs(context),
                      ),
                    ),
                    
                  ]
                ),
              )
              
            )
          )
       ),
      ),
          
    );
  }

  void contactUs(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hello@worl.com'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
  
}

