import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../style/colors.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: const Color(0xFFDDE1EB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Elezaby',
                  style: TextStyle(
                    color: HexColor("#23262a"),
                    fontSize: 18,
                    fontFamily: "Poppins-SemiBold",
                  ),
                  overflow: TextOverflow.fade,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Elezaby123124',
                    style: TextStyle(
                      fontFamily: "Poppins-Regular",
                      fontSize: 16,
                      color: HexColor("#60656e"),
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 84,
                      height: 25,
                      decoration: BoxDecoration(
                        color: HexColor('#ecfdf3'),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          "Activated",
                          style: TextStyle(
                            color: HexColor('#009881'),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 57,
                        height: 23,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(74, 114, 255, 0.05),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: HexColor(primary),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(Icons.edit, size: 13, color: Colors.blueAccent),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
