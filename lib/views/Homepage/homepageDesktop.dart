import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_web/Controllers/randomDataController.dart';
import 'package:restro_web/views/Homepage/widgets/CarasoulSlider/carasoulSlider.dart';
import 'package:restro_web/views/Homepage/widgets/CateringSection/cateringsection.dart';
import 'package:restro_web/views/Homepage/widgets/FifthSection/fifthSection.dart';
import 'package:restro_web/views/Homepage/widgets/FirstSection/first_section.dart';
import 'package:restro_web/views/Homepage/widgets/Footer/footer.dart';
import 'package:restro_web/views/Homepage/widgets/FourthSection/fourthSection.dart';
import 'package:restro_web/views/Homepage/widgets/SecondCarasoul/secondCarasoul.dart';
import 'package:restro_web/views/Homepage/widgets/SecondSection/second_section.dart';
import 'package:restro_web/views/Homepage/widgets/ThirdSection/thirdSection.dart';

class HomepageDesktop extends StatefulWidget {
  const HomepageDesktop({ Key? key }) : super(key: key);

  @override
  _HomepageDesktopState createState() => _HomepageDesktopState();
}

class _HomepageDesktopState extends State<HomepageDesktop> {
 
  @override
  Widget build(BuildContext context) {
    ScrollController _pageScrollController = ScrollController();

    // Initialize the DataController
    final DataController dataController = Get.put(DataController());

    return Scaffold(
      body: Obx(() {
        // Show loading indicator while data is being fetched
        if (!dataController.isLoaded.value) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Background SVG
                Positioned.fill(
                    child: Image.asset(
                  'assets/bg1.png',
                  fit: BoxFit.cover,
                )),
                // Foreground content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 250,
                        
                          child: Image.asset("assets/lavieLogo.jpg",filterQuality: FilterQuality.high   ,)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250.0,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 30.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,

                            isRepeatingAnimation: true,

                            animatedTexts: [
                              
                              TypewriterAnimatedText(
                                  'Welcome to ....'),
                              TypewriterAnimatedText(
                                  'Your Restaurant'),
                             
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        // Once data is loaded, display the content
        return SingleChildScrollView(
          child: Column(
            children: [
              FirstSection(),
              SecondSection(),
              CarasoulSlider(),
              ThirdSection(scrollController: _pageScrollController,),
              CateringSection(),
              FourthSection(),
             
              secondCarasoul(),
              footer(),
            ],
          ),
        );
      }),
    );
  }
}
