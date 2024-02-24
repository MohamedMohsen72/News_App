import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:news_app/core/network/local_storage.dart';
import 'package:news_app/core/widget/custom_btm.dart';
import 'package:news_app/core/widget/nav-bar.dart';

import 'package:news_app/features/profile/widget/show_dailogs.dart';


import '../../core/Utils/color.dart';

String? path;
String name = '';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppLocal.getCachData(AppLocal.IMAGE_KEY).then((value)  {
      setState(() {
        path=value;
      });
    });
    AppLocal.getCachData(AppLocal.NAME_KEY).then((value)  {
      setState(() {
        name=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(leading: IconButton(onPressed: (){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavBar(),));
}, icon: Icon(Icons.arrow_back_ios,color: AppColor.whiteColor,))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage('assets/person.png'),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (context) => Container(
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: customBottom(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                  uploadFromeCamera();
                                },
                                text: 'Upload From Camera',
                              ),
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: customBottom(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                  uploadFromeGalery();
                                },
                                text: 'Upload From Galary',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt),
                color: AppColor.primarycolor,
              )
            ],
          ),
          const Gap(50),
          Divider(
            thickness: 2,
            color: AppColor.primarycolor,
            endIndent: 30,
            indent: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColor. primarycolor,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColor.primarycolor,
                    ),
                    CircleAvatar(
                      radius: 20,
backgroundColor: AppColor.Colorcon,
                      child: IconButton(
                          icon: Icon(Icons.edit, color: AppColor.primarycolor),
                          onPressed: () {
                            showNameDialog(context, name);
                          }),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  uploadFromeCamera() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      setState(() {
        path = pickImage.path;
      });
    }
  }

  uploadFromeGalery() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikerImage != null) {
      setState(() {
        path = pikerImage.path;
      });
    }
  }

}