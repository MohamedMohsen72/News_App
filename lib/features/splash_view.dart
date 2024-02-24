import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/network/local_storage.dart';
import 'package:news_app/core/widget/nav-bar.dart';
import 'package:news_app/features/upload/upload_page.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 late bool isUpload;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      AppLocal.getCachData(AppLocal.ISUPLOAD_KEY).then((value) => isUpload=value??false);
      Future.delayed(const Duration(seconds: 6),() {
        return

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
          isUpload? const NavBar() :const UploadPage(),));
    });

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          const Image(image: AssetImage('assets/splash.png')),
          Text('Insights News', style: getTextTitle(fontWeight: FontWeight.w400)),
          const Gap(20),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getTextsmall(),
          )
        ]),
      ),
    );
  }
}
