import 'package:evently_app/core/Colorsmanger/Colorsmanger.dart';
import 'package:evently_app/core/Widget/Custom_Elvated%20button.dart';
import 'package:evently_app/core/Widget/Custom_Text_Button.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/Assetsmanger/Assetsmangers.dart';
import 'package:evently_app/config/language/theme/theme.dart';
import 'package:evently_app/core/Widget/Custom_text_form.dart';
import 'package:evently_app/core/Routesmanger/routesmanger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently_app/fetures/auth/login/login.dart';
import 'package:evently_app/fetures/auth/register/register.dart';
import 'package:evently_app/config/resourse/isvalidat.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  bool securePassword=true;    // this
  late TextEditingController _namecontroller;    // this
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;
  late TextEditingController _repasswordcontroller;//
  GlobalKey<FormState>  formkey=GlobalKey<FormState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    _namecontroller=TextEditingController();
    _emailcontroller=TextEditingController();
    _passwordcontroller=TextEditingController();
    _repasswordcontroller=TextEditingController();
  }// this
  void dispose(){
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _repasswordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Register",),

      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21,vertical: 20),

        child:SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                    children: [
            Image(image:AssetImage(Imagemanger.logoimage,),width: 136,height: 186,),
            SizedBox(height: 24,),
            CustomTextForm(
              controller: _namecontroller,
              validator: (input){
                if(input==null||input.trim().isEmpty){
                return "enter the name :";
                }

                },isObscure: true,labelText: "person:",prefixIcon: Icons.person,),
            SizedBox(height: 16,),
            CustomTextForm(
              validator: (input){
                if(input==null||input.trim().isEmpty){
                return "enter the email :";
                }

              },
              controller: _emailcontroller,
                isObscure:true,
                keyboardType: TextInputType.emailAddress,
                labelText: "Email:",prefixIcon: Icons.email,
                ),
            SizedBox(height: 16,),
            CustomTextForm(
              controller: _passwordcontroller,
              validator: (input){
                if(input==null||input.trim().isEmpty){
                return "the password is empty  :";
                }
                if(input.length<8){
                  return" the password should be at least 6";

                }
                if(!Validator.isValidEmail(input)){
                  return "the email format isn't coreect ";
                }

                },
              isObscure: securePassword,
              labelText: "Password:",prefixIcon: Icons.lock,suffixIcon: IconButton(onPressed: (){
              securePassword=!securePassword;
              setState(() {
            
              });
            }, icon: Icon( securePassword? Icons.visibility_off:Icons.visibility)),
              keyboardType: TextInputType.visiblePassword,),
            SizedBox(height: 16,),
            CustomTextForm(
              controller: _repasswordcontroller,
              validator: (input){
                if(input==null||input.trim().isEmpty){
                return "the Repass-word is empty  :";
                }
                if(input.length<8){
                  return" the password should be at least 6";

                }

                },
              isObscure: securePassword,
              labelText: "RePassword:",prefixIcon: Icons.lock,suffixIcon: IconButton(onPressed: (){}, icon: Icon( securePassword? Icons.visibility_off:Icons.visibility)),),
            SizedBox(height: 16,),
            Coustom_Elvated_Button(text: "create account", onPress: _createAccount),
            SizedBox(height: 16,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?",style: Theme.of(context).textTheme.bodySmall),
                SizedBox(width: 10,),
                CustomTextButton(texts: "Login", onTap: (){
                  Navigator.pushReplacementNamed(context, Routesmanger.Logins);
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




   void _createAccount() {
    if(formkey.currentState?.validate()==false)return;
  }

  }



//GestureDetector(
//       onTap: (){
//         Navigator.pushNamed(context,Routesmanger.Logins);
//       },
//       child:      Text("Login",style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500, decoration: TextDecoration.underline,color: Colorsmanger.Blue),),
//     )