import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/detail_shop.dart';

List<Produkt> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Produkt>((json) => Produkt.fromJson(json)).toList();
}

Future<List<Produkt>> fetchPhotos() async {
  final response = await get('http://10.0.2.2:8080/vitaChi/findAll/Accessoire');

  return compute(parsePhotos, response.body);
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}


class _BodyState extends State<Body> {


  /*Future<List<Produkt>> getData() async {
    Response response = await get('http://10.0.2.2:8080/vitaChi/findAll/Accessoire');
    print("response" + response.body);
    var parsedJson = json.decode(response.body);

  }*/




  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "VitaShop",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.hasData
                    ? ProductsList(products: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              }else{
                return Image(image: AssetImage('assets/logo.png'));
              }
            }
          ),
        ))
      ],
    );
  }
}
/*
class ProduktKarte extends StatelessWidget {
  final Produkt produkt;

  ProduktKarte({Key key, this.produkt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(16)),
            child: FittedBox(
              child: Icon(
                Icons.laptop_chromebook,
                size: MediaQuery.of(context).size.height / 7,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              produkt.title,
            ),
          ),
          Text(
            "234€",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
*/

class ProductsList extends StatelessWidget {
  final List<Produkt> products;
  ProductsList({Key key, this.products}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>
                      DetailShop(data: products[index])));*/
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xff54a2fc), Color(0xff6bc2fa)]),
                            borderRadius: BorderRadius.circular(
                                16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              image: NetworkImage(
                                  products[index].bildpfad),
                            ),
                            Text(
                              products[index].bezeichnung,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width/20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                    )
                ),
              ],
            ),
          );
        });;
  }
}



