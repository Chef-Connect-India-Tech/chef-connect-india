import 'package:chef_connect_india/Main%20Screen/home.dart';
import 'package:chef_connect_india/main.dart';
import 'package:chef_connect_india/roles/chef/chef_registration_1.dart';
import 'package:chef_connect_india/roles/user/Registration_user.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';
import 'package:onboarding/onboarding.dart';

class Onboarding_screen_chef extends StatefulWidget {
  Onboarding_screen_chef({Key? key}) : super(key: key);

  @override
  State<Onboarding_screen_chef> createState() => _Onboarding_screen_chefState();
}

class _Onboarding_screen_chefState extends State<Onboarding_screen_chef> {
  late Material materialButton;
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 45.0,
            ),
            child: Image.asset(
              'assets/Private Chef.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Private chef',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              """Book a permanent chef for your home, these will be for full time servic
-Multiple trial options until satisfaction
-Chef as per your requirements 
-Proper background check 
-2 replacement options given""",
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 45.0,
            ),
            child: Image.asset(
              'assets/kitchenprofessionals.jpeg',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Kitchen professional',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              """Hire a chef for your hotel restaurant or pg or any other commercial requirements 
-3 trial once you buy the services 
-Yearly replacement services given 
-Yearly subscription plans available
-Proper background check done""",
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 45.0,
            ),
            child: Image.asset(
              'assets/partychef.jpeg',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Party chef',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              """Book a chef for your party or any other occasion  ( 1 day or multiple day services provided ) but specifically for one day orders
-Customised menu options
-Ingredients list shared on time
-Book a chef within your budget
-Proper background check done""",
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton;
  }

  void _buildButton(int pageIndex) {
    if (pageIndex == 2) {
      setState(() {
        materialButton = _signupButton;
      });
    } else {
      setState(() {
        materialButton = _skipButton;
      });
    }
  }

  Material get _skipButton {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => chef_registration_one()),
              (route) => false);
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => chef_registration_one(),
              ),
              (route) => false);
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Register',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          _buildButton(pageIndex);
        },
        footer: Footer(
          child: materialButton,
          indicator: Indicator(
            indicatorDesign: IndicatorDesign.line(
              lineDesign: LineDesign(
                lineType: DesignType.line_uniform,
              ),
            ),
          ),
          footerPadding: const EdgeInsets.all(45.0),
        ),
      ),
    );
  }
}
