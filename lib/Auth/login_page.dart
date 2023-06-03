import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/Colors/app_colors.dart';
import 'package:new_app/Providers/auth_provider.dart';
import 'package:new_app/Widgets/reusable_widgets.dart';
import 'package:new_app/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var passwordV = Provider.of<PasswordVisibility>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          primaryColor,
                          Colors.white,
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      // color: Colors.red,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      // image: DecorationImage(
                      //   fit: BoxFit.fill,
                      //   image: AssetImage("images/hotel.jpg"),
                      // ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 50,
                    left: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/chima.jpg"),
                      radius: 50,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Welcome Back!  👋🏾",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Username",
                style: GoogleFonts.poppins(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Password",
                style: GoogleFonts.poppins(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: passwordV.isChanged,
                controller: password,
                decoration: const InputDecoration(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: GestureDetector(
                  onTap: () {
                    passwordV.change();
                  },
                  child: Text(
                    !passwordV.isChanged ? "Hide Password" : "Show Password",
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Consumer<AuthProvider>(builder: (context, authProvider, child) {
              return customButton(
                margin: 15,
                text: isLoading == true ? "Loading.. Please wait" : "Login",
                onTap: () {
                  if (username.text.isEmpty || password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Required fields cannot be empty"),
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.only(
                          bottom: 15,
                          left: 10,
                          right: 10,
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    authProvider
                        .login(
                      context: context,
                      password: password.text,
                      username: username.text,
                    )
                        .then(
                      (value) {
                        setState(
                          () {
                            isLoading = false;
                          },
                        );
                        Navigator.pushNamed(context, "home_page");
                      },
                    );
                  }
                },
              );
            }),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "forgot_password"),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),
                ),
                Text(
                  " or ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "not_you"),
                  child: Text(
                    "Not you?",
                    style: GoogleFonts.poppins(fontSize: 17),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Center(
              child: Icon(
                Icons.fingerprint_rounded,
                size: 30,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
