
import 'package:clone/hime_page.dart/accout.dart';
import 'package:clone/hime_page.dart/games.dart';
import 'package:clone/hime_page.dart/homep/home.dart';
import 'package:clone/hime_page.dart/newandhot.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
   int _selectIndex = 0;
  final List<Widget> _pages = [
MyHomePage(),
GamesPage(),
NewHot(),
MyAccount(),



  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor:Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videogame_asset,
              ),
              label: 'Games'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
              ),
              label: 'New & Hot'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
              ),
              label: 'My Profile'),
         // BottomNavigationBarItem(
          //    icon: Icon(
           //     Icons.account_box_rounded,
            //  ),
            //  label: 'Account')
        ],
        currentIndex: _selectIndex,
        onTap: (value) {
          _selectIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
