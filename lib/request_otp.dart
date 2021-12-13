import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';


class Request_OTP extends StatefulWidget {
  Request_OTP({required this.phoneNumber});

  final phoneNumber;

  @override
  _Request_OTPState createState() => _Request_OTPState();
}

class _Request_OTPState extends State<Request_OTP> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start == 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 1000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var phoneNumber;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade200),
                child: Image.network('https://ouch-cdn2.icons8.com/X-bTEzsI7jr2E7neLwHIABHa9Uipl-p6xAkJndGb5tQ/rs:fit:196:196/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDMv/MGE2N2YwYzMtMjQw/NC00MTFjLWE2MTct/ZDk5MTNiY2IzNGY0/LnN2Zw.png'),
                ),
              SizedBox(height: 60),
              Text(
                "Verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                "Please enter the 6 digit code sent to \n ${widget.phoneNumber}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.shade500, height: 1.5),
              ),
              SizedBox(height: 30),
              VerificationCode(
                  length: 6,
                  textStyle: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  onCompleted: (value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (value) {}),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't receive the OTP?",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_isResendAgain) return;
                        resend();
                      },
                      child: Text(
                        _isResendAgain
                            ? "Try again in " + _start.toString()
                            : "Resend",
                        style: TextStyle(color: Colors.blueAccent),
                      ))
                ],
              ),
              SizedBox(height: 50),
              MaterialButton(
                disabledColor: Colors.grey.shade300,
                color: Colors.black,
                height: 40,
                minWidth: double.infinity,
                child: _isLoading
                    ? Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 3,
                    color: Colors.black,
                  ),
                )
                    : _isVerified ? Icon(Icons.check, color: Colors.white, size: 30,) : Text(
                  "Verify",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _code.length < 6 ? null : () { verify(); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
