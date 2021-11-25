import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/globals/widgets/my_textfield.dart';
import 'package:hey_istanbullum/globals/widgets/top_bar.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';

class RegisterView extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<RegisterView> {
  bool passwordVisible = true;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          TopBar(),
          const SizedBox(height: 30),
          _nameForm(),
          _lastNameForm(),
          _emailForm(),
          _passwordForm(),
          const SizedBox(height: 30),
          _registerButton(size),
          const SizedBox(height: 20),
          _routeRegisterWidget(context),
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
    bool isOkey = false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.22),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.green,
        onPressed: () {},
        child: const Text(
          "Üye Ol",
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
        validator: (String val) {
          if (val.isEmpty) {
            return "E Posta boş bırakılamaz*";
          }
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val);
          if (!emailValid) {
            return "Geçersiz Format";
          }
        },
      ),
    );
  }

  _nameForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        labelText: "İsim",
        hintText: 'İsim',
        isEmail: true,
        validator: (String val) {
          if (val.isEmpty) {
            return "Soyisim boş bırakılamaz*";
          }
        },
      ),
    );
  }

  _lastNameForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
        labelText: "Soy isim",
        hintText: 'Soy isim',
        isEmail: true,
        validator: (String val) {
          if (val.isEmpty) {
            return "Soyisim boş bırakılamaz*";
          }
        },
      ),
    );
  }

  _passwordForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: MyTextFormField(
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
