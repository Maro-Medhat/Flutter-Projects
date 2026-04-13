import 'package:flutter/material.dart';
import 'package:practical_1/model/cloth_model.dart';
import 'package:practical_1/theme/app_colors.dart';

class CustomClothCard extends StatelessWidget{
  final ClothModel cloth;
  final VoidCallback addCloth;
  const CustomClothCard(
    {
      super.key,
      required this.cloth,
      required this.addCloth,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/details', arguments: cloth),
          child: Stack(
            children: [
              Container(
                width: 250,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      cloth.imgPath,
                    ),
                  )
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  onTap: () => addCloth(),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          cloth.title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
          ),
        ),  
        Text(
          "\$${cloth.price}",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),   
      ],
    );
  }}