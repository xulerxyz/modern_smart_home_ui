import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home_ui/constants/constant.dart';
import 'package:modern_smart_home_ui/screens/widgets/smart_devices_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List smartDevices = [
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 45.0,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.grey[800],
                    size: 45.5,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // welcome text

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
                  ),
                  Text("NIGEL JAURE",
                      style: GoogleFonts.bebasNeue(fontSize: 60)),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // grid

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices",
                  style: TextStyle(fontSize: 23.0, color: Colors.grey[800])),
            ),

            Expanded(
                child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(25.0),
              itemCount: smartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.2),
              itemBuilder: (context, index) {
                return SmartDeviceGridItem(
                  name: smartDevices[index][0],
                  iconPath: smartDevices[index][1],
                  powerOn: smartDevices[index][2],
                  onChanged: (value) {
                    setState(() {
                      smartDevices[index][2] = value;
                    });
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
