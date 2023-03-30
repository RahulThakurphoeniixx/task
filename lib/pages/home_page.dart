import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:alobhatechnologies/controller/auth_controller.dart';
import 'package:alobhatechnologies/models/product_data_model.dart';
import 'package:alobhatechnologies/pages/edit_profile.dart';
import 'package:alobhatechnologies/pages/product_search_deligate.dart';
import 'package:alobhatechnologies/pages/welcom_page.dart';
import 'package:alobhatechnologies/services/api_constent.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollmainController = ScrollController();
  AuthController authController = Get.put(AuthController());

  bool isShort = false;
  @override
  void initState() {
    _scrollmainController.addListener(() {
      if (_scrollmainController.position.pixels ==
          _scrollmainController.position.maxScrollExtent) {
        if (authController.productnextPageUrl.value != "") {
          authController.getProductData(
              pageUrl: authController.productnextPageUrl.value,
              isPaginatHit: true);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    var size = MediaQuery.of(context).size;

    /* 24 is for notification bar on Android */
    final double itemHeight = (size.height - kToolbarHeight - 13) / 2.4;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorPrimary,
          leading: IconButton(
            icon: const Icon(
              Icons.person_sharp,
              color: white,
            ),
            onPressed: () {
              Get.to(const EditProfileScreen());
            },
          ),
          title: text("Home", textColor: white, fontWeight: FontWeight.w700),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: white,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        authController: authController,
                        itemHeight: itemHeight,
                        itemWidth: itemWidth));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.filter_alt,
                color: white,
              ),
              onPressed: () {
                authController.productLoding(true);
                authController.productdataList
                    .sort((a, b) => b.price.compareTo(a.price));
                authController.productLoding(false);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: white,
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Get.offAll(const WelcomPage());
              },
            )
          ]),
      body: Obx(() {
        if (authController.productLoding.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            controller: _scrollmainController,
            padding: const EdgeInsets.all(0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0.0,
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / 297),
            ),
            itemCount: authController.productdataList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == authController.productdataList.length) {
                return authController.productnextPageUrl.value != ""
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CupertinoActivityIndicator(),
                      )
                    : const SizedBox();
              } else {
                return getiItemWiget(authController.productdataList[index]);
              }
            },
          );
        }
      }),
    );
  }

  // GridView productsWidget(
  //     {double? itemWidth, double? itemHeight, List<Products?>? products}) {
  //   return ;
  // }

  InkWell getiItemWiget(Products product) {
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
                    child: Image.network(imageBaseUrl + product.singleImage!,
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
                    border: Border.all(color: colorPrimary.withOpacity(0.8)),
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
                        text(product.title ?? "",
                            textColor: white, maxLine: 2, fontSize: 13.0),
                        text("₹${product.price}/-",
                            textColor: white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0)
                      ]),
                ),
              )
            ]),
      ),
    );
  }
}
