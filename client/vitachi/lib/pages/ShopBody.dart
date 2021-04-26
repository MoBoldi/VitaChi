import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/entitys/Produkt.dart';
import 'package:vitachi/pages/detail_shop.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();

}


class _BodyState extends State<Body> {

  var products = List<Produkt>();

  Future<List<Produkt>> getData() async {
    Response response = await get('http://10.0.2.2:8080/vitaChi/getOpenAccessoire/1');
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
            child: FutureBuilder(
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
          ))
        ],
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



