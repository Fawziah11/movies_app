import 'package:flutter/material.dart';
import 'package:movies_app/favorite.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/movies.dart';

class TabScreen extends StatefulWidget {
  static const routName = "tabScreen";
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int currentIndex = 0;
  late List <Map<String,Object>> _pages;

  void onItemTapped (index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page' : HomePage()
      },
      {
        'page' : Movies()
      },
      {
        'page' : Favorite([])
      }
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        /*appBar: AppBar(
          title: Text("Movie App"),
          backgroundColor:Theme.of(context).primaryColor,
        ),*/
        body: _pages[currentIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey[500],
          //selectedFontSize: 20,
          selectedIconTheme: IconThemeData(
            size: 35,
          ) ,
         // unselectedFontSize: 5,
          currentIndex: currentIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "movies"),
            //BottomNavigationBarItem(icon: Icon(Icons.local_fire_department_rounded), label: "Trending"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),
          ],
        ),
      ),
    );
  }
}
