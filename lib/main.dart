import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'colucter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'colucter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result='0';
   String finalResult='0';
   double num1=0.0;
   double num2=0.0;
  String dor='';
  onprseedbtn(String btnval){
    if(btnval=='AC'){
      finalResult='0';
      num1=0.0;
       num2=0.0;
       dor='';
    }else if(btnval=='+'||btnval=='-'||btnval=='x'||btnval=='/'){
   num1=double.parse( result);
   dor=btnval;
   finalResult='0';
   result=result+btnval;

    }else if(btnval =='=')
    {
      num2=double.parse(result);
      if(dor=='-'){
        finalResult=(num1-num2).toString();
      }
      if(dor=='x'){
        finalResult=(num1*num2).toString();
      }
      if(dor=='/'){
        finalResult=(num1/num2).toString();
      }
      if(dor=='+'){
        finalResult=(num1+num2).toString();
      }
    }
    else if(btnval=='.'){
      if(finalResult.contains('.')){

      }else{
        finalResult=finalResult+btnval;

      }

    }else if(btnval=='%'){
num2=double.parse(result);
finalResult=(num2/100).toString();


    }
    else if(btnval== '+/-'){
      if(result.toString().contains('-')){
        result.toString().substring(1);
        finalResult=result;
      }else{
result='-'+result;
finalResult=result;
      }


    }else{
      finalResult= dor+btnval;

    }
    setState(() {
      result =double.parse(finalResult).toString();
    });
  }

  Bottonbar(String txt, Color background, Color textcolor) {
   if(txt !='0'){
     return Container(
       child: RaisedButton(
         onPressed: () {
           onprseedbtn(txt);
         },
         child: Text(txt,
           style: TextStyle(
             color: textcolor,
             fontSize: 35,
           ),
         ),
         color: background,
         shape: CircleBorder(),
         padding: EdgeInsets.all(10),
       ),
     );
   }else{
     return Container(
       child: RaisedButton(
         onPressed: () {
           onprseedbtn(txt);
         },
         child: Text(txt,
           style: TextStyle(
             color: textcolor,
             fontSize: 35,
           ),
         ),
         color: background,
         shape: StadiumBorder(),
         padding: EdgeInsets.only(top: 10,right:150 ,bottom: 10,left: 20),
       ),
     );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:
      Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: [
              Text(
                '$finalResult',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline2,
              ),
            ],
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bottonbar('AC', Colors.black, Colors.white),
              Bottonbar('+/-', Colors.black, Colors.white),
              Bottonbar('%', Colors.black, Colors.white),
              Bottonbar('/', Colors.white, Colors.black),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bottonbar('7', Colors.black, Colors.white),
              Bottonbar('8', Colors.black, Colors.white),
              Bottonbar('9', Colors.black, Colors.white),
              Bottonbar('x', Colors.white, Colors.black),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bottonbar('4', Colors.black, Colors.white),
              Bottonbar('5', Colors.black, Colors.white),
              Bottonbar('6', Colors.black, Colors.white),
              Bottonbar('-', Colors.white, Colors.black),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bottonbar('3', Colors.black, Colors.white),
              Bottonbar('2', Colors.black, Colors.white),
              Bottonbar('1', Colors.black, Colors.white),
              Bottonbar('+', Colors.white, Colors.black),
            ],
          ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Bottonbar('0', Colors.black, Colors.white),
    Bottonbar('.', Colors.black, Colors.white),
    Bottonbar('=', Colors.white, Colors.black),

    ],),
        ],
      ),
    );
  }
}

