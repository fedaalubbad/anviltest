import 'package:anviltest/controllers/products_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/handle_text.dart';
import '../models/product_model.dart';

class ProductItemWidget extends GetView<ProductsController> {
  final ProductsResponse productsResponse;
  final void Function()? onIncrease;
  final void Function()? onDecrease;

  const ProductItemWidget(this.onIncrease, this.onDecrease,
      {super.key, required this.productsResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 65, vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38, width: 2),
              borderRadius: BorderRadius.circular(25)),
          child: Stack(
            children: [
              Image.network(
                productsResponse.image!,
                fit: BoxFit.contain,
                width: Get.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        controller.deleteProduct(productsResponse.id!);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      )),
                  GetBuilder<ProductsController>(builder: (controller) {
                    return InkWell(
                        onTap: () {
                          if (controller.isFavorite[productsResponse.id] ==
                              '0'||controller.isFavorite[productsResponse.id]==null) {
                            controller.setFavorite(productsResponse.id, "1");
                          } else {
                            controller.setFavorite(productsResponse.id, "0");
                          }
                        },
                        child: Icon(
                          controller.isFavorite[productsResponse.id] == "1"
                              ? Icons.favorite
                              : Icons.favorite,
                          size: 25,
                          color:
                              controller.isFavorite[productsResponse.id] == "1"
                                  ? Colors.red
                                  : Colors.grey,
                        ));
                  }),
                ],
              )
            ],
          ),
        ),
        Text(handleText(productsResponse.title!)),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(productsResponse.price.toString()),
                 Row(
                  children: [
                    InkWell(
                      onTap: onDecrease,
                      child: const Icon(
                        Icons.arrow_left,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        margin:const EdgeInsets.symmetric(horizontal: 5),
                        child: Obx(() =>Text(productsResponse.qty.value.toString()))),
                    InkWell(
                      onTap: onIncrease,
                      child: const Icon(
                        Icons.arrow_right,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('${productsResponse.rating!.rate}'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
