import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/Providers/auth_provider.dart';
import 'package:new_app/Widgets/reusable_widgets.dart';
import 'package:new_app/home_page.dart';
import 'package:provider/provider.dart';

class ShopOwnerRegister extends StatefulWidget {
  const ShopOwnerRegister({super.key});

  @override
  State<ShopOwnerRegister> createState() => _ShopOwnerRegisterState();
}

class _ShopOwnerRegisterState extends State<ShopOwnerRegister> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController houseNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PasswordVisibility>(builder: (context, visible, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Let's get you registered",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "We require this information to verify your personal information.",
                    style: GoogleFonts.poppins(),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: firstname,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: city,
                    decoration: InputDecoration(
                      hintText: "City",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: street,
                    decoration: InputDecoration(
                      hintText: "Street",
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: visible.isChanged,
                    decoration: InputDecoration(
                        hintText: "House Number",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          visible.isChanged
                              ? Icons.visibility
                              : Icons.visibility_off_rounded,
                          color: Colors.grey,
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10),
                      child: InkWell(
                        onTap: () => visible.change(),
                        child: Text(
                          visible.isChanged ? "Show password" : "Hide Password",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<AuthProvider>(
                      builder: (context, authprovider, child) {
                    return customButton(
                      margin: 0,
                      text: "Submit",
                      onTap: () {
                        authprovider.register(
                          city: city.text,
                          context: context,
                          email: email.text,
                          firstname: firstname.text,
                          houseNumber: houseNumber.text,
                          lastname: lastname.text,
                          password: password.text,
                          phone: phone.text,
                          street: street.text,
                          username: username.text,
                        );
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
