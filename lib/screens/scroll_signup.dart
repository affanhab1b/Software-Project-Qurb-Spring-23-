import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing/resources/auth_methods.dart';
import 'package:testing/responsive/mobile_screen_layout.dart';
import 'package:testing/responsive/responsive_layout_screen.dart';
import 'package:testing/screens/login_screen.dart';
import 'package:testing/utils/colors.dart';
// import 'package:testing/utils/global_variable.dart';
import 'package:testing/utils/utils.dart';
import 'package:testing/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

  void Signupuser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().Signupuser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        // bio: _bioController.text,
        neighborhood: _neighborhoodController.text,
        // city: _cityController.text,
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor2,
        // title: const Text('Select your Neighborhood:'),
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Align(
                  alignment: const Alignment(-0.05, -0.5),
                  child: Text(
                    "Set a Profile Picture",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 12),
                // circular widget for image insertion
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 56,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 56,
                            backgroundImage: NetworkImage(
                                'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg'),
                          ),
                    Positioned(
                        bottom: -13,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo_sharp,
                            color: Colors.black45,
                          ),
                        ))
                  ],
                ),
                const SizedBox(height: 50),

                const Align(
                  alignment: const Alignment(-0.95, -0.5),
                  child: Text(
                    "Neighborhood",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 25),
                TextFieldInput(
                  textEditingController: _neighborhoodController,
                  hintText: 'Enter your neighborhood/area',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 50),
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
                const SizedBox(height: 25),
                TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: 'Enter your username',
                  textInputType: TextInputType.text,
                ),

                const SizedBox(height: 50),
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
                const SizedBox(height: 25),
                TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your email address',
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 50),
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
                const SizedBox(height: 25),
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(height: 140),

                // button login
                InkWell(
                  onTap: Signupuser,
                  child: Container(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(54),
                          ),
                        ),
                        color: Colors.purple),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // transitioning to signing up
                const Align(
                  alignment: const Alignment(-0.95, -0.5),
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: navigatetoLogin,
                  child: Container(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
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
          ),
        ),
      ),
    );
  }
}
