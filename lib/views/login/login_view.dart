import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/globals/widgets/my_textfield.dart';
import 'package:hey_istanbullum/globals/widgets/top_bar.dart';
import 'package:hey_istanbullum/views/register/register_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopBar(),
          SizedBox(height: size.height * 0.1),
          _emailForm(),
          _passwordForm(),
          const SizedBox(height: 30),
          _loginButton(size),
          const SizedBox(height: 20),
          _routeRegisterWidget(context),
          _forgetPassword(context),
        ],
      ),
    );
  }

  _routeRegisterWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 42, left: 42, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Hesabınız yok mu?",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          FlatButton(
            child: const Text(
              "Üye Ol",
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Get.to(RegisterView());
            },
          )
        ],
      ),
    );
  }

  _forgetPassword(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 42, left: 42, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: const Text(
              "Şifremi Unuttum",
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  _loginButton(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.22),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.green,
        onPressed: () {},
        child: const Text(
          "Giriş Yap",
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  _emailForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        labelText: "Email",
        hintText: 'Email',
        isEmail: true,
      ),
    );
  }

  _passwordForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        labelText: "Şifre",
        hintText: 'Şifre',
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
        validator: (String value) {
          if (value.length < 7) {
            return 'Password should be minimum 7 characters';
          }
          return null;
        },
      ),
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
