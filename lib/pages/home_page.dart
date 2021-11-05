import '../models/Product.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/catalog.dart';
import '../widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build HomePage');

    final productData = context.watch<ProductDataProvider>();

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height - 85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                )),
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      'Transfermarkt official',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('The best players on their position',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    trailing: Icon(Icons.sports_football)
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productData.items.length,
                      itemBuilder: (context, int index) =>
                          ChangeNotifierProvider.value(
                            value: productData.items[index],
                            child: ItemCard(),
                          )),
                ),
                ...productData.items.map((value) {
                  return CatalogListTile(imgUrl: value.imgUrl);
                }).toList(),
              ],
            )),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
