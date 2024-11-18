import 'package:e_commerce/E-commerce/presentation/manager/favorites/favorites_cubit.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoritesCubit.of(context);
    final finalList = provider.favorties;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final favoriteItems = finalList[index];
                  return Container(
                    height: ScreenSize.height(context) * 0.3,
                    width: ScreenSize.width(context),
                    decoration: BoxDecoration(
                        color: ColorsAsset.backgroundProductColor,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(favoriteItems.image.toString()),
                            SizedBox(
                              width: ScreenSize.width(context) * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    favoriteItems.title.toString(),
                                    style: FontAsset.font25WeightBold,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenSize.height(context) * 0.02,
                                ),
                                Text(
                                  favoriteItems.price.toString(),
                                  style: FontAsset.font16WeightBold,
                                ),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // removing items from the cart.
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
