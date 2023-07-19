import 'package:anviltest/controllers/products_controllers.dart';
import 'package:anviltest/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<ProductsController>(builder: (controller) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return ProductItemWidget(
                productsResponse: controller.productsList[index],
                () {
                  controller.increase(index);
                },
                () {
                  controller.decreaseQty(index);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(),
              );
            },
            itemCount: controller.productsList.length);
      }),
    );
  }
}
