import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/pharmacy_data-table_model.dart';
import '../modules/5-pharmacy_screen/pharmacies_profiles_screen.dart';
import 'order_data_table_model.dart';

class DtsOrder extends DataTableSource {
  final List<OrderDataModel> orderData;

  DtsOrder(this.orderData);

  @override
  DataRow? getRow(int index) {
    if (index >= orderData.length || index < 0) return null;
    final OrderItem = orderData[index];
    Color? bColor;
    Color? fColor;
    switch (OrderItem.state) {
      case 'Delivered':
        bColor = HexColor('#ecfdf3');
        fColor = HexColor('#009881');
      case 'Canceled':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
      case 'On Way':
        bColor = HexColor('#e9f3ff');
        fColor = HexColor('#4a72ff');
      case 'On Hold':
        bColor = HexColor('#fffadf');
        fColor = HexColor('#eca600');
    }

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(OrderItem.id.toString())), // Access data using object properties
        DataCell(Text(OrderItem.from)),
        DataCell(Text(OrderItem.to)),
        DataCell(Text(OrderItem.date)),
        DataCell(
          Container(
            width: 73,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child:
            Center(
              child: Text(
                OrderItem.state,
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
              onTap: () =>  Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                        opacity: animation,
                        child: const PharmacyProfilesScreen(),
                      ),
                ),
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
