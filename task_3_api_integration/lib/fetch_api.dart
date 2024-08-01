import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FetchApi extends StatefulWidget {
  const FetchApi({super.key});

  @override
  State<FetchApi> createState() => _FetchApiState();
}

class _FetchApiState extends State<FetchApi> {

  List<dynamic> posts = [];
  bool isLoading=true;
  Future<void> downloadJson() async {
    try {
      final response = await get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts")); //API
      if (response.statusCode == 200) { //API response
        setState(() {
          posts = json.decode(response.body);
          isLoading = false; // Data is loaded
        });
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      // Handle any errors
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    downloadJson();
    _checkInitialConnectivity();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  @override
  void dispose() {
    _connectivity.onConnectivityChanged.drain();
    super.dispose();
  }

  //===========internet checker start================//

  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;

  Future<void> _checkInitialConnectivity() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isConnected = (result != ConnectivityResult.none);
    });

    if (!_isConnected) {
      _showNoInternetDialog();
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your network connection and try again.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//=========== internet checker end ================//



  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Fetch API"),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
        body: Center(
          child: isLoading // Check if data is still loading
              ? const CircularProgressIndicator() //Adding progress indicator
              : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shadowColor: Colors.yellowAccent,
                child: ListTile(
                  title: Text(
                    posts[index]['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(posts[index]['body']),
                ),
              );
            },
          ),
        ),
      );
    }
  }
