import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        radius: 60.0,
        backgroundImage: AssetImage('assets/images/dev.jpg'),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Harsh Tripathi',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.purple[300],
            fontWeight: FontWeight.bold),
      ),
      Text(
        'FLUTTER DEVELOPER',
        style: TextStyle(
            fontFamily: 'SourceSansPro',
            color: Colors.purple[100],
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 15.0),
      ),
      SizedBox(
        height: 40.0,
        width: 150.0,
        child: Divider(
          color: Colors.purple[200],
        ),
      ),
      Card(
        elevation: 7.0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 50.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.phone_outlined,
                color: Colors.purple,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '+91 952-0423-518',
                style: TextStyle(
                    color: Colors.purple[900], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 7.0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(
                Icons.mail_outline_rounded,
                color: Colors.purple,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'harshtripathi9520@gmail.com',
                style: TextStyle(
                    color: Colors.purple[900], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
