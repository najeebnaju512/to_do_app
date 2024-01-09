import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primethemeClr,
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        titleTextStyle: GoogleFonts.pacifico(
            fontSize: 30, fontWeight: FontWeight.w500, color: thirdthemeClr),
        backgroundColor: appbrthemeClr,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "UserName",
                    style: GoogleFonts.pacifico(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: thirdthemeClr),
                  ),
                  Text("email*****@gmail.com",
                      style: GoogleFonts.lora(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: secndthemeClr))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
