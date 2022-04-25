import 'package:chef_connect_india/Drawers/drawer_chef.dart';
import 'package:chef_connect_india/Drawers/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:url_launcher/url_launcher.dart';

class privacy_polocy extends StatefulWidget {
  const privacy_polocy({Key? key}) : super(key: key);

  @override
  State<privacy_polocy> createState() => _privacy_polocyState();
}

class _privacy_polocyState extends State<privacy_polocy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: chef_drawer(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Privacy Policy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chef Connect',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 28,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Wrap(
                  children: [
                    Text(
                      'Privacy Policy Connect Connect India built the Chef Connect India app as a Free app.\n\nThis SERVICE is provided by Connect Connect India at no cost and is intended for use as is.\n\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy.\n\nThe Personal Information that we collect is used for providing and improving the Service.\n\nWe will not use or share your information with anyone except as described in this Privacy Policy.\n\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Chef Connect India unless otherwise defined in this Privacy Policy.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          // overflow: TextOverflow.ellipsis,
                          // decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Information Collection and Use',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information.\n\nThe information that we request will be retained by us and used as described in this privacy policy.\n\nThe app does use third-party services that may collect information used to identify you.\n\nLink to the privacy policy of third-party service providers used by the app. \n\nGoogle Play Services Google Analytics for Firebase Firebase Crashlytics Log Data. \n\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data.\n\nThis Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cookies',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your devices internal memory.\n\nThis Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Service Providers',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'We may employ third-party companies and individuals due to the following reasons:\n\nTo facilitate our Service;\n\nTo provide the Service on our behalf; \n\nTo perform Service-related services; \nor\nTo assist us in analyzing how our Service is used. We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Security',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Links to Other Sites',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Children’s Privacy',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Changes to This Privacy Policy',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Text(
                      'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'This policy is effective as of 2022-04-17',
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Wrap(
                  children: [
                    Linkify(
                      // onOpen: _onOpen,
                      text:
                          "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at techchefconnect@gmail.com.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.normal),
                      options: LinkifyOptions(humanize: false),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _onOpen(LinkableElement link) async {
  //   if (await canLaunch(link.url)) {
  //     await launch(link.url);
  //   } else {
  //     throw 'Could not launch $link';
  //   }
  // }
}
