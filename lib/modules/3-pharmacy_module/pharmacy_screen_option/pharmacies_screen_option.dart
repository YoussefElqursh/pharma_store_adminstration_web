import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../models/pharmacy_card_model.dart';
import '../../../models/pharmacy_order_data_table.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/components/functions.dart';
import '../../../shared/components/widget/back_screen_header.dart';
import '../../../shared/components/widget/filter_option.dart';
import '../../../shared/components/widget/pharmacy_widget/pharmacy_order/pharmacy_order_table_widget.dart';
import '../../../shared/components/widget/pharmacy_widget/pharmacy_profile/pharmacy_details_widget.dart';

class PharmacyScreenOption extends StatefulWidget {
  static const String routeName = 'PharmacyProfilesScreenRoute';

  const PharmacyScreenOption({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PharmacyScreenOption(),
    );
  }

  @override
  State<PharmacyScreenOption> createState() => _PharmacyScreenOptionState();
}

class _PharmacyScreenOptionState extends State<PharmacyScreenOption> {
  bool activatedIsChecked = false;
  bool deactivatedIsChecked = false;

  bool filterVisiblity = false;
  bool sort = true;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController dateTimeController2 = TextEditingController();
  late TextEditingController controllerOfSearch;
  List<PharmacyOrderDataModel>? filteredData;

  @override
  void initState() {
    super.initState();
    filteredData = pharmacyOrderDemoData;
    controllerOfSearch = TextEditingController(); // Initialize here
  }

  void _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = pharmacyOrderDemoData;
      } else {
        filteredData = pharmacyOrderDemoData
            .where((element) =>
                element.from.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 75),
          child: BackScreenHeader(
            backScreenName: 'Pharmacies',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const SizedBox(
                  height: 44,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        text: "Profile",
                      ),
                      Tab(text: "Orders"),
                      Tab(text: "Statistics"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Adjust height as needed
                    child: TabBarView(
                      children: [
                        // Replace these placeholders with actual content widgets for each tab
                        const Expanded(
                          child: PharmacyDetailsWidget(),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: PharmacyOrderTableWidget(
                                    data: filteredData!,
                                  ),
                                )),
                                Expanded(
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  896.4,
                                              height: 40,
                                              child: TextFormField(
                                                controller: controllerOfSearch,
                                                onChanged: _filterSearchResults,
                                                decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: HexColor(white),
                                                    hintText:
                                                        'Search order by date or store',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xffb2bac6),
                                                      fontFamily: 'Poppins',
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.search,
                                                      color: HexColor(bWhite90),
                                                      size: 21,
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                        topLeft:
                                                            Radius.circular(12),
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: HexColor(
                                                              bWhite90)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: HexColor(
                                                              primary)),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 5)),
                                              ),
                                            ),
                                            const Spacer(),
                                            MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  filterVisiblity =
                                                      !filterVisiblity;
                                                });
                                              },
                                              color: HexColor('#edf0fe'),
                                              height: 48,
                                              minWidth: 105,
                                              elevation: 0,
                                              hoverColor: Colors.transparent,
                                              shape: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: HexColor('#edf0fe')),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Row(
                                                    children: [
                                                      setPhoto(
                                                          kind: 1,
                                                          path:
                                                              'assets/icons/filter.svg'),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        'Filter',
                                                        style: TextStyle(
                                                            color: HexColor(
                                                                primary),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                          visible: filterVisiblity,
                                          child: FilterOption(
                                            dateTimeController1:
                                                dateTimeController,
                                            dateTimeController2:
                                                dateTimeController2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Wrap(
                          children: [
                            SizedBox(
                              height: 180,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      buildDataCard(
                                          pharmacyDataList[index], index),
                                  itemCount: pharmacyDataList.length),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataCard(PharmacyCardModel dataCardModel, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: HexColor(bWhite90),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataCardModel.cardTitle,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    dataCardModel.cardNumber,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'This Month',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor(bWhite90),
                        ),
                      ),
                      items: itemList
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: HexColor(white70),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedItem,
                      iconStyleData:
                          IconStyleData(iconEnabledColor: HexColor(white70)),
                      onChanged: (String? value) {
                        setState(
                          () {
                            selectedItem = value;
                          },
                        );
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 125,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor(dataCardModel.color),
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          dataCardModel.cardIcon,
                          color: HexColor(dataCardModel.color),
                        )),
                  ),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 65,
                    decoration: BoxDecoration(
                      color: dataCardModel.cardState
                          ? HexColor(warning).withOpacity(0.20999999344348907)
                          : HexColor('#ecfdf3'),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        setPhoto(
                            kind: 1,
                            path: dataCardModel.cardImage,
                            width: 15,
                            height: 9),
                        const SizedBox(width: 10),
                        Text(
                          dataCardModel.cardPercentage,
                          style: TextStyle(
                            color: dataCardModel.cardState
                                ? const Color(0xfff15046)
                                : HexColor('#009881'),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
