import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/utils/colors.dart';
import 'package:to_do_app/view/signup.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var mail_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primethemeClr,
      appBar: AppBar(
        backgroundColor: primethemeClr,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In",
                        style: GoogleFonts.pacifico(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: thirdthemeClr),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //card with transparent background
                      Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text("Enter Valid Credentials here",
                                  style: GoogleFonts.whisper(
                                      letterSpacing: 2,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      color: secndthemeClr)),
                              SizedBox(
                                height: 15,
                              ),
                              //mail entry
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: mail_cntrl,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: "Email",
                                      labelStyle: GoogleFonts.whisper(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //password entry
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: pass_cntrl,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.password),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      labelText: "Password",
                                      labelStyle: GoogleFonts.whisper(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.whisper(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                color: appbrthemeClr,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUp()));
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Sign Up Here..",
                                  style: GoogleFonts.lora(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500))))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
