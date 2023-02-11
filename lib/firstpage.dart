import 'package:firebase/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider1.dart';

class MyfireBaseDemo extends StatelessWidget {
  String from;
  String id;
  String heading;


  MyfireBaseDemo({Key? key,required this.from,required  this.id,required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fireprovider donationProvider =
        Provider.of<Fireprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(

          body: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows:[
                      Shadow(
                        color: Colors.red,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.black, thickness: 5,),
                donationProvider.textfield(name: "Name", hint: "enter your name",controller:donationProvider.name1),
                donationProvider.textfield(name: "Age", hint: "enter your age",controller:donationProvider.age1),
                donationProvider.textfield(name: "Phone", hint: "enter your phone number",controller:donationProvider.phone1),
                Divider(thickness: 3,),
                SizedBox(height: 50,
                  width: 100,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shape: StadiumBorder()),
                      onPressed: () {
                        donationProvider.getdataa();
                        donationProvider.addData(from,id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => S(),),);
                        },
                        child: Text("Done")),
                ),
              ],
          ),
      ),
    );
  }
}

