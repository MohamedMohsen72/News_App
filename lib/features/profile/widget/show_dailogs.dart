import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/network/local_storage.dart';
import 'package:news_app/core/widget/nav-bar.dart';

showNameDialog(context, name) {
  var formkay = GlobalKey<FormState>();
  var textcom = TextEditingController(text: name);
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (BuildContext context) => Container(
        height: 210,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: formkay,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      style: TextStyle(color: AppColor.whiteColor),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "your name mustn\'t by empty";
                        }
                        return null;
                      },
                      controller: textcom),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      if (formkay.currentState!.validate()) {
                        AppLocal.CachData(AppLocal.NAME_KEY, textcom.text);
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ));
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.Colorcon),
                      child: Text('Update Your Name',
                          style: TextStyle(color: AppColor.whiteColor)),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
  );
}
