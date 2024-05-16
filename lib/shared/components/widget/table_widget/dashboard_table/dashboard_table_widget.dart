import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/data_table.dart';
import 'package:pharma_store_administration_web/modules/5-order_module/order_screen_options/order_details.dart';

class DashboardTableWidget extends StatefulWidget {
  const DashboardTableWidget({super.key});

  @override
  State<DashboardTableWidget> createState() => _DashboardTableWidgetState();
}

class _DashboardTableWidgetState extends State<DashboardTableWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowHeight: 44,
        dataRowMaxHeight: 72,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFFAFBFB)),
            borderRadius: BorderRadius.circular(16)),
        border: TableBorder.all(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: const Color(0xFFFAFBFB),
            style: BorderStyle.none),
        headingTextStyle: const TextStyle(
          color: Color(0xff42526d),
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        headingRowColor: const MaterialStatePropertyAll(Color(0xfffbfafb)),
        columns: const [
          DataColumn(
            label: Text(
              'ID',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'From',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'To',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Date & Time',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'State',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              '',
              style: TextStyle(
                color: Color(0xFF42526D),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
        ],
        rows: List.generate(
            demoData.length, (index) => _dataRow(demoData[index])),
      ),
    );
  }

  DataRow _dataRow(Data data) {
    Color? bColor;
    Color? fColor;
    switch (data.state) {
      case 'Delivered':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
      case 'On Hold':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
      case 'On Way':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
    }
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.011,
            child: Text(
              '${data.id}',
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.from,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.to,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.10,
            child: Text(
              data.dateTime,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: 73,
              height: 26,
              decoration: BoxDecoration(
                color: bColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  data.state,
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
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.08,
            child: Row(
              children: [
                const Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'View Profile',
                      onTap: _openOrderDetails,
                      child: const Text('View Profile'), // Call function here
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openOrderDetails() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const OrderDetails(),
        ),
      ),
    );
  }
}
