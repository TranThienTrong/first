import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:projects/ShopApp/widgets/app_drawer.dart';
import 'package:projects/ShopApp/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatefulWidget {


  @override
  _UserProductScreenState createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {
  ProductProvider? productProvider;
  @override
  void didChangeDependencies() {
    if(productProvider == null){
      productProvider = Provider.of<ProductProvider>(context);
      productProvider!.getUserProductFromDB();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Product'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: (context, index) {
            return UserProductItem(ProductProvider.userProductList[index]);
        }, itemCount:ProductProvider.userProductList.length),
      ),
    );
  }
}
