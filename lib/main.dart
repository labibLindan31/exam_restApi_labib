import 'package:flutter/material.dart';
import 'package:flutter_exam_2/addAndDelete.dart';
import 'package:flutter_exam_2/models/post.dart';
import 'package:flutter_exam_2/pages/home_page_stateful.dart';
import 'package:flutter_exam_2/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAIN MENU'),
        centerTitle: true, 
        backgroundColor: Color.fromARGB(255, 152, 200, 207), 
        leading: Icon(Icons.menu), 
      ),
      backgroundColor: Color.fromARGB(255, 133, 176, 176), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                text: 'PAGE GET',
                icon: Icons.get_app,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'PAGE POST',
                icon: Icons.post_add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'PAGE PUT & DELETE',
                icon: Icons.edit,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAndDeleteScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageStateful();
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Color.fromARGB(255, 73, 116, 147),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
