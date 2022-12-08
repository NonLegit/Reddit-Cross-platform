import 'package:flutter/material.dart';
import '../widgets/upper_bar.dart';
import '../widgets/text_input.dart';
import '../widgets/upper_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'forgot_username.dart';
import '../models/status.dart';
import 'package:email_validator/email_validator.dart';
import '../providers/authentication.dart';
import 'package:provider/provider.dart';
import './login.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/ForgotPassword';
  final String url =
      'https://abf8b3a8-af00-46a9-ba71-d2c4eac785ce.mock.pstmn.io';

  /// variable to check if the backend finish the actual server of work with the mock
  final bool isMock = true;
  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  /// Whether there is an error in the fields or not
  bool isError = false;

  /// Whether the user tring to submit or not
  bool isSubmit = false;

  /// error message to view when the log in is failed
  String errorMessage = '';

  /// Whether the user finish enter the 3 inputs
  bool isFinished = false;

  /// listener to the Username input field
  TextEditingController inputUserNameController = TextEditingController();

  /// listener to the Email input field
  TextEditingController inputEmailController = TextEditingController();

  /// the Current Status of the Email input field
  InputStatus inputEmailStatus = InputStatus.original;

  /// error message to view when the Email is invalid
  String emailErrorMessage = '';

  ///controlling the finish flag
  ///
  ///when user typing in any input field ->
  ///check the changes and detect when the finish flag is true
  ///and then activate the continue bottom
  void changeInput() {
    isFinished = (!inputUserNameController.text.isEmpty) &&
        (!inputEmailController.text.isEmpty) &&
        (validateEmail() == InputStatus.sucess);
  }

  /// Returns the Status of the Email input field after check its validation
  ///
  /// the validation will be sucess when :
  ///      1- the email is correct
  /// the validator will return original if the field is empty
  /// otherwise the status will be faild and put an error message
  InputStatus validateEmail() {
    if (inputEmailController.text.isEmpty)
      return InputStatus.original;
    else if (EmailValidator.validate(inputEmailController.text.toLowerCase()))
      return InputStatus.sucess;
    else {
      emailErrorMessage = 'Not a valid email address';
      return InputStatus.failed;
    }
  }

  /// Control the status of the Email textfield
  ///
  /// when user tap in the email textfailed mark it as taped
  /// when tap out check the validation using [validateEmail()]
  void controlEmailStatus(hasFocus) {
    if (hasFocus)
      inputEmailStatus = InputStatus.taped;
    else
      inputEmailStatus = validateEmail();
  }

  ///post the forgotPassword  info to the backend server
  ///
  /// take the data from inputs listener and sent it to the server
  /// if the server return failed response then there is error message will appare
  /// other show sucess message
  void submitForgorPasssword() async {
    final provider = Provider.of<Auth>(context, listen: false);
    await provider.forgetPassword({
      "email": inputEmailController.text,
      "userName": inputUserNameController.text
    });
    setState(() {
      isSubmit = true;
      isError = provider.error;
      errorMessage = provider.errorMessage;
      if (isError == false) Navigator.of(context).pushNamed(Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //GestureDetector to hide the soft keyboard
      //by clicking outside of TextField or anywhere on the screen
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperBar(UpperbarStatus.login),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UpperText('Forgot your password?'),
                    SizedBox(height: 4.h),
                    TextInput(
                      changeInput: () {
                        setState(() {
                          changeInput();
                        });
                      },
                      ontap: (hasFocus) {},
                      inputController: inputUserNameController,
                      lable: 'Username',
                    ),
                    TextInput(
                      changeInput: () {
                        setState(() {
                          changeInput();
                        });
                      },
                      currentStatus: inputEmailStatus,
                      ontap: (hasFocus) {
                        setState(() {
                          controlEmailStatus(hasFocus);
                        });
                      },
                      inputController: inputEmailController,
                      lable: 'Email',
                    ),
                    if (inputEmailStatus == InputStatus.failed)
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          emailErrorMessage,
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          style: TextStyle(color: Colors.black54),
                          'Unfortunately, if you have never given us your email, we will not able to reset your password'),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                        padding: EdgeInsets.all(0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ResponsiveSizer(
                                      builder: (cntx, orientation, Screentype) {
                                        // Device.deviceType == DeviceType.web;
                                        return Scaffold(
                                          body: ForgotUserName(),
                                        );
                                      },
                                    ),
                                  ));
                            },
                            child: Text(
                                style: TextStyle(color: Colors.red),
                                'Forget Username?'))),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Having trouble? ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                //on tap code here, you can navigate to other page or URL
                                String url =
                                    "https://www.reddithelp.com/hc/en-us/articles/205240005";
                                var urllaunchable = await canLaunch(
                                    url); //canLaunch is from url_launcher package
                                if (urllaunchable) {
                                  await launch(
                                      url); //launch is from url_launcher package to launch URL
                                } else {
                                  print("URL can't be launched.");
                                }
                              },
                          ),
                        ))
                  ]),
            )),
            if (isSubmit && isError)
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      errorMessage,
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w500,
                        color: Theme.of(context).errorColor,
                      )),
                ),
              ),
            if (isSubmit && !isError)
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Text(
                    textAlign: TextAlign.center,
                    'you will receve if that adress maches your mail',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w500,
                      color: Colors.green,
                    )),
              ),
            Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.red,
                      onSurface: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: isFinished ? submitForgorPasssword : null,
                    child: Text('Continue'),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
