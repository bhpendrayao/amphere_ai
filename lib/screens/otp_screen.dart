import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:amphere_ai/screens/login_screen.dart';
import 'package:amphere_ai/screens/home_screen.dart';

class Otp extends StatefulWidget {
  static String id = 'otp_screen';

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late String name, userid;
  late String code; // Define code at the class level
  var size, height, width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final defaultPinTheme = PinTheme(
      width: width * 0.12,
      height: width * 0.12,
      textStyle: TextStyle(
        fontSize: height * 0.03, // Increased font size for better visibility
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(width * 0.01),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  height: height * 0.17,
                  child: Image.network(
                      'https://imgv3.fotor.com/images/cover-photo-image/AI-illustration-of-a-dragon-by-Fotor-AI-text-to-image-generator.jpg'),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                'Enter Your OTP',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.043,
                  color: Colors.black,
                ),
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              validator: (s) {
                return s != null && s.length == 6 ? null : 'Enter a Valid OTP';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => code = pin,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01c2c8),
                    minimumSize: Size.fromHeight(50),
                  ),
                  child: Text(
                    'Verify the code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.03, // Increased font size for better visibility
                    ),
                  ),
                  onPressed: () async {
                    try {
                      if (code == '123456') {
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                      } else {
                        Navigator.popAndPushNamed(context, Otp.id);
                      }
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid Otp'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Edit phone number?',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
