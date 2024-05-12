import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/modules/3-dashboard_screen/dashboard_screen.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/products_module.dart';
import 'package:pharma_store_administration_web/modules/6-store_screen/store_screen.dart';
import 'package:pharma_store_administration_web/shared/components/widget/side_menu_widget.dart';
import 'package:sidebarx/sidebarx.dart';

import '../modules/5-pharmacy_screen/pharmacy_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreenRoute';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  final _controller = SidebarXController(selectedIndex: 1, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            // what is happening here ?
            appBar: isSmallScreen
                ? AppBar(
                    title: const Text('SideBarX Example'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        switch (_controller.selectedIndex) {
                          case 0:
                            _key.currentState?.closeDrawer();
                            return const DashboardScreen();
                          case 1:
                            _key.currentState?.closeDrawer();
                            return Navigator(
                              onGenerateRoute: (settings) => MaterialPageRoute(
                                builder: (context) => const ProductsScreen(),
                              ),
                            );
                          case 2:
                            _key.currentState?.closeDrawer();
                            return Navigator(
                              onGenerateRoute: (settings) => MaterialPageRoute(
                                builder: (context) => const PharmacyScreen(),
                              ),
                            );
                          case 3:
                            _key.currentState?.closeDrawer();
                            return Navigator(
                              onGenerateRoute: (settings) => MaterialPageRoute(
                                builder: (context) => const StoreScreen(),
                              ),
                            );
                          case 4:
                            _key.currentState?.closeDrawer();
                            return const Center(
                              child: Text(
                                'Theme',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            );
                          case 5:
                            _key.currentState?.closeDrawer();
                            return const Center(child: DashboardScreen());
                          case 6:
                            _key.currentState?.closeDrawer();
                            return const Center(
                              child: Text(
                                'Theme',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            );
                          default:
                            return const Center(
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
