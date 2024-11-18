import 'package:e_commerce/E-commerce/presentation/manager/products/products_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/home/description_widget.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductMethod {
  static BlocBuilder<ProductsCubit, ProductsState> productsSearch(
      List<dynamic> productsList, String query) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is ProductsSuccess) {
        productsList = (state)
            .ecommerceList
            .where((element) => element.title == query)
            .toList();
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12),
            scrollDirection: Axis.vertical,
            itemCount: productsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionWidget(
                                  imageUrl:
                                      productsList[index].image.toString(),
                                  title: productsList[index].title.toString(),
                                  description: productsList[index]
                                      .description
                                      .toString(),
                                  price: productsList[index].price.toString(),
                                )));
                  },
                  child: Container(
                    height: ScreenSize.height(context) * 0.27,
                    width: ScreenSize.width(context) * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Color(0x66000000), blurRadius: 1)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: ScreenSize.height(context) * 0.08,
                                width: ScreenSize.width(context) * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          productsList[index].image.toString()),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: ScreenSize.width(context) * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productsList[index].title.toString(),
                                    style: FontAsset.font15WeightNormal
                                        .copyWith(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    productsList[index].category.toString(),
                                    style: FontAsset.font15WeightNormal,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '${productsList[index].price.toString()}\$',
                                    style: FontAsset.font16WeightBold.copyWith(
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenSize.height(context) * 0.02,
                          ),
                          Text(
                            productsList[index].description.toString(),
                            style: FontAsset.font13WeightNormal
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is ProductsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text('Some thing went wrong'),
        );
      }
    });
  }
}
