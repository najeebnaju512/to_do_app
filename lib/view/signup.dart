import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/utils/colors.dart';

class SignUp extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var name_cntrl = TextEditingController();
  var mail_cntrl = TextEditingController();
  var pass1_cntrl = TextEditingController();
  var pass2_cntrl = TextEditingController();
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
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.pacifico(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: thirdthemeClr),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //card with transparent background
                      Card(
                        elevation: 5,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Expanded(
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
                                //user name entry
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: name_cntrl,
                                    decoration: InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.person_2_outlined),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        labelText: "Username",
                                        labelStyle: GoogleFonts.whisper(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                                    controller: pass1_cntrl,
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
                                  height: 10,
                                ),
                                //confirm password entry
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: pass2_cntrl,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.password),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        labelText: "Confirm Password",
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
                                    "Sign Up",
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
                      ),
                      // TextButton(
                      //     onPressed: () {},
                      //     child: RichText(
                      //         text: TextSpan(
                      //             text: "Already Have Account..Login Here!",
                      //             style: GoogleFonts.slabo27px(
                      //                 fontSize: 15,
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w500))))
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
