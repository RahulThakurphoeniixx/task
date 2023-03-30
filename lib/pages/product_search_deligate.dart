import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/controller/auth_controller.dart';
import 'package:alobhatechnologies/models/product_data_model.dart';
import 'package:alobhatechnologies/services/api_constent.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  // List<Products?>? products;
  double? itemWidth;
  double? itemHeight;
  AuthController? authController;
  CustomSearchDelegate({
    required this.itemWidth,
    required this.itemHeight,
    required this.authController
  });

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: colorPrimary,
        ),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: colorPrimary,
      ),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Products> matchQuery = [];
    for (var product in authController!.productdataList) {
      if (product!.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return productsWidget(
        itemHeight: itemHeight!, itemWidth: itemWidth, products: matchQuery);
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Products> matchQuery = [];
    for (var product in authController!.productdataList) {
      if (product!.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return productsWidget(
        itemHeight: itemHeight!, itemWidth: itemWidth, products: matchQuery);
  }

  GridView productsWidget(
      {double? itemWidth, double? itemHeight, List<Products?>? products}) {
    return GridView.builder(
      padding: const EdgeInsets.all(0.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0.0,
        crossAxisCount: 2,
        childAspectRatio: (itemWidth! / 297),
      ),
      itemCount: products!.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Get.to(ProductDetails(
            //   product: products[index]!,
            // ));
          },
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(left: 12, right: 12),
            width: MediaQuery.of(context).size.width / 2 - 28,
            // color: Colors.red,
            // decoration: BoxDecoration(
            //     color: appbackground,
            //     border: Border.all(color: colorPrimary),
            //     borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      height: 180,
                      // width: MediaQuery.of(context).size.width / 2 - 28,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: colorPrimaryLight,
                          border: Border.all(color: colorPrimaryLight),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        child: Image.network(
                            imageBaseUrl + products[index]!.singleImage!,
                            fit: BoxFit.cover),
                      ),
                      // child: SizedBox(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(0.0),
                      //     child: Image.network(
                      //         products[index]!.image!.src ?? "",
                      //         fit: BoxFit.fill),
                      //   ),
                      // ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        border:
                            Border.all(color: colorPrimary.withOpacity(0.8)),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    height: 92,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            text(products[index]!.title ?? "",
                                textColor: white, maxLine: 2, fontSize: 13.0),
                            text("₹${products[index]!.price}/-",
                                textColor: white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0)
                          ]),
                    ),
                  )
                ]),
          ),
        );
      },
    );
  }
}
