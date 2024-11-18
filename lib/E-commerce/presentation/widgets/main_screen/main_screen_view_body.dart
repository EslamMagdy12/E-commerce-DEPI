import 'package:e_commerce/E-commerce/presentation/pages/favorite/favorite_view.dart';
import 'package:e_commerce/E-commerce/presentation/pages/home/home_view.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:flutter/material.dart';

class MainScreenViewBody extends StatefulWidget {
  const MainScreenViewBody({super.key});

  @override
  State<MainScreenViewBody> createState() => _MainScreenViewBodyState();
}

class _MainScreenViewBodyState extends State<MainScreenViewBody> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List screens = [const HomeView(), const FavoriteView()];
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: ColorsAsset.mainColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
          ]),
      body: screens.elementAt(_selectedIndex),
    ));
  }
}
