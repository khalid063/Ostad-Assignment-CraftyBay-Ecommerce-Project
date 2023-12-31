import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController{

  bool _addToCartInProgress = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgress;
  String get message => _message;

  Future<bool> addToCart(int productId, String color, String size, int quantity) async {
    _addToCartInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity
    });
    _addToCartInProgress = false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      _message = 'Add to cart Failed.';
      return false;
    }

  }

}