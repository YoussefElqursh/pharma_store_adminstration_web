import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/pharmacy_data-table_model.dart';
import '../modules/5-pharmacy_screen/pharmacies_profiles_screen.dart';

class DTS extends DataTableSource {
  final List<PharmacyDataModel> pharmacyData;

  DTS(this.pharmacyData);

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
      case 'Deactivated':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
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
        DataCell(PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => [
             PopupMenuItem<String>(
              onTap: () => Navigator.push(
                context,
                PharmacyProfilesScreen.route(), // Use PharmacyProfilesScreen.route()
              ),
              value: 'View Profile',
              child: const Text('View Profile'),
            ),
          ],
        )) // Directly add the IconButton)
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;

}
