import 'package:ev_ui/auth_wrapper.dart';
import 'package:ev_ui/constants/color.dart';
import 'package:ev_ui/dao/userDAO.dart';
import 'package:ev_ui/screens/homepage.dart';
import 'package:ev_ui/screens/navigation.dart';
import 'package:ev_ui/screens/registration/pending.dart';
import 'package:ev_ui/screens/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDAO userDAO = Provider.of<UserDAO>(context);
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                      'REGISTER',
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
                            TextFormField(
                              controller: usernameController,
                              validator: (val) =>
                                  val!.isEmpty ? 'Name can\'t be empty' : null,
                              style: TextStyle(
                                color: Color(0xff107163),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Name',
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
                              controller: emailController,
                              validator: (val) =>
                                  val!.isEmpty ? 'Email can\'t be empty' : null,
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
                                Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    child: Text(
                                      'Back to Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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
                                        bool res = await userDAO.register(
                                            name: usernameController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                      } else {
                                        print('error credentials');
                                      }
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
