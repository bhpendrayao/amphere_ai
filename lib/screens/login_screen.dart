import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:amphere_ai/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  static String verify=" ";
  static String number='';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Service service = Service();
  var size,height,width;
  var colour=Colors.grey;
  static String verify=" ";//teleporting value
  @override


  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: CircleAvatar(
                radius: width*0.13,
                backgroundColor: Colors.white,
                child: SizedBox(

                  height: height*0.17,
                  child: Image.network('https://imgv3.fotor.com/images/cover-photo-image/AI-illustration-of-a-dragon-by-Fotor-AI-text-to-image-generator.jpg'),
                ),
              ),
            ),
             Text(
              'Enter Phone Number For Verification',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: height*0.04,
                color: Colors.black,
              ),
            ),
            Theme(
                data: ThemeData.light(),
                child: IntlPhoneField(
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: const InputDecoration(
                      labelText: 'Your Number',
                      labelStyle:TextStyle(
                        color: Colors.blueGrey,
                      ),
                      counterStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    dropdownTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      LoginScreen.number=phone.completeNumber;
                      colour=Colors.orange;
                    }
                )// learn more about it
            ),
             SizedBox(
              height: height*0.15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFF01c2c8),
                minimumSize: const Size.fromHeight(50),
              ),
              child: Text(
                'Next',style: TextStyle(
                  fontSize: height*0.04
              ),
              ),// NEW
              onPressed: () {
                 if(LoginScreen.number.length==10)
                   {
                     Navigator.popAndPushNamed(context, Otp.id);}
                 else {
                   FocusScope.of(context).unfocus();
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       content: Text('Invalid Number'),
                       duration: Duration(seconds: 3),
                     ),
                   );
                 }
                   }

            ),
          ],
        ),
      ),
    );
  }
}