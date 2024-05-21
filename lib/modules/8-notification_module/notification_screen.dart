import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pharma_store_administration_web/models/notification_data_table.dart';
import 'package:pharma_store_administration_web/shared/components/widget/notification_widget/notification_table_widget.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../shared/components/functions.dart';
import '../3-pharmacy_module/pharmacy_screen_option/pharmacies_screen_option.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = 'NotificationScreenRoute';

  const NotificationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const NotificationScreen(),
    );
  }

  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}



class _NotificationScreen extends State<NotificationScreen> {
  TextEditingController dateTimeController_1 = TextEditingController();
  TextEditingController dateTimeController_2 = TextEditingController();
  bool activatedIsChecked = false;
  bool deactivatedIsChecked = false;
  bool filterVisiblity = false;
  bool filterVisiblity2 = false;

   late TextEditingController controllerOfSearch;
  List<NotificationData>? filteredData;
  void toggleFirstWidget() {
    setState(() {
      filterVisiblity = !filterVisiblity;
      filterVisiblity2 = false; // Ensure only one is visible
    });
  }
  void toggleSecondWidget() {
    setState(() {
      filterVisiblity2 = !filterVisiblity2;
      filterVisiblity = false; // Ensure only one is visible
    });
  }


  void _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = notificationDemoData;
      } else {
        filteredData = notificationDemoData
            .where((element) =>
            element.address.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _applyFilter() {
    setState(() {
      if (activatedIsChecked && deactivatedIsChecked) {
        filteredData = notificationDemoData;
      } else if (activatedIsChecked && !deactivatedIsChecked) {
        filteredData = notificationDemoData
            .where((element) => element.state == 'Activated')
            .toList();
      } else if (!activatedIsChecked && deactivatedIsChecked) {
        filteredData = notificationDemoData
            .where((element) => element.state == 'Deactivated')
            .toList();
      } else {
        filteredData = notificationDemoData;
      }
    });
  }

  void _resetFilter() {
    setState(() {
      activatedIsChecked = false;
      deactivatedIsChecked = false;
      filteredData = notificationDemoData;
    });
  }

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
    filteredData = notificationDemoData;
    controllerOfSearch = TextEditingController(); // Initialize here
  }

  //int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const ScreenHeader(screenName: 'Notifications'),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                    Padding(
                    padding:  const EdgeInsets.only(
                        top: 78.0, left: 40.0, right: 40.0),
                    child: Center(
                      child: SingleChildScrollView(child: NotificationTableWidget(openProfileScreen: _openProfileScreen, data: filteredData!,
                      )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40, top: 30, bottom: 10),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 896.4,
                                  height: 40,
                                  child: TextFormField(
                                    controller: controllerOfSearch,
                                    onChanged: _filterSearchResults,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: HexColor(white),
                                        hintText:
                                            'Search notification by date, pharmacy or store',
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
                                            const EdgeInsets.symmetric(
                                                vertical: 5)),
                                  ),
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: toggleFirstWidget,
                                  color: HexColor('#edf0fe'),
                                  height: 48,
                                  minWidth: 105,
                                  elevation: 0,
                                  hoverColor: Colors.transparent,
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#edf0fe')),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          setPhoto(
                                              kind: 1,
                                              path: 'assets/icons/filter.svg'),
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
                                const SizedBox(width: 10),
                                MaterialButton(
                                  onPressed: toggleSecondWidget,
                                  color: HexColor('#edf0fe'),
                                  height: 48,
                                  minWidth: 48,
                                  elevation: 0,
                                  hoverColor: Colors.transparent,
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#edf0fe')),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Icon(Icons.more_horiz),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                               Stack(
                                 children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 70.0),
                                   child: Visibility(
                                   maintainSize: true,
                                   maintainAnimation: true,
                                   maintainInteractivity: true,
                                   maintainState: true,
                                   maintainSemantics: true,
                                   visible: filterVisiblity,
                                   child: Container(
                                     margin: const EdgeInsets.only(top: 5),
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius:
                                         BorderRadius.circular(8.0)),
                                     width: 280,
                                     height: 314,
                                     child: Padding(
                                       padding:
                                       const EdgeInsets.only(right: 20.0),
                                       child: Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             const Padding(
                                               padding: EdgeInsets.only(
                                                   left: 20.0, top: 20.0),
                                               child: Text(
                                                 "Filter Options",
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontFamily:
                                                   'Poppins-SemiBold',
                                                   fontSize: 16,
                                                 ),
                                               ),
                                             ),
                                             const Padding(
                                               padding:
                                               EdgeInsets.only(top: 14.0),
                                               child: Divider(
                                                 height: 1,
                                               ),
                                             ),
                                             const Padding(
                                               padding: EdgeInsets.only(
                                                   top: 20.0, left: 20.0),
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
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.start,
                                                 children: [
                                                   Padding(
                                                     padding:
                                                     const EdgeInsets.only(
                                                         left: 13.0,
                                                         top: 14.0),
                                                     child: Checkbox(
                                                       overlayColor:
                                                       const MaterialStatePropertyAll(
                                                           Colors
                                                               .transparent),

                                                       side: BorderSide(
                                                           color:
                                                           HexColor(white70),
                                                           width: 1.3),

                                                       activeColor:
                                                       HexColor(primary),
                                                       value: activatedIsChecked,
                                                       // Adjust initial value as needed
                                                       onChanged: (value) {
                                                         setState(() {
                                                           activatedIsChecked =
                                                           value!;
                                                         });
                                                       }, // Pass the function reference
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                     const EdgeInsets.only(
                                                         left: 2.5,
                                                         top: 14.0),
                                                     child: Container(
                                                       width: 78,
                                                       height: 26,
                                                       decoration: BoxDecoration(
                                                         color:
                                                         HexColor('#ecfdf3'),
                                                         borderRadius:
                                                         BorderRadius
                                                             .circular(14),
                                                       ),
                                                       child: Center(
                                                         child: Text(
                                                           "Pharmacy",
                                                           style: TextStyle(
                                                             color: HexColor(
                                                                 '#009881'),
                                                             fontSize: 12,
                                                             fontFamily:
                                                             'Poppins',
                                                             fontWeight:
                                                             FontWeight.w500,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                     const EdgeInsets.only(
                                                         left: 15.0,
                                                         top: 14.0),
                                                     child: Checkbox(
                                                       overlayColor:
                                                       const MaterialStatePropertyAll(
                                                           Colors
                                                               .transparent),
                                                       focusColor: Colors.black,
                                                       side: BorderSide(
                                                           color:
                                                           HexColor(white70),
                                                           width: 1.3),
                                                       activeColor:
                                                       HexColor(primary),
                                                       value:
                                                       deactivatedIsChecked,
                                                       // Adjust initial value as needed
                                                       onChanged: (value) {
                                                         setState(() {
                                                           deactivatedIsChecked =
                                                           value!;
                                                         });
                                                       }, // Pass the function reference
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                     const EdgeInsets.only(
                                                         left: 2.5,
                                                         top: 14.0),
                                                     child: Container(
                                                       padding: const EdgeInsets
                                                           .symmetric(
                                                           horizontal: 2.5),
                                                       width: 85,
                                                       height: 26,
                                                       decoration: BoxDecoration(
                                                         color:
                                                         HexColor('#FFFADF'),
                                                         borderRadius:
                                                         BorderRadius
                                                             .circular(14),
                                                       ),
                                                       child: Center(
                                                         child: Text(
                                                           "Store",
                                                           style: TextStyle(
                                                             color: HexColor(
                                                                 '#ECA600'),
                                                             fontSize: 12,
                                                             fontFamily:
                                                             'Poppins',
                                                             fontWeight:
                                                             FontWeight.w500,
                                                           ),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 ]),
                                             const Padding(
                                               padding: EdgeInsets.only(
                                                   left: 20.0, top: 20.0),
                                               child: Text("Date:"),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(
                                                   top: 12.0, left: 20.0),
                                               child: Row(
                                                 children: [
                                                   SizedBox(
                                                     width:
                                                     MediaQuery.of(context)
                                                         .size
                                                         .width*0.08,
                                                     height: 40,
                                                     child: TextField(
                                                       style: const TextStyle(
                                                           fontSize: 12),
                                                       controller:
                                                       dateTimeController_1,
                                                       readOnly: true,
                                                       onTap: () async {
                                                         DateTime? pickedData =
                                                         await showDatePicker(
                                                             context:
                                                             context,
                                                             initialDate:
                                                             DateTime
                                                                 .now(),
                                                             firstDate:
                                                             DateTime(
                                                                 2000),
                                                             lastDate:
                                                             DateTime(
                                                                 2025));
                                                         if (pickedData !=
                                                             null) {
                                                           String formattedDate =
                                                           DateFormat(
                                                               "yyyy-MM-dd")
                                                               .format(
                                                               pickedData);
                                                           setState(() {
                                                             dateTimeController_1
                                                                 .text =
                                                                 formattedDate
                                                                     .toString();
                                                           });
                                                         }
                                                       },
                                                       decoration:
                                                       InputDecoration(
                                                           filled: true,
                                                           fillColor:
                                                           HexColor(
                                                               white),
                                                           hintText:
                                                           '2020-8-25',
                                                           hintStyle:
                                                           TextStyle(
                                                             fontSize: 11.5,
                                                             color: HexColor(
                                                                 "#42526d"),
                                                             fontFamily:
                                                             'Poppins',
                                                           ),
                                                           border:
                                                           const OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius
                                                                 .only(
                                                               bottomLeft: Radius
                                                                   .circular(
                                                                   12),
                                                               topLeft: Radius
                                                                   .circular(
                                                                   12),
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
                                                               .only(
                                                               top: 10,
                                                               bottom:
                                                               10,
                                                               left: 10,
                                                               right:
                                                               30)),
                                                     ),
                                                   ),
                                                   const SizedBox(
                                                       width: 10,
                                                       child: Padding(
                                                         padding: EdgeInsets
                                                             .symmetric(
                                                             horizontal:
                                                             2.0),
                                                         child: Divider(
                                                           height: 1.5,
                                                         ),
                                                       )),
                                                   SizedBox(
                                                     width:
                                                     MediaQuery.of(context)
                                                         .size
                                                         .width *0.08,
                                                     height: 40,
                                                     child: TextField(
                                                       style: const TextStyle(
                                                           fontSize: 12),
                                                       controller:
                                                       dateTimeController_2,
                                                       readOnly: true,
                                                       onTap: () async {
                                                         DateTime? pickedData =
                                                         await showDatePicker(
                                                             context:
                                                             context,
                                                             initialDate:
                                                             DateTime
                                                                 .now(),
                                                             firstDate:
                                                             DateTime(
                                                                 2000),
                                                             lastDate:
                                                             DateTime(
                                                                 2025));
                                                         if (pickedData !=
                                                             null) {
                                                           String formattedDate =
                                                           DateFormat(
                                                               "yyyy-MM-dd")
                                                               .format(
                                                               pickedData);
                                                           setState(() {
                                                             dateTimeController_2
                                                                 .text =
                                                                 formattedDate
                                                                     .toString();
                                                           });
                                                         }
                                                       },
                                                       decoration:
                                                       InputDecoration(
                                                           filled: true,
                                                           fillColor:
                                                           HexColor(
                                                               white),
                                                           hintText: 'To',
                                                           hintStyle:
                                                           TextStyle(
                                                             fontSize: 11.5,
                                                             color: HexColor(
                                                                 "#42526d"),
                                                             fontFamily:
                                                             'Poppins',
                                                           ),
                                                           border:
                                                           const OutlineInputBorder(
                                                             borderRadius:
                                                             BorderRadius
                                                                 .only(
                                                               bottomLeft: Radius
                                                                   .circular(
                                                                   12),
                                                               topLeft: Radius
                                                                   .circular(
                                                                   12),
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
                                                               .only(
                                                               top: 10,
                                                               bottom:
                                                               10,
                                                               left: 10,
                                                               right:
                                                               30)),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             Row(
                                               children: [
                                                 const Spacer(),
                                                 Padding(
                                                   padding:
                                                   const EdgeInsets.only(
                                                       bottom: 18, top: 34),
                                                   child: MaterialButton(
                                                       minWidth: 58,
                                                       height: 34,
                                                       elevation: 0.0,
                                                       color:
                                                       HexColor("#f5f6fa"),
                                                       onPressed: () {
                                                         setState(() {
                                                           deactivatedIsChecked =
                                                           false;
                                                           activatedIsChecked =
                                                           false;
                                                           notificationDemoData =
                                                           filteredData!;
                                                         });
                                                       },
                                                       child: Text(
                                                         "Reset",
                                                         style: TextStyle(
                                                             fontFamily:
                                                             "Poppins-SemiBold",
                                                             fontSize: 12,
                                                             color: HexColor(
                                                                 "#60656e")),
                                                       )),
                                                 ),
                                                 Padding(
                                                   padding:
                                                   const EdgeInsets.only(
                                                       left: 8.0,
                                                       bottom: 18,
                                                       top: 34),
                                                   child: MaterialButton(
                                                       minWidth: 58,
                                                       height: 34,
                                                       elevation: 0.0,
                                                       color: HexColor(primary),
                                                       onPressed: () {},
                                                       child: Text(
                                                         "Apply",
                                                         style: TextStyle(
                                                             fontFamily:
                                                             "Poppins-SemiBold",
                                                             fontSize: 12,
                                                             color: HexColor(
                                                                 "#ffffff")),
                                                       )),
                                                 )
                                               ],
                                             )
                                           ]),
                                     ),
                                   ),
                                                                  ),
                                 ),
                                 const SizedBox(width: 10),
                                 Padding(
                                   padding: const EdgeInsets.only(top:5.0,left:210),
                                   child: Visibility(
                                     maintainSize: true,
                                     maintainAnimation: true,
                                     maintainInteractivity: true,
                                     maintainState: true,
                                     maintainSemantics: true,

                                     visible: filterVisiblity2,
                                     child: Center(
                                         child: InkWell(
                                           hoverColor: Colors.grey,
                                           splashColor: Colors.grey,
                                           highlightColor: Colors.grey,
                                           onTap: () {},

                                           child: Container(


                                             decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 borderRadius:
                                                 BorderRadius.circular(8.0)),
                                             child: const Padding(
                                               padding: EdgeInsets.all(18.0),
                                               child: Text("Mark all as read"),
                                             ),
                                           ),
                                         )),
                                   ),
                                 )
                                 ]
                               )
                              ],
                            )
                          ],
                        ),
                      ),
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
