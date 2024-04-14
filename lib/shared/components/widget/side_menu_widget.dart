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
    return SidebarX(
      controller: _controller,
      headerBuilder: (context, extended) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: setPhoto(
                      kind: 1,
                      path: 'assets/images/Logo-app.svg',
                      width: 30,
                      height: 30),
                ),
                const SizedBox(width: 10),
                extended
                    ? Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Pharma',
                            style: TextStyle(
                              color: HexColor(primary),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Store',
                            style: TextStyle(
                              color: HexColor(black),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        color: Color(0xff4a72ff),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
      headerDivider: Padding(
        padding: const EdgeInsets.only(top: 22.0,bottom: 10),
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
      extendedTheme: SidebarXTheme(
        width: 230,
        textStyle: TextStyle(
          color: HexColor(black),
          fontFamily: 'Poppins',
        ),
        selectedTextStyle: TextStyle(
          color: HexColor(white),
          fontFamily: 'Poppins',
        ),
        hoverTextStyle: TextStyle(
          color: HexColor(black),
          fontFamily: 'Poppins',
        ),
        itemPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        selectedItemPadding: const EdgeInsets.all(15),
        itemTextPadding: const EdgeInsets.only(left: 15),
        selectedItemTextPadding: const EdgeInsets.only(left: 15),
      ),
      items: const [
        SidebarXItem(icon: MyIcons.dashboard, label: 'Dashboard',),
        SidebarXItem(icon: MyIcons.product, label: 'Products'),
        SidebarXItem(icon: MyIcons.pharmacy, label: 'Pharmacies'),
        SidebarXItem(icon: MyIcons.store, label: 'Stores'),
      ],
      footerItems: const [
        SidebarXItem(icon: MyIcons.order, label: 'Orders'),
        SidebarXItem(icon: MyIcons.statistics, label: 'Statistics'),
        SidebarXItem(icon: MyIcons.settings, label: 'Settings'),
        SidebarXItem(icon: MyIcons.logout, label: 'Logout'),
      ],
    );
  }
}