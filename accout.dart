import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Title(color: Colors.white, child: Text('Profile')),
      ),
      body:Center(
        child:Image.asset('asset/WhatsApp Image 2024-02-03 at 16.06.06_6448f3b2.jpg')
      )
    );
  }
}