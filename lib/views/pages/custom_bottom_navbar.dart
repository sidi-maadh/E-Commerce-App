import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {

  List<Widget> buildScreens(BuildContext context) {
    return [
      const HomePage(),
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: CartPage(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "Cart",
          ),
        ),
        PersistentTabConfig(
          screen: FavoritesPage(),
          item: ItemConfig(
            icon: Icon(Icons.favorite),
            title: "Favorites",
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: "Profile",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
            ),
          ],
        ),
        itemAnimationProperties: ItemAnimation(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
      ),
    ); // Choose the nav bar style with this property.
  }
}

