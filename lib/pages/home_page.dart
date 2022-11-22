import 'package:flutter/material.dart';
import 'package:perfil_peronal/util/smart_devices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 15;

  //lista
  List mySmartDevices = [
    ["Living Room *7 devices", "lib/icons/living_rooms.png", true],
    ["Bead Room *5 devices", "lib/icons/Bad.png", false],
    ["Bath Room  *4 devices", "lib/icons/tina.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.notifications_none,
                    size: 45,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello,Shea Lewis',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Well come to your Home',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Container(
                height: 150.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 164, 225),
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[850]!.withOpacity(0.29),
                        offset: const Offset(-10, 10),
                        blurRadius: 10,
                        spreadRadius: 10)
                  ],
                  image: const DecorationImage(
                      image: AssetImage('lib/icons/climas.png')),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Text(
                      "Your Rooms",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 112, 204, 249),
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 12, 101, 217),
                          ),
                        ),
                        Container(
                          child: Text(
                            "add",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 23, 117, 194)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mySmartDevices.length,
                padding: EdgeInsets.all(25),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
