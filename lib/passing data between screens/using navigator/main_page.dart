import 'package:flutter/material.dart';
import 'package:flutter_app1/passing%20data%20between%20screens/using%20navigator/details_Page.dart';
import 'package:flutter_app1/passing%20data%20between%20screens/using%20navigator/dummy_data.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ProductMain(),
    routes: {
      'details': (context) => ProductDetails(),
    },
  ));
}

class ProductMain extends StatelessWidget {
  const ProductMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        // children: products
        //     .map((product) => InkWell(
        //           onTap: () => Navigator.pushNamed(context, 'details',
        //               arguments: product['id']),
        //           child: Card(
        //             child: Column(
        //               children: [
        //                 Container(
        //                   height: 150,
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           fit: BoxFit.cover,
        //                           image: NetworkImage(product['image']))),
        //                 ),
        //                 Text(product['name']),
        //                 Text('${product['price']}\$'),
        //               ],
        //             ),
        //           ),
        //         ))
        //     .toList(),
        children: List.generate(
            products.length,
            (index) => InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed('details', arguments: products[index]['id']),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(products[index]['image']))),
                        ),
                        Text(products[index]['name']),
                        Text('${products[index]['price']}\$'),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
