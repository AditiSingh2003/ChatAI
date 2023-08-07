import 'package:chatai/onBoardingScreens/congratulation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController(
    initialPage: 0,
  );
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
            },
          children: [

            buildPage(text: 'Welcome to Vox, a great friend to chat with you!',
            image: 'assets/chat_bot.png',
            ),

            buildPage(
              text: 'If you are confused about what to do, just open Vox!',
              image: 'assets/chat_bot.png',
            ),

            buildPage(text: 'Vox will be ready to chat and make you happy',
            image: 'assets/chat_bot.png',
            ),
            
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 150,
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor:  Color(0xFF02CDBD),
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 5,
                  ),
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  )
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      isLastPage ? TextButton(onPressed: (){}, child: TextButton(
                  onPressed: () => Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => Congratulations(),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF02CDBD),
                        borderRadius: BorderRadius.circular(30),         
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color:  Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),) :
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFE8E0EA),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:  Color(0xFF02CDBD),
                                  ),
                                child: TextButton(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    )
                                    ),
                                    onPressed: () => controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    ),
                                    ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                    ],
                  ),
                  ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  Widget buildPage({required String text, required String image}) =>
      Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 100),),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      );
}
