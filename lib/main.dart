import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:register_with_phone_number/request_otp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var phoneNumber;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 50),
                FadeInDown(
                  duration: Duration(seconds: 1),
                  child: Image.network(
                    'https://ouch-cdn2.icons8.com/wFopQ62P8AGXJUG3pWLHAVLfV2R77_B11cPsgh2o0U4/rs:fit:196:147/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDcv/N2E5YjE4NjQtNTc3/YS00YjAzLTlmNjUt/YjQ5NDhiN2Q0OGUx/LnN2Zw.png',
                    fit: BoxFit.cover,
                    height: 225,
                  ),
                ),
                SizedBox(height: 30),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 1300),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 1300),
                  child: Text(
                    'Enter your phone number to continue, we will \n send you OTP verify',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 1300),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.15)),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFEEEEEE),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (value) {
                            phoneNumber = value;
                          },
                          cursorColor: Colors.black,
                          formatInput: false,
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG
                          ),
                          inputDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          bottom: 8,
                          left: 90,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 1300),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Request_OTP(phoneNumber: phoneNumber)));
                      print(phoneNumber);
                    },
                    color: Colors.black,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(
                      'Request OTP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                FadeInDown(
                  delay: Duration(milliseconds: 800),
                  duration: Duration(milliseconds: 1300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
