import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/controllers/profile_controller.dart';
import 'package:hey_istanbullum/globals/widgets/comment_card.dart';

class MyProfile extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    profileController.getMyComments();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              GetStorage().read('nickname').toString(),
              style: titleStyle,
            ),
          ),
          Obx(
            () => profileController.myCommentsLoading.value
                ? const Center(child: CupertinoActivityIndicator())
                : Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: profileController.myComments.length,
                        itemBuilder: (context, index) {
                          return CommentCard(
                              profileController.myComments[index], true);
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  TextStyle get titleStyle {
    return const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  }
}
