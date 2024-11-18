import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';
import 'package:e_commerce/E-commerce/presentation/manager/favorites/favorites_cubit.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productTitle,
    required this.price,
    required this.imageUrl,
    required this.onProductTap,
    required this.product,
  });

  final String productTitle;
  final String price;
  final String imageUrl;
  final void Function() onProductTap;
  final EcommerceModel product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<FavoritesCubit>(context);

    return GestureDetector(
      onTap: widget.onProductTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: ScreenSize.height(context) * 0.3,
        width: ScreenSize.width(context) * 0.4,
        decoration: BoxDecoration(
          color: ColorsAsset.backgroundProductColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    provider.tooglefavorites(widget.product);
                  });
                },
                child: Icon(
                    provider.isExist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 24,
                    color: Colors.red),
              ),
            ]),
            Image.network(
              widget.imageUrl,
              fit: BoxFit.fill,
              height: ScreenSize.height(context) * 0.1,
              width: ScreenSize.width(context) * 0.1,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: ScreenSize.width(context) * 0.1,
                    child: Text(
                      widget.productTitle,
                      style: FontAsset.font13WeightNormal,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                Text(
                  widget.price,
                  style:
                      FontAsset.font13WeightNormal.copyWith(color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
