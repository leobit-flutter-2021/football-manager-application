import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/Cart.dart';
import '../models/Product.dart';
import '../pages/cart_page.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductDataProvider>().getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 1200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Price: ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(data.description),
                    SizedBox(
                      height: 20.0,
                    ),
                    context
                            .watch<CartDataProvider>()
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                  color: Color(0xFFCCFF90),
                                  child: Text('Go to cart'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ));
                                  }),
                              Text(
                                'This player has been added to the purchase list',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          )
                        : MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('Add to list'),
                            onPressed: () {
                              context.read<CartDataProvider>().addItem(
                                    productId: data.id,
                                    imgUrl: data.imgUrl,
                                    title: data.title,
                                    price: data.price,
                                  );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
