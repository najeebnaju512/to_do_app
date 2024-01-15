import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/utils/colors.dart';

class Profile extends StatelessWidget {
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
          Card(
            color: primethemeClr,
            elevation: 0,
            child: Padding(
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
                            color: secndthemeClr)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    buildListTile(Icons.privacy_tip_outlined, "Privacy"),
                    buildListTile(Icons.help_outline, "Help&Support"),
                    buildListTile(Icons.settings, "Settings"),
                    buildListTile(Icons.share, "Share"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildListTile(IconData iconname, String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          tileColor: Colors.white38,
          leading: Icon(iconname, size: 25),
          title: Text(
            title,
            style: GoogleFonts.robotoSlab(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
