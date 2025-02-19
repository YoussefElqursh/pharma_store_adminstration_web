import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../style/colors.dart';
import '../../profile_widget.dart';

class PharmacistDetailsWidget extends StatelessWidget {
  const PharmacistDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Expanded(
            child: ProfileContainer(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 31.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: HexColor("#dde1eb"),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 858.3,
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32.0, left: 30.0, bottom: 27),
                          child: Text(
                            "Pharmacy Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins-SemiBold",
                              color: HexColor("#23262a"),
                            ),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: HexColor("#dde1eb"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 30.0, bottom: 31.0),
                          child: Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 33.0, top: 5),
                                        child: Text(
                                          "Email:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 81.0),
                                        child: Text(
                                          "Contact Number:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 33.0),
                                        child: Text(
                                          "Country:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 33.0),
                                        child: Text(
                                          "Governorate:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 32.0),
                                        child: Text(
                                          "Region:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 31.0),
                                        child: Text(
                                          "Address:",
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 32.0),
                                        child: Text(
                                          "License Number:",
                                        ),
                                      ),
                                      Text(
                                        "Commercial Register:",
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 21.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 35.0, top: 8),
                                          child: Text(
                                            "elezaby123456@gmail.com",
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 40.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "01202617505",
                                              ),
                                              Text(
                                                "01202617505",
                                              ),
                                              Text(
                                                "01202617505",
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 35.0),
                                          child: Text(
                                            "Egypt",
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 35.0),
                                          child: Text(
                                            "Alexandria",
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 35.0),
                                          child: Text(
                                            "El montaza",
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 25.0),
                                          child: Text(
                                            "8587 Frida Ports",
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 30.0),
                                          child: Text(
                                            "5180682",
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "commercial_register.pdf",
                                            ),
                                            const SizedBox(width: 30),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width: 60,
                                                height: 23,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      74, 114, 255, 0.05),
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Show",
                                                      style: TextStyle(
                                                        color:
                                                            HexColor(primary),
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    const Icon(
                                                        Icons
                                                            .file_present_outlined,
                                                        size: 13,
                                                        color:
                                                            Colors.blueAccent),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 31.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: HexColor("#dde1eb"),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 858.3,
                height: 387,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, left: 30.0, bottom: 27),
                      child: Text(
                        "Pharmacist Details ",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Poppins-SemiBold",
                            color: HexColor("#23262a")),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: HexColor("#dde1eb"),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, top: 30.0, bottom: 31.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 33.0, top: 5),
                                  child: Text(
                                    "First Name:",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 33.0),
                                  child: Text(
                                    "Last Name:",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 33.0),
                                  child: Text(
                                    "Email:",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 33.0),
                                  child: Text(
                                    "Phone Number:",
                                  ),
                                ),
                                Text(
                                  "License Number:",
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 21.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 35),
                                    child: Text(
                                      "Ahmed",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 30.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Mohammed",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 40.0),
                                    child: Text(
                                      "ahmedmo1463@gmail.com",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 35.0),
                                    child: Text(
                                      "01503632147",
                                    ),
                                  ),
                                  Text(
                                    "126565",
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
