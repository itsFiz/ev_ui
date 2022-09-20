// import 'package:flutter/material.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   String loginerror = '';
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     UserDAO userDAO = UserDAO();
//     GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   alignment: Alignment.bottomLeft,
//                   color: Color(0xff107163),
//                   height: 200,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 25, bottom: 20),
//                     child: Text(
//                       'SIGN IN',
//                       style: TextStyle(
//                           fontSize: 35,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xffFFFFFF)),
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   color: Color(0xff107163),
//                   height: 2,
//                   thickness: 2,
//                 ),
//                 Expanded(
//                   child: Form(
//                     key: _formKey,
//                     child: Container(
//                       color: Color(0xffffffff),
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 60, vertical: 80),
//                         child: Column(
//                           children: [
//                             Text(
//                               loginerror,
//                               style: TextStyle(color: Colors.red),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               controller: usernameController,
//                               validator: (val) => val!.isEmpty
//                                   ? 'Username can\'t be empty'
//                                   : null,
//                               style: TextStyle(
//                                 color: Color(0xff107163),
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Identity No.',
//                                 hintStyle: TextStyle(color: Color(0xffA5A3A3)),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     width: 2,
//                                     style: BorderStyle.solid,
//                                     color: Color(0xff107163),
//                                   ),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 2,
//                                       style: BorderStyle.solid,
//                                       color: Color(0xff107163),
//                                     )),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 2,
//                                       style: BorderStyle.solid,
//                                       color: Color(0xff107163),
//                                     )),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       width: 2,
//                                       color: Color(0xff107163),
//                                     )),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               controller: passwordController,
//                               validator: (val) => val!.isEmpty
//                                   ? 'Password can\'t be empty'
//                                   : null,
//                               style: TextStyle(
//                                 color: Color(0xff107163),
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: 'Password',
//                                 hintStyle: TextStyle(color: Color(0xffA5A3A3)),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     width: 2,
//                                     style: BorderStyle.solid,
//                                     color: Color(0xff107163),
//                                   ),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     width: 2,
//                                     style: BorderStyle.solid,
//                                     color: Color(0xff107163),
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     width: 2,
//                                     style: BorderStyle.solid,
//                                     color: Color(0xff107163),
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     width: 2,
//                                     color: Color(0xff107163),
//                                   ),
//                                 ),
//                               ),
//                               obscureText: true,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 35,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffA5A3A3),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: TextButton(
//                                     onPressed: () {
//                                       Navigator.pushReplacementNamed(
//                                           context, 'start');
//                                     },
//                                     child: Text(
//                                       'Back',
//                                       style:
//                                           TextStyle(color: Color(0xff107163)),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(child: SizedBox.shrink()),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Expanded(child: SizedBox.shrink()),
//                                 Container(
//                                   height: 35,
//                                   width: 90,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xff107163),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: TextButton(
//                                     onPressed: () async {
//                                       if (_formKey.currentState!.validate()) {
//                                         dynamic res = await userDAO.login(
//                                             usernameController.text,
//                                             passwordController.text);
//                                         print(res);
//                                         if (res != null) {
//                                           Navigator.pushReplacementNamed(
//                                               context, 'home',
//                                               arguments: {'username': res});
//                                         }
//                                         print('Login error');
//                                         setState(() {
//                                           loginerror =
//                                               'Invalid username/password';
//                                         });
//                                       } else {
//                                         print('error credentials');
//                                       }
//                                     },
//                                     child: Text(
//                                       'Login',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 40),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pushReplacementNamed(
//                                     context, 'signup');
//                               },
//                               child: Text(
//                                 'Didn\'t have an account? Sign up here',
//                                 style: TextStyle(
//                                     decoration: TextDecoration.underline),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
