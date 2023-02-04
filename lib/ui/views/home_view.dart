import 'package:animated_login_flutter/core/viewmodels/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/globals.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import '../widgets/wave_widget.dart';

class HomeView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size  = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: [

          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height/ 3.0,
              color: Global.white,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Docter !',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check: null,
                  onChanged: (value){
                    model.isValidEmail(value);
                  },
                ),

                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                      hintText: 'Password',
                      obscureText: model.isVisible?false:true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible ? Icons.visibility:Icons.visibility_off,
                      onChanged: (){},
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                // button widget custom
                ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                ),

                SizedBox(height: 10,),
                ButtonWidget(
                  title: 'Sign Up',
                  hasBorder: true,
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
