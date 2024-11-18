import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';
import 'package:e_commerce/E-commerce/presentation/manager/products/products_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/home/description_widget.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/home/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).emitProducts();
  }

  List<EcommerceModel> products = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Shyaka'), centerTitle: false, actions: [
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
            icon: const Icon(Icons.search)),
      ]),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  products = state.ecommerceList;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 8.0, // spacing between rows
                      crossAxisSpacing: 8.0, // spacing between columns
                    ),
                    padding: const EdgeInsets.all(8.0),
                    // padding around the grid
                    itemCount: products.length,
                    // total number of items
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductWidget(
                          productTitle: products[index].title.toString(),
                          price: '${products[index].price}\$',
                          imageUrl: products[index].image.toString(),
                          onProductTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionWidget(
                                        imageUrl:
                                            products[index].image.toString(),
                                        title: products[index].title.toString(),
                                        description: products[index]
                                            .description
                                            .toString(),
                                        price: '${products[index].price}\$')));
                          },
                          product: products[index],
                        ),
                      );
                    },
                  );
                } else if (state is ProductsLoading) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('some thing went wrong'),
                  );
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
