import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
var wtControler = TextEditingController();
var ftConroler = TextEditingController();
var inControler = TextEditingController();
var wtResult = "";

var bgColor = Colors.blue.shade100;

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI Calculator", style: TextStyle(fontSize: 30),),
                SizedBox(height: 30,),
                TextField(
                  controller: wtControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your weight'),
                    hintText: 'Wight in KG',
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ftConroler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your Height in Feet'),
                    hintText: 'Height (Feet)',
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your Height in Inch'),
                    hintText: 'Height (Inch)',
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){

                      var wt = wtControler.text.toString();
                      var ft = ftConroler.text.toString();
                      var inch = inControler.text.toString();

                      if (wt!="" && ft!="" && inch!=""){

                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch =int.parse(inch);

                        var ttlInch = (iFt*12) + iInch; // Converted ft to Inch
                        var ttlCm = ttlInch*2.54; // Converted Inch to CM
                        var ttlMeter = ttlCm/100; // Converted CM to Meter

                        var bmi = iWt/(ttlMeter*ttlMeter);
                        var msg="";

                        if (bmi>25){
                        msg = "You are over weight &";
                        bgColor = Colors.orange.shade300;
                        }else if (bmi<18){
                          msg = "You are Under weight &";
                          bgColor = Colors.red.shade300;
                        }else {
                          msg = "You are Healthy &";
                          bgColor = Colors.green.shade300;
                        }

                        setState(() {
                          wtResult = '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                        });

                        }else {
                        setState((){
                          wtResult = "Please fill all fields";
                        });
                        }

                    },
                      child: Text('Calulate',
                        style: TextStyle(fontSize: 16),),)),

                Text(wtResult, style: TextStyle(fontSize: 26),),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
