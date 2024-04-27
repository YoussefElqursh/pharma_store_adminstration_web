import 'package:flutter/material.dart';
import '../../layouts/home_layout.dart';
import '../../shared/components/widget/back_screen_header.dart';

class PharmacyProfilesScreen extends StatefulWidget {
  static const String routeName = 'PharmacyProfilesScreenRoute';

  const PharmacyProfilesScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PharmacyProfilesScreen(),
    );
  }
  @override
  State<PharmacyProfilesScreen> createState() => _PharmacyProfilesScreen();
}

class _PharmacyProfilesScreen extends State<PharmacyProfilesScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(appBar: PreferredSize(
      preferredSize: const Size(double.infinity, 75),
      child: BackScreenHeader(
          goBack: ()=>Navigator.push(context,HomeScreen.route()),
          backScreenName: 'Pharmacies',
        ),
    ),

      body: const Column(
        children: [

        ],
      ),
    );
  }

}
