import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pharma_store_administration_web/models/order_data_table_model.dart';
import 'package:pharma_store_administration_web/modules/3-pharmacy_module/pharmacy_screen_option/pharmacies_screen_option.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class FilterOption extends StatefulWidget {
  final TextEditingController dateTimeController1;
  final TextEditingController dateTimeController2;

  const FilterOption({
    super.key,
    required this.dateTimeController1,
    required this.dateTimeController2,
  });

  @override
  State<FilterOption> createState() => _FilterOption();
}

class _FilterOption extends State<FilterOption> {
  bool onHoldIsChecked = false;
  bool onWayIsChecked = false;
  bool canceledIsChecked = false;
  bool deliveredIsChecked = false;
  List<OrderDataModel>? filterData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      width: 280,
      height: 371,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "Date:",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Medium',
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: 40,
                  child: TextField(
                    style: const TextStyle(fontSize: 12),
                    controller: widget.dateTimeController1,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedData = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025));
                      if (pickedData != null) {
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(pickedData);
                        setState(() {
                          widget.dateTimeController1.text =
                              formattedDate.toString();
                        });
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor(white),
                        hintText: '2020-8-25',
                        hintStyle: TextStyle(
                          fontSize: 11.5,
                          color: HexColor("#42526d"),
                          fontFamily: 'Poppins',
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
                        contentPadding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 30)),
                  ),
                ),
                const SizedBox(
                    width: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Divider(
                        height: 1.5,
                      ),
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: 40,
                  child: TextField(
                    style: const TextStyle(fontSize: 12),
                    controller: widget.dateTimeController2,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedData = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025));
                      if (pickedData != null) {
                        String formattedDate =
                            DateFormat("yyyy-MM-dd").format(pickedData);
                        setState(() {
                          widget.dateTimeController2.text =
                              formattedDate.toString();
                        });
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor(white),
                        hintText: 'To',
                        hintStyle: TextStyle(
                          fontSize: 11.5,
                          color: HexColor("#42526d"),
                          fontFamily: 'Poppins',
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
                        contentPadding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 30)),
                  ),
                ),
              ],
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
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 14.0),
              child: Checkbox(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),

                side: BorderSide(color: HexColor(white70), width: 1.3),

                activeColor: HexColor(primary),
                value: deliveredIsChecked,
                // Adjust initial value as needed
                onChanged: (value) {
                  setState(() {
                    deliveredIsChecked = value!;
                  });
                }, // Pass the function reference
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.5, top: 14.0),
              child: Container(
                width: 78,
                height: 26,
                decoration: BoxDecoration(
                  color: HexColor('#ecfdf3'),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "Delivered",
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
              padding: const EdgeInsets.only(left: 15.0, top: 14.0),
              child: Checkbox(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                focusColor: Colors.black,
                side: BorderSide(color: HexColor(white70), width: 1.3),
                activeColor: HexColor(primary),
                value: onHoldIsChecked,
                // Adjust initial value as needed
                onChanged: (value) {
                  setState(() {
                    onHoldIsChecked = value!;
                  });
                }, // Pass the function reference
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.5, top: 14.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2.5),
                width: 85,
                height: 26,
                decoration: BoxDecoration(
                  color: HexColor('#fffadf'),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "On Hold",
                    style: TextStyle(
                      color: HexColor('#eca600'),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 14.0),
              child: Checkbox(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),

                side: BorderSide(color: HexColor(white70), width: 1.3),

                activeColor: HexColor(primary),
                value: onWayIsChecked,
                // Adjust initial value as needed
                onChanged: (value) {
                  setState(() {
                    onWayIsChecked = value!;
                  });
                }, // Pass the function reference
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.5, top: 14.0),
              child: Container(
                width: 78,
                height: 26,
                decoration: BoxDecoration(
                  color: HexColor('#e9f3ff'),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "On Way",
                    style: TextStyle(
                      color: HexColor('#4a72ff'),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 14.0),
              child: Checkbox(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                focusColor: Colors.black,
                side: BorderSide(color: HexColor(white70), width: 1.3),
                activeColor: HexColor(primary),
                value: canceledIsChecked,
                // Adjust initial value as needed
                onChanged: (value) {
                  setState(() {
                    canceledIsChecked = value!;
                  });
                }, // Pass the function reference
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.5, top: 14.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2.5),
                width: 85,
                height: 26,
                decoration: BoxDecoration(
                  color: HexColor('#fff2ea'),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    "Canceled",
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
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 18, top: 34),
                child: MaterialButton(
                    minWidth: 58,
                    height: 34,
                    elevation: 0.0,
                    color: HexColor("#f5f6fa"),
                    onPressed: () {
                      setState(() {
                        onWayIsChecked = false;
                        onHoldIsChecked = false;
                        canceledIsChecked = false;
                        deliveredIsChecked = false;

                        orderDemoData = filterData!;
                      });
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 12,
                          color: HexColor("#60656e")),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 18, top: 34),
                child: MaterialButton(
                    minWidth: 58,
                    height: 34,
                    elevation: 0.0,
                    color: HexColor(primary),
                    onPressed: () {
                      setState(() {
                        // Check if all checkboxes are unchecked (equivalent to all checkboxes checked in previous code)
                        if (!onHoldIsChecked &&
                            !onWayIsChecked &&
                            !canceledIsChecked &&
                            !deliveredIsChecked) {
                          // All checkboxes are unchecked, return the original filterData
                          orderDemoData = filterData!;
                        } else {
                          // At least one checkbox is checked, filter based on selected states
                          List<String> selectedStates = [];
                          if (onHoldIsChecked) {
                            selectedStates.add("On Hold");
                          }
                          if (onWayIsChecked) {
                            selectedStates.add("On Way");
                          }
                          if (canceledIsChecked) {
                            selectedStates.add("Canceled");
                          }
                          if (deliveredIsChecked) {
                            selectedStates.add("Delivered");
                          }

                          orderDemoData = filterData!
                              .where((element) =>
                                  selectedStates.contains(element.state))
                              .toList();
                        }
                      });
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(
                          fontFamily: "Poppins-SemiBold",
                          fontSize: 12,
                          color: HexColor("#ffffff")),
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }
}
