import 'package:flutter/material.dart';
import 'package:practical_2/models/tool_model.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/widgets/custom_icon_tool.dart';

class CustomToolCard extends StatelessWidget {
  final ToolModel tool;
  final bool isFetured;
  final VoidCallback addFunc;

  const CustomToolCard({
    super.key,
    required this.tool,
    required this.isFetured,
    required this.addFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.seconary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isFetured
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: tool.iconBgColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "FEATURED",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${tool.price}",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "/day",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                )
              : SizedBox(),

          CustomIconTool(
            width: double.infinity,
            height: 120,
            iconSize: 60,
            tool: tool,
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tool.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !isFetured
                  ? Row(
                      children: [
                        Text(
                          "\$${tool.price}",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "/day",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
          Text(
            tool.subtitle,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),

          SizedBox(height: 10),
          InkWell(
            onTap: addFunc,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: isFetured
                      ? AppColors.primary
                      : AppColors.textSecondary,
                ),
              ),
              child: Center(
                child: Text(
                  "+ Add",
                  style: TextStyle(
                    color: isFetured
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
