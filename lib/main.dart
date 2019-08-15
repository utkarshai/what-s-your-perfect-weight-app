import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "weight checker",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _gender =
      new TextEditingController(); // var _weight= new Tex...... wont work
  double inches = 0.0;
  double result = 0.0;
  double result1 = 0.0;
  double result2 = 0.0;
  var flag = 1;

  //var weight = new TextEditingController();
  void _calculate() {
    setState(() {
      // here set state is a key word remember
      int age = int.parse(_age.text);
      double height = double.parse(_height.text);
      inches = height * 12;
      String gender = (_gender.text);
      if ((_age.text.isNotEmpty || age > 0) &&
          (_height.text.isNotEmpty || height > 0) &&
          (_gender.text.isNotEmpty || gender.isNotEmpty)) {
        result1 = ((18.5 * inches * inches) / 703) *
            0.453592; //0.453592 to convert into kgs 1lbs=0.453592 kg
        result2 = ((24.9 * inches * inches) / 703) * 0.453592;
        result1 = num.parse(result1.toStringAsFixed(2));
        result2 = num.parse(result2.toStringAsFixed(2));

        //0.453592 to convert into kgs 1lbs=0.453592 kg
        if (height < 5.0) {
          flag = 0;
        } else if (gender == "male") {
          result = 48.0 + (height - 5.0) * 10 * 2.7;
        } else if (gender == "female") {
          result = 45.5 + (height - 5.0) * 10 * 2.2;
        }
      } else {
        result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("are you perfect, let's check"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Container(
          child: new ListView(
            children: <Widget>[
              new Image.network(
                'https://pbs.twimg.com/profile_images/3612413947/f4cc9b9ea6b260f418ed37e0155fd88f.jpeg',
                width: 90.0,
                height: 90.0,
              ),
              new Container(
                color: Colors.amber,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_outline),
                        fillColor: Colors.yellowAccent,
                        labelText: "age",
                      ),
                    ),
                    new TextField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_alarm),
                        fillColor: Colors.yellowAccent,
                        labelText: "height in feet",
                      ),
                    ),
                    new TextField(
                      controller: _gender,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        icon: Icon(Icons.subject),
                        fillColor: Colors.yellowAccent,
                        labelText: "male or female",
                      ),
                    ),
                    // new Padding (padding: EdgeInsets.all(19.0),),//EdgeInsets.all(19.0),
                    new Container(
                      padding: EdgeInsets.all(19.0),
                      child: new RaisedButton(
                        elevation: 4.0,
                        onPressed: _calculate, //()=>debugPrint("hello!"),
                        color: Colors.redAccent,
                        child: new Text("calculate"),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.9)),
              new Column(
                children: <Widget>[
                  flag == 0
                      ? Container()
                      : Text(
                          "your perfect weight should be $result",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "weight should be in range of $result1 and $result2",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
