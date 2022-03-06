import 'package:get/get.dart';
import 'package:shop_getx/models/product.dart';
import 'package:shop_getx/services/remote_services.dart';

class ProductController extends GetxController {
  // var productList = RxList<Product>[].obs;
  var isLoading = true.obs;
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchPorducts();
      if (products != []) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
