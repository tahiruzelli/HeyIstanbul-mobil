import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/register_controller.dart';
import 'package:hey_istanbullum/globals/widgets/my_textfield.dart';
import 'package:hey_istanbullum/globals/widgets/rounded_button.dart';
import 'package:hey_istanbullum/globals/widgets/top_bar.dart';
import 'package:hey_istanbullum/views/location/location_list_page.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';

class RegisterView extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<RegisterView> {
  final RegisterController _registerController = Get.put(RegisterController());
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TopBar(),
            inputArea(size),
            _routeRegisterWidget(context),
          ],
        ),
      ),
    );
  }

  Column inputArea(Size size) {
    return Column(
      children: [
        _nicknameForm(),
        _passwordForm(),
        const SizedBox(height: 20),
        _registerButton(size),
      ],
    );
  }

  _routeRegisterWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 42, left: 42, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Hesabınız var mı ?",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          FlatButton(
            child: const Text(
              "Giriş",
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Get.to(LoginView());
            },
          )
        ],
      ),
    );
  }

  _registerButton(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.22),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.green,
        onPressed: () {},
        child: Obx(
          () => RoundedButton(
            text: _registerController.registerLoading.value
                ? "Kayıt Yapılıyor"
                : "Kayıt Ol",
            press: () {
              _registerController.register();
            },
          ),
        ),
      ),
    );
  }

  _nicknameForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        controller: _registerController.nicknameController,
        labelText: "Kullanıcı Adı",
        hintText: 'Kullanıcı Adı',
      ),
    );
  }

  _passwordForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        controller: _registerController.passwordController,
        labelText: "Password",
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        isPassword: passwordVisible,
        validator: (String val) {
          if (val.isEmpty) {
            return "Şifre boş bırakılamaz*";
          }
          if (val.length < 7) {
            return "En az 7 karakter kullanılmalı";
          }
        },
      ),
    );
  }
}
