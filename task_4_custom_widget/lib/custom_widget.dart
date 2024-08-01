import 'package:flutter/material.dart';

class Custom_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> cardData = [
      {'title': 'Card 1', 'subtitle': 'This is the first card', 'icon': Icons.star},
      {'title': 'Card 2', 'subtitle': 'This is the second card', 'icon': Icons.favorite},
      {'title': 'Card 3', 'subtitle': 'This is the third card', 'icon': Icons.thumb_up},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Card',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];
          return CustomCard(
            title: data['title'],
            subtitle: data['subtitle'],
            icon: data['icon'],
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  CustomCard({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}