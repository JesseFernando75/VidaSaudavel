import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/edicaodecliente.dart';
import 'package:vida_saudavel/views/favoritascliente.dart';
import 'package:vida_saudavel/views/home.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);

  int _selectedIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _screens = [
    Home(),
    FavoritasCliente(),
    EdicaoCliente(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: BUTTONCOLOR,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritas',
            backgroundColor: Color.fromRGBO(0, 184, 212, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blender),
            label: 'Suas receitas',
            backgroundColor: Color.fromRGBO(242, 165, 65, 1.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: 'Conta',
            backgroundColor: Color.fromRGBO(38, 166, 154, 1.0),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
