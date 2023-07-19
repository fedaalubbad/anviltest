import '../../../../apilink.dart';
import '../../../../core/class/crud.dart';

class ProductsItemsData {
  Crud crud;
  ProductsItemsData(this.crud);

  getProductsItemsData() async {
    var response = await crud.getData(AppLink.getProducts);
    return response.fold((l) => l, (r) => r);
  }
}
