import 'package:flutter/material.dart';
import 'package:todo_app/view/components/widgets/text_custom.dart';
import 'package:todo_app/view/screens/todo_screen.dart';
import 'package:todo_app/view_model/utils/colors.dart';
import '../components/widgets/my_text_form_field.dart';


class LoginScreen extends StatelessWidget {

  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool obscureText=true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              'https://cdn.icon-icons.com/icons2/1543/PNG/512/todo_107314.png',
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            TextCustom(
              text:'Login',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  MyTextFormField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    textInputAction:TextInputAction.next,
                    validator: (value){
                      if((value??'').isEmpty){
                        return'Please, Enter your Email';
                      }
                      return null;
                    },
                  ),
                  MyTextFormField(
                    hintText: 'Password',
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    suffixIcon: Icons.remove_red_eye,
                    obscureText: obscureText,
                    secondSuffixIcon: Icons.visibility_off,
                    validator: (value){
                      if((value??'').isEmpty){
                        return'Please, Enter your Password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToDoScreen(),
                        ),
                            (route) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.orange,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: TextCustom(
                  text: 'Login',
                  fontSize: 15,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  text:'Don\'t have an account ?  ',
                  fontSize: 15,
                  color: AppColors.grey,
                ),
                TextButton(
                  onPressed: () {},
                  child: TextCustom(
                    text: 'Register',
                    fontSize: 17,
                    color: AppColors.blue,
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
