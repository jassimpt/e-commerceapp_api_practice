import 'package:ecommerce/services/productapi.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SizedBox(
              // ,
              child: FutureBuilder(
                future: ProductApiService().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final produtdata = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: size.width * .5,
                            height: size.height * .2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * .15,
                                  width: size.width * .46,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(produtdata.image!),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    produtdata.title!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text(snapshot.error.toString());
                  }
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
