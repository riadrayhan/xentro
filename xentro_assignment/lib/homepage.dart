import 'package:flutter/material.dart';
import 'package:xentro_assignment/new_screen.dart';
import 'package:xentro_assignment/utils/color.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xentro Assesment",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: PrimaryColors.primaryColor,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(image: AssetImage('assets/logo.png')),
          )
        ],
      ),
      body:  Center(
        child: Container(
          height: 200,
          child: Column(
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(color: Color(0xFFBD1111),fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Xentro',
                    style: TextStyle(color: PrimaryColors.primaryColor,fontWeight: FontWeight.bold)
                  )
                ]
              )),
              SizedBox(height: 70,),
              ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome to New Screen")));
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen(),));
              }, child: Text("Click to New Screen"))
            ],
          ),
        ),
      ),
    );
  }
}
