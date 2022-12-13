import 'package:flutter/material.dart';
import 'package:queen_care/modules/auth/pages/select_lan/select_lang.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
Future.delayed(const Duration(seconds: 2)).then((value) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const SelectLanguage()));
});
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body:Padding(padding: const EdgeInsets.all(70),
        child:  Center(
        child: Image.asset('assets/images/logo.png',),
    ),)
    );
  }
}
