import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/product_inventory_tab/product_inventory_tab.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/product_tab/product_tab.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = 'ProductsScreenRoute';

  const ProductsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProductsScreen(),
    );
  }

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 54),
          child: ScreenHeader(screenName: 'Products'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const SizedBox(
                height: 44,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TabBar(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(text: "Products"),
                      Tab(text: "Products Inventory"),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const TabBarView(
                    children: [
                      ProductTab(),
                      ProductInventoryTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
