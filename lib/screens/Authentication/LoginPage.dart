import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:verasoft_test/utility/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _controllerLogin = TextEditingController();
TextEditingController _controllerPass = TextEditingController();
bool _proceedToSignIn = false;
var checkedValue = false;
var showClearEmail = false;
var showClearPass = false;
var showPass = false;

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _proceedToSignIn ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black12.withOpacity(0.5),
      child: SpinKitThreeBounce(
        color: Colors.blue,
        size: 50.0,
        controller: AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1200)),
      ),
    ) : Scaffold(
      backgroundColor: ColorSelect.appColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/KEOP_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(35, 104, 0, 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 150),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/KEOP_Logo.png"),
                    ),
                  ),
                  width: 200, // Adjust width and height as needed
                  height: 200,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 0, 30, 0),
                  child: TextField(
                    controller: _controllerLogin,
                    style: const TextStyle(color: ColorSelect.white),
                    onChanged: (val){
                      if(val.isNotEmpty && !showClearEmail){
                        setState(() {
                          showClearEmail = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "USERNAME or EMAIL ADDRESS",
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Colors.white),
                      ),
                      suffixIcon: showClearEmail ? IconButton(icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _controllerLogin.clear();
                            showClearEmail = false;
                          });
                        },
                      )
                          : null, // Show clear icon when text is not empty
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 0, 30, 0),
                  child: TextField(
                    controller: _controllerPass,
                    obscureText: !showPass,
                    style: const TextStyle(color: ColorSelect.white),
                    onChanged: (val){
                      if(val.isNotEmpty && !showClearPass){
                        setState(() {
                          showClearPass = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Colors.white),
                      ),
                      suffixIcon: showClearPass ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min, // added line
                        children: [
                          IconButton(
                            onPressed: () => showPassword(),
                            icon: showPass
                                ? const Icon(Icons.visibility, color: ColorSelect.white)
                                : const Icon(Icons.visibility_off, color: ColorSelect.white),
                          ),
                          IconButton(icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _controllerPass.clear();
                                showClearPass = false;
                              });
                            },
                          ),
                        ],
                      )
                          : null, // Show clear icon when text is not empty
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10.0 ,bottom: 10, right: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        }, //  <-- leading Checkbox
                      ),
                      const Text("Remember me", style: TextStyle(color: ColorSelect.white))
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                InkWell(
                  onTap: () {
                    if(_controllerLogin.text.isEmpty && _controllerPass.text.isEmpty){
                      showInSnackBar('Please enter a valid Email id and Password');
                      return;
                    }
                    setState(() {
                      _proceedToSignIn = true;
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          _proceedToSignIn = false;
                          Navigator.pushNamed(context, '/profile');
                        });
                      });
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      // width: 140,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: (_controllerLogin.text.isEmpty || _controllerPass.text.isEmpty) ? ColorSelect.unknownColor: Colors.blue,
                      ),
                      child:  /*_proceedToSignIn == true ?
                      SpinKitThreeBounce(
                              color: Colors.white,
                              size: 50.0,
                              controller: AnimationController(
                                  vsync: this,
                                  duration: const Duration(milliseconds: 1200)),
                            )
                          : */const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                ),
                const SizedBox(height: 200),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Change Server', style: TextStyle(color: ColorSelect.white)),
                    SizedBox(width: 5),
                    Text('|', style: TextStyle(color: ColorSelect.white)),
                    SizedBox(width: 5),
                    Text('Learn More', style: TextStyle(color: ColorSelect.white))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }
}

