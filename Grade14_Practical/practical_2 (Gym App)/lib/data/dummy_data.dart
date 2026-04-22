import 'package:flutter/material.dart';
import 'package:practical_2/models/tool_model.dart';

List<ToolModel> dummyTools = [
  ToolModel(
    id: 1,
    title: "Pro Drill",
    subtitle:
        "High-torque brushless motor with precision depth control for professional cabinetry and farming.",
    icon: Icons.hardware,
    iconColor: Color(0xFF1B55DB),
    iconBgColor: Color(0xFFE8F0Fd),
    price: 25,
  ),
  ToolModel(
    id: 2,
    title: "Circular Saw",
    subtitle:
        "Precision titp cuts with laser guidance and integrated dust collection.",
    icon: Icons.cut,
    iconColor: Color(0xFF384153),
    iconBgColor: Color(0xFFE8F6E9),
    price: 30,
  ),
  ToolModel(
    id: 3,
    title: "Pressure Washer",
    subtitle: "3000 PSI electric power for deep surface restoration.",
    icon: Icons.water_drop,
    iconColor: Color(0xFF394353),
    iconBgColor: Color(0xFFE4F2FD),
    price: 40,
  ),
];

ToolModel firstTool = ToolModel(
  id: 0,
  title: "temp",
  subtitle: "temp2",
  icon: Icons.hardware,
  iconColor: const Color.fromRGBO(255, 255, 255, 0.5),
  iconBgColor: const Color.fromRGBO(255, 255, 255, 0.2),
  price: 0,
);
