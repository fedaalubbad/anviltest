import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../data/datasource/remote/ptoductsitems/productsitems.dart';
import '../functions/handlingdatacontrol.dart';
import '../models/product_model.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  ProductsItemsData productsItemsData = ProductsItemsData(
      Get
      .find()); // get.find get CRUD class we put it from initialbindings class
  // List data = [];
  List<ProductsResponse> productsList =<ProductsResponse>[].obs;

  late StatusRequest statusRequest;

  getProducts() async {
    statusRequest = StatusRequest.loading;
    var response = await productsItemsData.getProductsItemsData();
    print("=====================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List products = response;
      productsList.addAll(products.map((e) => ProductsResponse.fromJson(e)));

    } else {
      //there is no data returned
      //response['status'] equal failure
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  favProduct(isFav, ProductsResponse productsResponse, index) {
    update();
  }

  deleteProduct(int productId) {
    // print("=====================$response");
    // statusRequest = handlingData(response);
    // if (statusRequest == StatusRequest.success) {
    //   if (response['status'] == "success") {
    productsList.removeWhere((element) => element.id == productId);
    Get.rawSnackbar(
        title: "notice",
        messageText: const Text(
          "item removed ",
          style: TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2));
    //     //success add fav
    //   } else {
    //     //there is no data returned
    //     //response['status'] equal failure
    //     statusRequest = StatusRequest.failure;
    //   }
    // }
    update();
  }

  Map isFavorite = {};

  setFavorite(id, value) {
    isFavorite[id] = value;
    update();
  }


  increase( index){
    if(productsList[index].qty!<9) {
      productsList[index].qty!+1;
      update();
    }else{
  Get.rawSnackbar(title: "ops",messageText: const Text("There is no enough quantity",style: TextStyle(color: Colors.amber),),duration: const Duration(seconds: 2));
  }

  }
  decreaseQty(index){
    if(productsList[index].qty!>1) {
      productsList[index].qty!-1;
      update();
    }else{
  Get.rawSnackbar(title: "ops",messageText: const Text("There no less",style: TextStyle(color: Colors.amber),),duration: const Duration(seconds: 2));
  }

  }
}
