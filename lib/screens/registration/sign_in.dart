import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/screens/registration/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/navigation.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String loginerror = 'Invalid email or password';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserDAO userDAO = Provider.of<UserDAO>(context, listen: false);
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  color: Color(0xff107163),
                  height: 200,
                  child: Container(
                    margin: EdgeInsets.only(left: 25, bottom: 20),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xff107163),
                  height: 2,
                  thickness: 2,
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      color: Color(0xffffffff),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                        child: Column(
                          children: [
                            Text(
                              loginerror,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: usernameController,
                              validator: (val) => val!.isEmpty
                                  ? 'Username can\'t be empty'
                                  : null,
                              style: TextStyle(
                                color: Color(0xff107163),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Color(0xffA5A3A3)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff107163),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Color(0xff107163),
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xff107163),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (val) => val!.isEmpty
                                  ? 'Password can\'t be empty'
                                  : null,
                              style: TextStyle(
                                color: Color(0xff107163),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Color(0xffA5A3A3)),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff107163),
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff107163),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: Color(0xff107163),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff107163),
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                // Container(
                                //   height: 35,
                                //   decoration: BoxDecoration(
                                //     color: Color(0xffA5A3A3),
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child: TextButton(
                                //     onPressed: () {
                                //       Navigator.pushReplacementNamed(
                                //           context, 'start');
                                //     },
                                //     child: Text(

                                //       'Back',
                                //       style:
                                //           TextStyle(color: Color(0xff107163)),
                                //     ),
                                //   ),
                                // ),
                                Expanded(child: SizedBox.shrink()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child: SizedBox.shrink()),
                                Container(
                                  height: 35,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Color(0xff107163),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        dynamic res = await userDAO.login(
                                          email: usernameController.text,
                                          password: passwordController.text,
                                        );
                                        if (res == true) {
                                          Navigator.pop(context);
                                        }

                                        setState(() {
                                          loginerror =
                                              'Invalid username/password';
                                        });
                                      } else {
                                        print('error credentials');
                                      }
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                'Didn\'t have an account? Sign up here',
                                style: TextStyle(
                                    color: primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
