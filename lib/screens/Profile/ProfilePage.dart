import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utility/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {

 bool  _proceedToProductLookup = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: _proceedToProductLookup ? Container(
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
        backgroundColor: ColorSelect.girdColor.withOpacity(0.1),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/KEOP_Logo.png"),
                    ),
                  ),
                  width: 120, // Adjust width and height as needed
                  height: 120,
                ),
                const SizedBox(width: 180),
                SvgPicture.asset('assets/images/bars_solid.svg', width: 20, height: 20),
                const SizedBox(height: 10),
              ]),
              // Divider(height: 1),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    width: double.infinity,
                    height: 150,
                    color: Colors.white38.withOpacity((0.25)),
                    child: const Row(
                      children: [
                        Expanded(
                            child: Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text('Good Afternoon', style: TextStyle(color: Colors.white, fontSize: 22)),
                              SizedBox(height: 10),
                              Text('Eric', style: TextStyle(color: Colors.white, fontSize: 32)),
                              ])),
                        Expanded(child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/profile.png"),
                          radius: 60,
                        ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    width: double.infinity,
                    height: 50,
                    color: Colors.white10,
                    child: const Row(
                      children: [
                        Expanded(child: Text('DALLAS', style: TextStyle(color: Colors.white, fontSize: 22))),
                        Expanded(child: Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text('change location', style: TextStyle(color: Colors.white, fontSize: 12)),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      shrinkWrap: true,
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorSelect.girdColor.withOpacity(0.3),
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                            ),
                            child: Center(
                              child: Wrap(
                                direction: Axis.vertical,
                                children: [
                                  index == 0 ? const Padding(padding: EdgeInsets.only(left: 20.0), child:  Icon(Icons.history, color: Colors.blue, size: 35)) : const Padding(padding: EdgeInsets.only(left: 20.0), child: Icon(Icons.play_arrow_outlined, color: Colors.blue, size: 45)),
                                  index == 0 ? const Text('RECENT', style: TextStyle(color: Colors.white, fontSize: 25)) : const Text('RESUME', style: TextStyle(color: Colors.white, fontSize: 20)),
                                  const SizedBox(height: 10),
                                  index == 0 ? const Padding(padding:  EdgeInsets.only(left: 15.0), child:  Text('COUNTS', style: TextStyle(color: Colors.white, fontSize: 10)))
                                      :  const Padding(padding:  EdgeInsets.only(left: 15.0), child: Text('COUNT', style: TextStyle(color: Colors.white, fontSize: 10)),),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
                  const SizedBox(height: 20),
                  Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: ColorSelect.girdColor.withOpacity(0.3),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              'START NEW COUNT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 150),
                          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12)
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _proceedToProductLookup = true;
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        _proceedToProductLookup = false;
                        Navigator.pushNamed(context, '/count_screen');
                      });
                    });
                  });
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.white, size: 25),
                        SizedBox(width: 20),
                        Center(
                          child: Text(
                            'LOOKUP PRODUCT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// decoration: BoxDecoration(
//   image: DecorationImage(
//     image: AssetImage('assets/images/profile.png'),
//     fit: BoxFit.cover,
//   ),
//   borderRadius:
//   BorderRadius.all(Radius.circular(20.0),),
// ),