import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About This App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This application is designed to help users manage and track their daily activities efficiently. '
              'With a user-friendly interface and a variety of features, this app makes it easy to stay organized '
              'and productive. Here are some of the key features of our app:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '- Task Management: Create, edit, and delete tasks easily.\n'
              '- Notifications: Get reminders for your important tasks.\n'
              '- Analytics: Track your progress with detailed analytics.\n'
              '- Customization: Customize the app to suit your preferences.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Our goal is to provide a tool that can help you stay on top of your daily activities and achieve your goals '
              'more effectively. We hope you enjoy using our app!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
