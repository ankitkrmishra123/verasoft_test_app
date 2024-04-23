import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verasoft_test/utility/color.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: ColorSelect.girdColor.withOpacity(0.1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
                  IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
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
                  const SizedBox(width: 130),
                  SvgPicture.asset('assets/images/bars_solid.svg', width: 20, height: 20),
                  const SizedBox(height: 10),
                ]),
                // Divider(height: 1),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorSelect.girdColor.withOpacity(0.15),
                      ),
                      child: const Center(
                        child: Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text('FULL COUNT', style: TextStyle(color: Colors.white, fontSize: 22)),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text('count #305032', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ]),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorSelect.girdColor.withOpacity(0.10),
                      ),
                      child: const Center(child: Text('STARTED TODAY AT 8:03 AM BY AMANDA J', style: TextStyle(color: Colors.white, fontSize: 12))),
                    ),
                   // Divider(height: 1,),
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
                                color: Colors.grey.withOpacity(0.4),
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                              ),
                              child: Center(
                                child: Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    index == 0 ? const Padding(padding: EdgeInsets.only(left: 35.0), child:  Text('0', style:TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold))) : const Padding(padding: EdgeInsets.only(left: 10.0), child: Text('4605', style:TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold))),
                                    index == 0 ? const Text('ITEMS COUNTED', style: TextStyle(color: Colors.white, fontSize: 14)) : const Text('ITEMS REMAINING', style: TextStyle(color: Colors.white, fontSize: 14)),
                                    const SizedBox(height: 10),
                                    index == 0 ? const Padding(padding:  EdgeInsets.only(left: 15.0), child:  Text('nothing counted', style: TextStyle(color: Colors.white, fontSize: 12)))
                                        :  const Padding(padding:  EdgeInsets.only(left: 15.0), child: Text('100% of 4,605', style: TextStyle(color: Colors.white, fontSize: 12)),),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                    const SizedBox(height: 5),
                    const Divider(thickness: 0.45),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Align(alignment: Alignment.centerLeft, child: Text('Finish Later', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 0.45),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Align(alignment: Alignment.centerLeft, child: Text('Cancel Count', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 0.45),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Align(alignment: Alignment.centerLeft, child: Text('Complete Count', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 0.45),
                    const SizedBox(height: 45),
                  ],
                ),
                const SizedBox(height: 45),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue),
                    SizedBox(width: 5),
                    Text('SCAN AFTER SCAN', style: TextStyle(color: Colors.white, fontSize: 14))
                  ],
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(22), bottomLeft: Radius.circular(22)),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'BROWSE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(22), bottomRight: Radius.circular(22)),
                                color: Colors.blue,
                              ),
                              child: const Center(
                                child: Text(
                                  'COUNT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
