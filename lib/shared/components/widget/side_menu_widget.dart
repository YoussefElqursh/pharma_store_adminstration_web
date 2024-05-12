import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: SidebarX(
        controller: _controller,
        headerBuilder: (context, extended) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: setPhoto(
                        kind: 1,
                        path: 'assets/images/Logo-app.svg',
                        width: 20,
                        height: 20),
                  ),
                  const SizedBox(width: 10),
                  extended
                      ? Text.rich(
                          overflow: TextOverflow.fade,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Pharma',
                                style: TextStyle(
                                  color: HexColor(primary),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Store',
                                style: TextStyle(
                                  color: HexColor(black),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          style: const TextStyle(
                            color: Color(0xff4a72ff),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
        headerDivider: Padding(
          padding: const EdgeInsets.only(top: 9.0, bottom: 10),
          child: Divider(color: HexColor(bWhite90), height: 1),
        ),
        theme: SidebarXTheme(
          decoration: BoxDecoration(
            border: Border.all(color: HexColor(bWhite90)),
          ),
          iconTheme: IconThemeData(
            color: HexColor(black),
          ),
          selectedItemDecoration: BoxDecoration(
            color: HexColor(primary),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          selectedIconTheme: const IconThemeData(color: Colors.white),
        ),
        extendedTheme: const SidebarXTheme(
            width: 180,
            textStyle: TextStyle(
              color: Color(0xFF23262A),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            selectedTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
            hoverTextStyle: TextStyle(
              color: Color(0xFF23262A),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            itemPadding: EdgeInsets.only(left: 25, right: 15, top: 10),
            selectedItemPadding: EdgeInsets.all(15),
            itemTextPadding: EdgeInsets.only(left: 10),
            selectedItemTextPadding: EdgeInsets.only(left: 10),
            iconTheme: IconThemeData(size: 18, color: Colors.black),
            selectedIconTheme: IconThemeData(size: 18, color: Colors.white),
            selectedItemMargin: EdgeInsets.only(left: 15, right: 25)),
        items: const [
          SidebarXItem(
            icon: MyIcons.dashboard,
            label: 'Dashboard',
          ),
          SidebarXItem(icon: MyIcons.product, label: 'Products'),
          SidebarXItem(icon: MyIcons.pharmacy, label: 'Pharmacies'),
          SidebarXItem(icon: MyIcons.store, label: 'Stores'),
          SidebarXItem(icon: MyIcons.order, label: 'Orders'),
          SidebarXItem(icon: MyIcons.statistics, label: 'Statistics'),
          SidebarXItem(icon: MyIcons.settings, label: 'Settings'),
          SidebarXItem(icon: MyIcons.logout, label: 'Logout'),
        ],
        footerDivider: Divider(
          height: 1,
          color: HexColor(bWhite90),
        ),
      ),
    );
  }
}
