import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn
              ? Color.fromARGB(255, 253, 167, 240)
              : Color.fromARGB(221, 140, 243, 244),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    iconPath,
                    height: 70,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerOn
                              ? Color.fromARGB(255, 3, 2, 2)
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 1,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
