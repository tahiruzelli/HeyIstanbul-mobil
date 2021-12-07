import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/model/comment_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';

class ProfileController extends GetxController {
  FetchData f = FetchData();
  List<CommentModel> myComments = [];
  var myCommentsLoading = false.obs;
  Future getMyComments() {
    myCommentsLoading.value = true;
    f.getMyComments().then((value) {
      myComments =
          (value as List).map((e) => CommentModel.fromJson(e)).toList();
      myCommentsLoading.value = false;
    });
  }

  void exitApp() {
    GetStorage().remove('jwtToken');
    GetStorage().remove('id');
    GetStorage().remove('nickname');
    Get.offAll(LoginView());
  }
}
