import 'package:flutter/material.dart';
import 'package:xentro_assignment/utils/color.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Screen",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: PrimaryColors.primaryColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This is List Title $index \nSubtitle $index")));
          },
          child: Card(
            shadowColor: PrimaryColors.primaryColor,
            child: ListTile(
              title: Text("This is List Title $index"),
              subtitle: Text("Subtitle $index"),
            ),
          ),
        );
      },),
    );
  }
}
