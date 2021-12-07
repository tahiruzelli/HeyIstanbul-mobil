import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_list_controller.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';
import 'package:hey_istanbullum/globals/widgets/comment_card.dart';

class LocationDetail extends StatelessWidget {
  LocationController locationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Detay Sayfası', isFavorite: true),
      body: Column(
        children: [
          title,
          Obx(
            () => locationController.commentsLoading.value
                ? const CupertinoActivityIndicator()
                : comments,
          ),
          textField,
        ],
      ),
    );
  }

  Padding get textField {
    return Padding(
      padding: const EdgeInsets.only(left: 14, bottom: 20.0, right: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Theme(
            data: ThemeData(
              primaryColorDark: Colors.red,
            ),
            child: Container(
              width: Get.width - 28,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  minLines: 1,
                  maxLines: 4,
                  controller: locationController.commentTextFieldController,
                  decoration: InputDecoration(
                    hintText: 'Yorumunu yaz...',
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        FocusManager.instance.primaryFocus.unfocus();
                        locationController.createComment();
                      },
                      child: const Icon(Icons.send, color: Colors.blue),
                    ),
                  ),
                  onFieldSubmitted: (data) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded get comments {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: locationController.commentList.length,
          itemBuilder: (context, index) {
            return CommentCard(locationController.commentList[index]);
          },
        ),
      ),
    );
  }

  Row get title {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          locationController.choosenLocationDetail['title'],
          style: titleStyle,
        ),
        locationController.getLocationIcon
      ],
    );
  }

  TextStyle get titleStyle {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }
}
