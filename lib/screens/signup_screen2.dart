import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing/resources/auth_methods.dart';
import 'package:testing/responsive/mobile_screen_layout.dart';
import 'package:testing/responsive/responsive_layout_screen.dart';
import 'package:testing/responsive/web_screen_layout.dart';
import 'package:testing/screens/login_screen.dart';
import 'package:testing/utils/colors.dart';
// import 'package:testing/utils/global_variable.dart';
import 'package:testing/utils/utils.dart';
import 'package:testing/widgets/text_field_input.dart';
import 'package:testing/screens/signup_screen1.dart';
import 'package:testing/screens/signup_screen3.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({Key? key}) : super(key: key);

  @override
  _SignupScreenState2 createState() => _SignupScreenState2();
}

class _SignupScreenState2 extends State<SignupScreen2> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _neighborhoodController.dispose();
    _cityController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().Signupuser2(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        neighborhood: _neighborhoodController.text,
        city: _cityController.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      // showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  // void navigatetoSignup2() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const SignupScreen2(),
  //     ),
  //   );
  // }

    void navigatetoSignup3() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen3(),
      ),
    );
  }

  void navigatetoLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor2,
        // title: const Text('Select your Neighborhood:'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              const Align(
                alignment: const Alignment(-0.95, -0.5),
                child: Text(
                  "Username",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 45),
              TextFieldInput(
                textEditingController: _cityController,
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
              ),

              const SizedBox(height: 45),
              const Align(
                alignment: const Alignment(-0.95, -0.5),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 40),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email address',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: const Alignment(-0.95, -0.5),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 40),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 100),
              // Flexible(child: Container(), flex: 2),
              // // svg image
              // SvgPicture.asset(
              //   'assets/Group 4.svg',
              //   color: primaryColor2,
              //   height: 64,
              // ),
              // const SizedBox(height: 64),
              // // circular widget for image insertion
              // Stack(
              //   children: [
              //     _image != null
              //         ? CircleAvatar(
              //             radius: 56,
              //             backgroundImage: MemoryImage(_image!),
              //           )
              //         : const CircleAvatar(
              //             radius: 56,
              //             backgroundImage: NetworkImage(
              //                 'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg'),
              //           ),
              //     Positioned(
              //         bottom: -13,
              //         left: 80,
              //         child: IconButton(
              //           onPressed: selectImage,
              //           icon: const Icon(
              //             Icons.add_a_photo_sharp,
              //             color: Colors.black45,
              //           ),
              //         ))
              //   ],
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // // text field input for username
              // TextFieldInput(
              //   textEditingController: _usernameController,
              //   hintText: 'Enter your username',
              //   textInputType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // // text field email
              // TextFieldInput(
              //   textEditingController: _emailController,
              //   hintText: 'Enter your email',
              //   textInputType: TextInputType.emailAddress,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // // text field for password
              // TextFieldInput(
              //   textEditingController: _passwordController,
              //   hintText: 'Enter your password',
              //   textInputType: TextInputType.text,
              //   isPass: true,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // // text field input for bio
              // TextFieldInput(
              //   textEditingController: _bioController,
              //   hintText: 'Enter your bio',
              //   textInputType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // button login
              InkWell(
                onTap: navigatetoSignup3,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text(
                          'Next',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(78),
                        ),
                      ),
                      color: Colors.purple),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              // transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Already have an account? "),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigatetoLogin,
                    child: Container(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primaryColor2,
//         // title: const Text('Select your Neighborhood:'),
//         centerTitle: false,
//       ),
//       body: SafeArea(
//         child: Container(
//           child: const Align(
//             alignment: Alignment(-0.9, -0.8),
//             child: Text(
//               'Enter Your Username:',
//               style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//           ),
//         ),
//       ),

//       // body: SafeArea(
//       //   child: Container(
//       //     padding: const EdgeInsets.symmetric(horizontal: 32),
//       //     width: double.infinity,
//       //     child: Column(
//       //       crossAxisAlignment: CrossAxisAlignment.center,
//       //       children: [
//       //         Flexible(child: Container(), flex: 2),
//       //         // svg image
//       //         SvgPicture.asset(
//       //           'assets/Group 4.svg',
//       //           color: primaryColor2,
//       //           height: 64,
//       //         ),
//       //         const SizedBox(height: 64),
//       //         // circular widget for image insertion
//       //         Stack(
//       //           children: [
//       //             _image != null
//       //                 ? CircleAvatar(
//       //                     radius: 56,
//       //                     backgroundImage: MemoryImage(_image!),
//       //                   )
//       //                 : const CircleAvatar(
//       //                     radius: 56,
//       //                     backgroundImage: NetworkImage(
//       //                         'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg'),
//       //                   ),
//       //             Positioned(
//       //                 bottom: -13,
//       //                 left: 80,
//       //                 child: IconButton(
//       //                   onPressed: selectImage,
//       //                   icon: const Icon(
//       //                     Icons.add_a_photo_sharp,
//       //                     color: Colors.black45,
//       //                   ),
//       //                 ))
//       //           ],
//       //         ),
//       //         const SizedBox(
//       //           height: 24,
//       //         ),
//       //         // text field input for username
//       //         TextFieldInput(
//       //           textEditingController: _usernameController,
//       //           hintText: 'Enter your username',
//       //           textInputType: TextInputType.text,
//       //         ),
//       //         const SizedBox(
//       //           height: 24,
//       //         ),
//       //         // text field email
//       //         TextFieldInput(
//       //           textEditingController: _emailController,
//       //           hintText: 'Enter your email',
//       //           textInputType: TextInputType.emailAddress,
//       //         ),
//       //         const SizedBox(
//       //           height: 24,
//       //         ),
//       //         // text field for password
//       //         TextFieldInput(
//       //           textEditingController: _passwordController,
//       //           hintText: 'Enter your password',
//       //           textInputType: TextInputType.text,
//       //           isPass: true,
//       //         ),
//       //         const SizedBox(
//       //           height: 24,
//       //         ),
//       //         // text field input for bio
//       //         TextFieldInput(
//       //           textEditingController: _bioController,
//       //           hintText: 'Enter your bio',
//       //           textInputType: TextInputType.text,
//       //         ),
//       //         const SizedBox(
//       //           height: 24,
//       //         ),
//       //         // button login
//       //         InkWell(
//       //           onTap: signUpUser,
//       //           child: Container(
//       //             child: _isLoading
//       //                 ? const Center(
//       //                     child: CircularProgressIndicator(
//       //                       color: primaryColor,
//       //                     ),
//       //                   )
//       //                 : const Text(
//       //                     'Sign Up',
//       //                     style: TextStyle(fontWeight: FontWeight.bold),
//       //                   ),
//       //             width: double.infinity,
//       //             alignment: Alignment.center,
//       //             padding: const EdgeInsets.symmetric(vertical: 14),
//       //             decoration: const ShapeDecoration(
//       //                 shape: RoundedRectangleBorder(
//       //                   borderRadius: BorderRadius.all(
//       //                     Radius.circular(24),
//       //                   ),
//       //                 ),
//       //                 color: Colors.purple),
//       //           ),
//       //         ),
//       //         const SizedBox(
//       //           height: 12,
//       //         ),
//       //         Flexible(child: Container(), flex: 2),
//       //         // transitioning to signing up
//       //         Row(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           children: [
//       //             Container(
//       //               child: const Text("Already have an account? "),
//       //               padding: const EdgeInsets.symmetric(
//       //                 vertical: 8,
//       //               ),
//       //             ),
//       //             GestureDetector(
//       //               onTap: navigatetoLogin,
//       //               child: Container(
//       //                 child: const Text(
//       //                   "Login",
//       //                   style: TextStyle(
//       //                     fontWeight: FontWeight.bold,
//       //                   ),
//       //                 ),
//       //                 padding: const EdgeInsets.symmetric(
//       //                   vertical: 8,
//       //                 ),
//       //               ),
//       //             ),
//       //           ],
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
