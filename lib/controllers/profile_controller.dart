import 'package:get/get.dart';
import 'package:hey_istanbullum/model/comment_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';

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
}
