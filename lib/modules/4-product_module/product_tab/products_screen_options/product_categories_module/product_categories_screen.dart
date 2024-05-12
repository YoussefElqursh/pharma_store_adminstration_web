import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/products_module.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/product_tab/products_screen_options/product_categories_module/product_categories_option/add_categories.dart';
import 'package:pharma_store_administration_web/shared/components/widget/back_screen_header.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ProductCategoryScreen extends StatefulWidget {
  static const String routeName = 'ProductCategoryScreenRoute';

  const ProductCategoryScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProductCategoryScreen(),
    );
  }

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackScreenHeader(
          backScreenName: 'Products',
          goBack: () {
            Navigator.push(context, ProductsScreen.route());
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          color: Color(0xFF23262A),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 138,
                        height: 42,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4A71FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: MaterialButton(
                          minWidth: 138,
                          height: 42,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AddCategorise(),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Add Category',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 645,
                    height: 42,
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: HexColor(white),
                          hintText: 'Search category',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB2BAC6),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: HexColor(bWhite90),
                            size: 21,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor(bWhite90)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor(primary)),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TableWidget(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
