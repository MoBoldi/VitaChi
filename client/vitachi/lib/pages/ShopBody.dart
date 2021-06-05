import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/detail_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}


class _BodyState extends State<Body> {

  var products = List<Produkt>();

  Future<List<Produkt>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("UserID");
    Response response = await get('http://10.0.2.2:8080/vitaChi/getOpenAccessoire/$id');
    var productsJson = json.decode(response.body);
    for(var productJson in productsJson){
      products.add(Produkt.fromJson(productJson));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
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
                child: products.isEmpty ?
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height/3,
                        ),
                        Text(
                          "Du hast nicht genug Geld oder bereits alles gekauft!",
                          style: TextStyle(
                            fontSize: size.width / 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]
                    ),
                    width: size.width/1.12,
                  ) : FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
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
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                        DetailShop(data: products[index],)));
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
    image: AssetImage(products[index].bildpfad)
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
    });
    }else{
    return Image(image: AssetImage('assets/LogoSlider.png'));
    }
    }
    ),
            ))],
      ),
    );
  }
}

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
                                  products[index].bildpfad
                              ),
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
        });
  }
}



