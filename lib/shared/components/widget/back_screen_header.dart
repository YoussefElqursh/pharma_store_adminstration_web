import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/modules/8-notification_module/notification_screen.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class BackScreenHeader extends StatelessWidget {
  const BackScreenHeader({super.key, required this.backScreenName});

  final String backScreenName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: HexColor('#DDE1EB'),
            width: 1,
          ),
          vertical: BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: setPhoto(
                    kind: 1,
                    path: "assets/images/Arrow_alt_lright_alt.svg",
                    width: 21,
                    height: 21),
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: HexColor(black),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              child: Text(backScreenName),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                    opacity: animation,
                    child: const NotificationScreen(),
                  ),
                ),
              ),
              icon: const Icon(
                MyIcons.notification,
                size: 15,
              ),
            ),
            const SizedBox(width: 25),
            ClipOval(
              child: Container(
                width: 32,
                height: 32,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
