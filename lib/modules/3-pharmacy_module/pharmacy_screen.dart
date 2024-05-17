import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/modules/3-pharmacy_module/pharmacy_screen_option/pharmacies_screen_option.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/pharmacy_widget/pharmacy_table_widget.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import '../../models/pharmacy_data_table.dart';

class PharmacyScreen extends StatefulWidget {
  static const String routeName = 'PharmacyScreenRoute';

  const PharmacyScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PharmacyScreen(),
    );
  }

  @override
  State<PharmacyScreen> createState() => _PharmacyScreen();
}

class _PharmacyScreen extends State<PharmacyScreen> {
  List<PharmacyData>? filteredData;

  bool activatedIsChecked = false;
  bool deactivatedIsChecked = false;
  bool filterVisibility = false;
  late TextEditingController controllerOfSearch;

  // Function to navigate to profile screen
  void _openProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PharmacyScreenOption(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    filteredData = pharmacyDemo_Data;
    controllerOfSearch = TextEditingController(); // Initialize here
  }

  void _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = pharmacyDemo_Data;
      } else {
        filteredData = pharmacyDemo_Data
            .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const ScreenHeader(screenName: 'Pharmacies'),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 78.0, left: 40.0, right: 40.0),
                    child: PharmacyTableWidget(
                      openProfileScreen: _openProfileScreen,
                      data: filteredData!,
                    ), // Pass the filtered data
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40, top: 30, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 896.4,
                              height: 40,
                              child: TextFormField(
                                controller: controllerOfSearch,
                                onChanged: _filterSearchResults,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: HexColor(white),
                                    hintText: 'Search pharmacy by name',
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
                                      borderSide: BorderSide(
                                          color: HexColor(bWhite90)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: HexColor(primary)),
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
                                      setPhoto(kind: 1, path: 'assets/icons/filter.svg'),
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
                        Visibility(
                          maintainSemantics: true,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: filterVisibility,
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0)),
                            width: 280,
                            height: 227,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                      child: Text(
                                        "Filter Options",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins-SemiBold',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 14.0),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                      child: Text(
                                        "State:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins-Medium',
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13.0, top: 14.0),
                                            child: Checkbox(
                                              overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),

                                              side: BorderSide(
                                                  color: HexColor(white70),
                                                  width: 1.3),

                                              activeColor: HexColor(primary),
                                              value: activatedIsChecked,
                                              // Adjust initial value as needed
                                              onChanged: (value) {
                                                setState(() {
                                                  activatedIsChecked = value!;
                                                });
                                              }, // Pass the function reference
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.5, top: 14.0),
                                            child: Container(
                                              width: 78,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                color: HexColor('#ecfdf3'),
                                                borderRadius:
                                                BorderRadius.circular(14),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Activated",
                                                  style: TextStyle(
                                                    color: HexColor('#009881'),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, top: 14.0),
                                            child: Checkbox(
                                              overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                              focusColor: Colors.black,
                                              side: BorderSide(
                                                  color: HexColor(white70),
                                                  width: 1.3),
                                              activeColor: HexColor(primary),
                                              value: deactivatedIsChecked,
                                              // Adjust initial value as needed
                                              onChanged: (value) {
                                                setState(() {
                                                  deactivatedIsChecked = value!;
                                                });
                                              }, // Pass the function reference
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.5, top: 14.0),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 2.5),
                                              width: 85,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                color: HexColor('#fff2ea'),
                                                borderRadius:
                                                BorderRadius.circular(14),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Deactivated",
                                                  style: TextStyle(
                                                    color: HexColor('#f15046'),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 95.0),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: HexColor(primary),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 10),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          'Apply Filter',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: 'Poppins-SemiBold',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
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
      ),
    );
  }
}