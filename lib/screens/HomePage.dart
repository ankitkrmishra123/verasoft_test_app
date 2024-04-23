import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verasoft_test/utility/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController _urlController = TextEditingController();
bool _proceedToUrl = false;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.fromLTRB(35, 204, 0, 0),
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
                    controller: _urlController,
                    style: const TextStyle(color: ColorSelect.white),
                    onChanged: (val){
                      if(val.isNotEmpty){
                        setState(() { //an comment..............

                        });
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "ENTER YOUR KEOP SERVER URL",
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Colors.white),
                      ),
                      suffixIcon: _urlController.text.isNotEmpty ? IconButton(icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _urlController.clear();
                          });
                        },
                      )
                          : null, // Show clear icon when text is not empty
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    setState(() {
                      if(_urlController.text.isEmpty){
                        showInSnackBar('Please enter a valid url');
                        return;
                      }
                      _proceedToUrl = true;
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _proceedToUrl = false;
                          Navigator.pushNamed(context, '/login');
                        });
                      });
                    });
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 180, 0),
                      width: 140,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: _urlController.text.isEmpty ? ColorSelect.unknownColor: Colors.blue,
                      ),
                      child:  _proceedToUrl == true ?  SpinKitThreeBounce(
                        color: Colors.white,
                        size: 50.0,
                        controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                      ) : const Center(
                        child: Text(
                          'Connect',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          //  Column(children: [
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(45, 264, 150, 0),
          //     child: Row(
          //       children: [
          //         const Text('KEOP', style: TextStyle(color: ColorSelect.white, fontSize: 40)),
          //         const Padding(
          //           padding: EdgeInsets.only(top: 30),
          //           child: Text('TM', style: TextStyle(color: ColorSelect.white, fontSize: 6)),
          //         ),
          //
          //       ],
          //     ),
          //   )
          // ]),
        ],
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
