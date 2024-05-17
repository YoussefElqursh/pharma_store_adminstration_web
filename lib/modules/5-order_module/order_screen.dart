import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/filter_option.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget/order_table/order_table.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = 'OrderScreenRoute';

  const OrderScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OrderScreen(),
    );
  }

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool filterVisibility = false;
  late TextEditingController controllerOfFilter;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController dateTimeController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(screenName: 'Orders'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30, top: 30, bottom: 10),
                  child: Stack(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          OrderTable(),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 570,
                            height: 48,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: HexColor(white),
                                  hintText: 'Search order by name',
                                  hintStyle: const TextStyle(
                                    color: Color(0xffb2bac6),
                                    fontFamily: 'Poppins',
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
                                    borderSide:
                                        BorderSide(color: HexColor(bWhite90)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor(primary)),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 5)),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                filterVisibility = !filterVisibility;
                              });
                            },
                            color: HexColor('#edf0fe'),
                            height: 48,
                            minWidth: 105,
                            elevation: 0,
                            hoverColor: Colors.transparent,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: HexColor('#edf0fe')),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    setPhoto(
                                        kind: 1, path: 'assets/icons/filter.svg'),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                          color: HexColor(primary),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: filterVisibility,
                              child: FilterOption(
                                dateTimeController1: dateTimeController,
                                dateTimeController2: dateTimeController2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
