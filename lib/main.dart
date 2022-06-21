// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
));

// ignore: use_key_in_widget_constructors
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();

}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String btnVal){
    // ignore: avoid_print
    print(btnVal,);
    if(btnVal == "C"){
       _out = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    }else if(btnVal == "+" || btnVal == "-" || btnVal =="*" || btnVal == "/"){
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    }else if(btnVal == "."){
      if(_out.contains(".")){
        // ignore: avoid_print
        print("Already exist");
        return;
      }else{
        _out = _out + btnVal;
      }
    }else if(btnVal == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _out = (num2 + num1).toString();

      }
      if(operand == "-"){
        _out = (num1 - num2).toString();

      }
      if(operand == "*"){
        _out = (num2 * num1).toString();

      }
      if(operand == "/"){
        _out = (num1 / num2).toString();

      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    }else{
      _out = _out+ btnVal;
    }
    
      setState(() {
        try{
          output = double.parse(_out).toStringAsFixed(2);
        }
      
       catch(e){
      // ignore: avoid_print
      print (e);

    }
  });

    
   

    
  }

  // ignore: non_constant_identifier_names
  Widget buildButton(String ButtonVal){
    // ignore: unnecessary_new
    return new Expanded(
        child: Container(
          
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(0.0),
          // ignore: prefer_const_constructors
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.red[300],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2.0,2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0
              ),
              // ignore: prefer_const_constructors
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0,-2.0),
                  blurRadius: 8.0,
                  spreadRadius: 1.0
              ),
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.all(30.0),
            child: Text(ButtonVal, style: TextStyle(
              fontSize: 22.0
            ),),
            onPressed: ()=>
              buttonPressed(ButtonVal)
            ,
          ),
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal:12.0,vertical: 50.0),
                  child: Text(output, style: TextStyle(
                    fontSize: 60.0
                  ),)
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("C"),
                      
                      buildButton("*")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}