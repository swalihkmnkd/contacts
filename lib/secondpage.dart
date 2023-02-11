import 'package:firebase/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider1.dart';

class S extends StatelessWidget {
  
  const S({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey ,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyfireBaseDemo(from: "new", id: "", heading: "Add accound")));
          }, icon: Icon(Icons.add_circle_outline_sharp,size: 40,))
        ],
      ),
      body: Container(
        child: Consumer<Fireprovider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.modellist.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                          ),
                          title: Text(value.modellist[index].Name.toString()),
                           subtitle:
                              Text(value.modellist[index].Phone.toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Edit'),
                              onPressed: () {


                                String id=value.modellist[index].id.toString();
                                value.updateDocument(id);


                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyfireBaseDemo(from: "edit",id:id,heading: "hlo", ),));
                                // value.getdataa();
                              },
                            ),

                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () {
                              value.deleteData(value.modellist[index].id.toString());
                              value.getdataa();
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
