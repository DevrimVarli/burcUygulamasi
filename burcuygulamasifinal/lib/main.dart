import 'package:burclar_uygulamasi/BurcDetay.dart';
import 'package:burclar_uygulamasi/Burclardao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'burclar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Burclar>>burclariGetir() async{
    var burcListesi=Burclardao().tumBurclariGetir();
    return burcListesi;

  }
  @override
  Widget build(BuildContext context) {
    
    
    
    
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Burclar Listesi"),
      ),
      body: FutureBuilder<List<Burclar>>(
        future: burclariGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var burcListesi=snapshot.data;
            return ListView.builder(
                itemCount:burcListesi!.length ,
                itemBuilder: (context,indeks){
                  var burc=burcListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay(burc)));

                    },
                    child: Card(
                      child: Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 100,
                                child: Image.asset("resimler/${burc.burc_resim}")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${burc.burc_ad}",style: TextStyle(fontSize: 20),),
                                Text("${burc.burc_tarih}",style: TextStyle(fontSize: 15),),

                              ],
                            ),
                          ),
                          Spacer(),

                          IconButton(onPressed: (){


                          }, icon: Icon(Icons.keyboard_arrow_right_rounded)),
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          else{
            return Center();
            
          }
        },
      )

    );
  }
}
