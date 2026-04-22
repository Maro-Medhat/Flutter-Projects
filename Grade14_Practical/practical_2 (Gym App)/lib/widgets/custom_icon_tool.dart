import 'package:flutter/material.dart';
import 'package:practical_2/models/tool_model.dart';

class CustomIconTool extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
  final ToolModel tool;

  const CustomIconTool({
    super.key,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.tool,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: tool.iconBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(tool.icon, size: iconSize, color: tool.iconColor),
      ),
    );
  }
}
