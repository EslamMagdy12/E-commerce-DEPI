import 'package:e_commerce/E-commerce/presentation/widgets/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.price});

  final String imageUrl;
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: ScreenSize.height(context) * 0.2,
            width: ScreenSize.width(context),
            decoration: BoxDecoration(
                color: ColorsAsset.backgroundProductColor,
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: ScreenSize.height(context) * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontAsset.font25WeightNormal,
                ),
                SizedBox(
                  height: ScreenSize.height(context) * 0.02,
                ),
                Text(
                  description,
                  style: FontAsset.font15WeightNormal,
                ),
                SizedBox(
                  height: ScreenSize.height(context) * 0.2,
                ),
                Text(price, style: FontAsset.font20WeightNormal),
                SizedBox(
                  height: ScreenSize.height(context) * 0.02,
                ),
                CustomButtonWithoutIcon(
                    title: 'Back',
                    height: 0.07,
                    width: 1,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    primaryColor: ColorsAsset.mainColor,
                    secondaryColor: ColorsAsset.secondaryColor,
                    fontSize: 16,
                    borderColor: ColorsAsset.mainColor)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
