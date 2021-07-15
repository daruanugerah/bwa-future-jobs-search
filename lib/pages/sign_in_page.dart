import 'package:flutter/material.dart';
import 'package:future_jobs/models/user_model.dart';
import 'package:future_jobs/providers/auth_provider.dart';
import 'package:future_jobs/providers/user_provider.dart';
import 'package:future_jobs/theme.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Build Your Career',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget illustration() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Center(
          child: Image.asset(
            'assets/image_sign_in.png',
            width: 260,
          ),
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: inputFieldColor,
              ),
              child: Center(
                child: TextFormField(
                  controller: emailController,
                  cursorColor: primaryColor,
                  style: purpleTextStyle.copyWith(fontSize: 14),
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: inputFieldColor,
              ),
              child: Center(
                child: TextFormField(
                  controller: passwordController,
                  cursorColor: primaryColor,
                  obscureText: true,
                  style: purpleTextStyle.copyWith(fontSize: 14),
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.only(top: 40),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TextButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showFlushBar('semua field harus diisi', context);
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel userModel = await authProvider.signIn(
                      emailController.text,
                      passwordController.text,
                    );

                    setState(() {
                      isLoading = false;
                    });

                    if (userModel == null) {
                      showFlushBar('email atau password salah', context);

                    } else {
                      userProvider.userModel = userModel;

                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    }
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
      );
    }

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          //bottom: 20,
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Create New Account',
              style: greyTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            scrollDirection: Axis.vertical,
            children: [
              header(),
              illustration(),
              inputEmail(),
              inputPassword(),
              signInButton(),
              signUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
