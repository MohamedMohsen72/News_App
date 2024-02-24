import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/network/local_storage.dart';
import 'package:news_app/core/widget/custom_btm.dart';
import 'package:news_app/core/widget/custom_error_dialog.dart';
import 'package:news_app/core/widget/nav-bar.dart';



String? path;
String name = '';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              if (path != null && name.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NavBar(),
                ));
                AppLocal.CachData(AppLocal.IMAGE_KEY, path);
                AppLocal.CachData(AppLocal.NAME_KEY, name);
                AppLocal.CachData(AppLocal.ISUPLOAD_KEY, true);
              } else if (path == null && name.isNotEmpty) {
                showErrorDialog(
                    context, const Text('please uploud your image'));
              } else if (path != null && name.isEmpty) {
                showErrorDialog(context, const Text('please Enter your name'));
              } else {
                showErrorDialog(context,
                    const Text('please Enter your name and uploud your image'));
              }
            },
            child: const Text('Done'))
      ]),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: (path != null)
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/person.png'),
          ),
          const Gap(20),
          SizedBox(
            width: 220,
            height: 60,
            child: customBottom(
              onPressed: () {
                uploudFromeCamera();
              },
              text: 'Upload From Camera',
            ),
          ),
          const Gap(20),
          SizedBox(
            width: 220,
            height: 60,
            child: customBottom(
              onPressed: () {
                uploudFromeGalery();
              },
              text: 'Upload From Galary',
            ),
          ),
          const Gap(20),
          Divider(
            height: 5,
            indent: 30,
            endIndent: 30,
            color: AppColor.primarycolor,
          ),
          const Gap(10),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  style: getTextbady(),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.person, color: AppColor.primarycolor),
                    hintText: 'Enter your name',
                    hintStyle: getTextbady(),
                    fillColor: AppColor.Colorcon,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColor.balckColor)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColor.balckColor)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColor.balckColor)),
                  )))
        ]),
      ),
    );
  }

  uploudFromeCamera() async {
    var pickImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      setState(() {
        path = pickImage.path;
      });
    }
  }

  uploudFromeGalery() async {
    var pikerImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pikerImage != null) {
      setState(() {
        path = pikerImage.path;
      });
    }
  }
}
