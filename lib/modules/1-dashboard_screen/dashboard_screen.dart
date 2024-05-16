import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/chart_data.dart';
import 'package:pharma_store_administration_web/models/data_card_model.dart';
import 'package:pharma_store_administration_web/models/pharmacies_card_model.dart';
import 'package:pharma_store_administration_web/models/products_card_model.dart';
import 'package:pharma_store_administration_web/models/sales_data.dart';
import 'package:pharma_store_administration_web/models/stores_card_model.dart';
import 'package:pharma_store_administration_web/shared/components/constants.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget/dashboard_table/dashboard_table_widget.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'DashboardScreenRoute';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const DashboardScreen(),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<ChartData> data;
  late List<ChartData> data1;
  late TooltipBehavior _tooltip;
  List<SalesData> data2 = [
    SalesData('Jan', 0),
    SalesData('Jan', 35),
    SalesData('Feb', 28),
    SalesData('Mar', 34),
    SalesData('Apr', 32),
    SalesData('May', 30)
  ];
  bool isClicked = false;

  @override
  void initState() {
    data = [
      ChartData('Jan', 80),
      ChartData('Fab', 65),
      ChartData('Mar', 62),
      ChartData('Apr', 80),
      ChartData('May', 100),
      ChartData('Jun', 45),
      ChartData('Jul', 65),
      ChartData('Aug', 82),
      ChartData('Sep', 79),
      ChartData('Oct', 85),
      ChartData('Nov', 70),
      ChartData('Dec', 55),
    ];
    data1 = [
      ChartData('Jan', 45),
      ChartData('Fab', 39),
      ChartData('Mar', 58),
      ChartData('Apr', 62),
      ChartData('May', 65),
      ChartData('Jun', 35),
      ChartData('Jul', 62),
      ChartData('Aug', 65),
      ChartData('Sep', 43),
      ChartData('Oct', 80),
      ChartData('Nov', 62),
      ChartData('Dec', 50),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const ScreenHeader(screenName: 'Dashboard'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildDataCard(dataList[index], index),
                        itemCount: dataList.length),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor(bWhite90),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              primaryYAxis: const NumericAxis(
                                  minimum: 20, maximum: 100, interval: 20),
                              title: const ChartTitle(
                                text: 'Sales Analytics',
                                alignment: ChartAlignment.near,
                                textStyle: TextStyle(
                                  color: Color(0xff202224),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              legend: const Legend(
                                alignment: ChartAlignment.far,
                                isVisible: true,
                                position: LegendPosition.top,
                              ),
                              borderWidth: 45,
                              tooltipBehavior: _tooltip,
                              series: <CartesianSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                    legendIconType: LegendIconType.circle,
                                    dataSource: data,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    width: 0.4,
                                    spacing: 0.4,
                                    name: 'Sales',
                                    color:
                                        const Color.fromRGBO(74, 114, 255, 1)),
                                ColumnSeries<ChartData, String>(
                                    legendIconType: LegendIconType.circle,
                                    dataSource: data1,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    width: 0.4,
                                    spacing: 0.4,
                                    name: 'Profits',
                                    color:
                                        const Color.fromRGBO(173, 200, 255, 1)),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80.0, top: 60),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0x0c4a72ff),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: TextStyle(
                                color: HexColor(primary),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor(bWhite90),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SfCartesianChart(
                            primaryXAxis: const CategoryAxis(),
                            title: const ChartTitle(
                              text: 'Orders Analytics',
                              alignment: ChartAlignment.near,
                              textStyle: TextStyle(
                                color: Color(0xff202224),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            legend: const Legend(
                              alignment: ChartAlignment.far,
                              isVisible: true,
                              position: LegendPosition.top,
                            ),
                            borderWidth: 45,
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                            ),
                            series: <CartesianSeries<SalesData, String>>[
                              LineSeries<SalesData, String>(
                                dataSource: data2,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales,
                                name: 'Order',
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80.0, top: 80),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0x0c4a72ff),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: TextStyle(
                                color: HexColor(primary),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 35, right: 35, top: 35),
                          height: 466,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffdde1eb),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Top Pharmacies',
                                    style: TextStyle(
                                      color: HexColor(black),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0x0c4a72ff),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          color: HexColor(primary),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 45),
                              SizedBox(
                                height: 335,
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      _pharmaciesModel(pharmaciesList[index]),
                                  itemCount: pharmaciesList.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 35, right: 35, top: 35),
                          height: 466,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffdde1eb),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Top Stores',
                                    style: TextStyle(
                                      color: HexColor(black),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0x0c4a72ff),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          color: HexColor(primary),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 45),
                              SizedBox(
                                height: 335,
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      _storesModel(storesList[index]),
                                  itemCount: storesList.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 35, right: 35, top: 35),
                          height: 466,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xffdde1eb),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Top Products',
                                    style: TextStyle(
                                      color: HexColor(black),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0x0c4a72ff),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          color: HexColor(primary),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 45),
                              SizedBox(
                                height: 335,
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      _productModel(productsList[index]),
                                  itemCount: productsList.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 72 * 12.6,
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: HexColor(bWhite90),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Latest Orders',
                                style: TextStyle(
                                  color: Color(0xff202224),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  color: const Color(0x0c4a72ff),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      color: HexColor(primary),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          const DashboardTableWidget(),
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
    );
  }

  Widget buildDataCard(DataCardModel dataCardModel, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: HexColor(bWhite90),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataCardModel.cardTitle,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    dataCardModel.cardNumber,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'This Week',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: HexColor(white70),
                        ),
                      ),
                      items: itemList
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: HexColor(white70),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedItem,
                      iconStyleData:
                          IconStyleData(iconEnabledColor: HexColor(white70)),
                      onChanged: (String? value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 125,
                      ),
                      menuItemStyleData: const MenuItemStyleData(height: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor(dataCardModel.color),
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          dataCardModel.cardIcon,
                          color: HexColor(dataCardModel.color),
                        )),
                  ),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 65,
                    decoration: BoxDecoration(
                      color: dataCardModel.cardState
                          ? HexColor(warning).withOpacity(0.20999999344348907)
                          : HexColor('#ecfdf3'),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(children: [
                      const SizedBox(width: 10),
                      setPhoto(
                          kind: 1,
                          path: dataCardModel.cardImage,
                          width: 15,
                          height: 9),
                      const SizedBox(width: 10),
                      Text(
                        dataCardModel.cardPercentage,
                        style: TextStyle(
                          color: dataCardModel.cardState
                              ? const Color(0xfff15046)
                              : HexColor('#009881'),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pharmaciesModel(PharmaciesCardModel pharmaciesCardModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: HexColor(bWhite90),
            ),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 45,
                height: 45,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pharmaciesCardModel.pharmacyName,
                  style: TextStyle(
                    color: HexColor(black),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  pharmaciesCardModel.pharmacyUserName,
                  style: const TextStyle(
                    color: Color(0xff6b788e),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }

  Widget _storesModel(StoresCardModel storesCardModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: HexColor(bWhite90),
            ),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 45,
                height: 45,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storesCardModel.storeName,
                  style: TextStyle(
                    color: HexColor(black),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  storesCardModel.storeUserName,
                  style: const TextStyle(
                    color: Color(0xff6b788e),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }

  Widget _productModel(ProductsCardModel productsCardModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: HexColor(bWhite90),
            ),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 45,
                height: 45,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsCardModel.productName,
                  style: TextStyle(
                    color: HexColor(black),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  productsCardModel.productUserName,
                  style: const TextStyle(
                    color: Color(0xff6b788e),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
