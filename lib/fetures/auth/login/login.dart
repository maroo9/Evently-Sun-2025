import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Uitiles/Uiutills.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart' show CustomTextButton;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/config/resourse/isvalidat.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
import 'package:evently_app/core/Widget/Custom_Elvated button.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
class Login extends StatefulWidget {

  const Login({super.key});

  State<Login> createState() => _LoginState();

}
class _LoginState extends State<Login> {
bool securePassword=true;
late TextEditingController _namecontroller;    // this
late TextEditingController _emailcontroller;
late TextEditingController _passwordcontroller;
late TextEditingController _repasswordcontroller;//
GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  void initState() {
    _namecontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _repasswordcontroller = TextEditingController();
    super.initState();
  }

  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _repasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(image: AssetImage(Imagemanger.logoimage),
                    width: 136,
                    height: 186,),
                  SizedBox(height: 24,),
                  CustomTextForm(
                    controller: _namecontroller,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return "enter the name :";
                      }
                      return null;
                    },
                    isObscure: false,
                    labelText: AppLocalizations.of(context)!.name,
                    prefixIcon: Icons.person,),
                  SizedBox(height: 16,),
                  CustomTextForm(
                    controller: _emailcontroller,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return "enter the email :";
                      }
                      if (!Validator.isValidEmail(input)) {
                        return "the email format isn't coreect ";
                      }
                    }

                    ,
                    isObscure: false,
                    keyboardType: TextInputType.emailAddress,
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 16,),
                  Text(AppLocalizations.of(context)!.forget_password,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colorsmanger.Blue,
                          decoration: TextDecoration.underline)),
                  SizedBox(height: 16,),
                  SizedBox(height: 16.h),
                  CustomTextButton(
                    texts: "Forgot Password",
                    onTap: () {},
                  ),
                  SizedBox(height: 24.h),
                  Coustom_Elvated_Button(
                      text: AppLocalizations.of(context)!.login,
                      onPress: _login),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.dont_have_account,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,),
                      CustomTextButton(
                        texts: AppLocalizations.of(context)!.create_account,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routesmanger.Registes,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colorsmanger.Blue,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                      Text("or"),
                      Expanded(
                        child: Divider(
                          color: Colorsmanger.Blue,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  OutlinedButton(

                    style: OutlinedButton.styleFrom(
                        padding: REdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colorsmanger.Blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r)
                        )
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Imagemanger.GoogleIcon),
                        SizedBox(width: 4.w),
                        Text("Google",
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colorsmanger.Blue,


                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formkey.currentState?.validate() == false) return;
    try {
      uitils.ShowLoading(context);
      UserCredential userCredential = await  Fairebaeservices.login(_emailcontroller.text, _namecontroller.text);
      print(userCredential.user?.uid);
      uitils.hideDialog(context);
      Fluttertoast.showToast(
          msg: "Successfully LOGINS ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0
      );
      Navigator.pushReplacementNamed(context, Routesmanger.mainlayout);
    } on FirebaseAuthException catch (e) {
      uitils.hideDialog(context);
      uitils.ShowToastMassage(e.code, Colors.red);
    } catch (e) {
      uitils.hideDialog(context);
      uitils.ShowToastMassage("failed to Login ", Colors.red);
    }
  }
  }

