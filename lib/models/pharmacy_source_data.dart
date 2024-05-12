import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/pharmacy_data-table_model.dart';
import '../modules/5-pharmacy_screen/pharmacies_profiles_screen.dart';

class DTS extends DataTableSource {
  final List<PharmacyDataModel> pharmacyData;
  final BuildContext context; // Add context to access Navigator

  DTS(this.pharmacyData, this.context);

  void _openProfileScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const PharmacyProfilesScreen(),
        ),
      ),
    );
  }

  @override
  DataRow? getRow(int index) {
    if (index >= pharmacyData.length || index < 0) return null;
    final pharmacyItem = pharmacyData[index];
    Color? bColor;
    Color? fColor;
    switch (pharmacyItem.state) {
      case 'Activated':
        bColor = HexColor('#ecfdf3');
        fColor = HexColor('#009881');
        break; // Add break statement
      case 'Deactivated':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
        break; // Add break statement
    }

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(
            pharmacyItem.id.toString())), // Access data using object properties
        DataCell(
          pharmacyItem.photo.isEmpty // Handle empty photo case (optional)
              ? const Text('')
              : Image.network(pharmacyItem.photo), // Assuming photo is a URL
        ),
        DataCell(Text(pharmacyItem.name)),
        DataCell(Text(pharmacyItem.contact)),
        DataCell(Text(pharmacyItem.address)),
        DataCell(
          Container(
            width: 78,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                pharmacyItem.state,
                style: TextStyle(
                  color: fColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'View Profile',
                onTap: _openProfileScreen,
                child: const Text('View Profile'), // Call function here
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 10; // Change this to actual count

  @override
  int get selectedRowCount => 0;
}
