import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Widget/Custom_Elvated%20button.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:evently_app/l10n/app_localizations_en.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
import 'package:evently_app/config/resourse/isvalidat.dart';
import 'package:evently_app/core/Uitiles/Uiutills.dart';
import '../../../l10n/app_localizations.dart';
import 'package:evently_app/Firebase_Servicess/FairebaseServicess.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  bool securePassword = true; // this
  late TextEditingController _namecontroller; // this
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _repasswordcontroller; //
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    _namecontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _repasswordcontroller = TextEditingController();
  } // this
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _repasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery
        .of(context)
        .viewInsets);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(AppLocalizations.of(context)!.register),

      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 20),

        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image(image: AssetImage(Imagemanger.logoimage,),
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
                  },
                  isObscure: false,
                  labelText: AppLocalizations.of(context)!.name,
                  prefixIcon: Icons.person,),
                SizedBox(height: 16,),
                CustomTextForm(
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "enter the email :";
                    }
                  },
                  isObscure: false,
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  labelText: AppLocalizations.of(context)!.email,
                  prefixIcon: Icons.email,
                ),

                SizedBox(height: 16,),
                CustomTextForm(
                  controller: _passwordcontroller,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "the password is empty  :";
                    }
                    if (input.length < 8) {
                      return " the password should be at least 6";
                    }
                    if (Validator.isValidEmail(input)) {
                      return "the email format isn't coreect ";
                    }
                  },
                  isObscure: securePassword,
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(onPressed: () {
                    securePassword = !securePassword;
                    setState(() {

                    });
                  },
                      icon: Icon(securePassword ? Icons.visibility_off : Icons
                          .visibility)),
                  keyboardType: TextInputType.visiblePassword,),
                SizedBox(height: 16,),
                CustomTextForm(
                  controller: _repasswordcontroller,
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "the Repass-word is empty  :";
                    }
                    if (input.length < 8) {
                      return " the password should be at least 6";
                    }
                  },
                  isObscure: securePassword,
                  labelText: AppLocalizations.of(context)!.re_password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(onPressed: () {},
                      icon: Icon(securePassword ? Icons.visibility_off : Icons
                          .visibility)),),
                SizedBox(height: 16,),
                Coustom_Elvated_Button(
                    text: AppLocalizations.of(context)!.create_account,
                    onPress: _registered),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.create_account,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall),
                    SizedBox(width: 10,),
                    CustomTextButton(
                        texts: AppLocalizations.of(context)!.login, onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routesmanger.Logins);
                    }),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }


  void _registered() async {
    FirebaseAuth.instance.currentUser;
    if (formkey.currentState?.validate() == false) return;
    try {
      uitils.ShowLoading(context);
      UserCredential userCredential = await Fairebaeservices.login(_emailcontroller.text, _passwordcontroller.text);
     print(userCredential.user?.uid);
      uitils.hideDialog(context);
      uitils.ShowToastMassage("succefuly regested", Colors.green);
      Navigator.pushReplacementNamed(context, Routesmanger.Logins);
    } on FirebaseAuthException catch (e) {
      uitils.hideDialog(context);
      uitils.ShowToastMassage(e.code, Colors.red);
    } catch (e) {
      uitils.hideDialog(context);
      uitils.ShowToastMassage("failed to register ", Colors.red);
    }
  }

}

// GestureDetector(
//       onTap: (){
//         Navigator.pushNamed(context,Routesmanger.Logins);
//       },
//       child:      Text("Login",style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500, decoration: TextDecoration.underline,color: Colorsmanger.Blue),),
//