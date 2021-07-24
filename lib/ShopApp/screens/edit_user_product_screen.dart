import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/ShopApp/models/product.dart';
import 'package:projects/ShopApp/providers/product_provider.dart';
import 'package:provider/provider.dart';

class EditUserProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditUserProductScreenState();
  }
}

class _EditUserProductScreenState extends State<EditUserProductScreen> {
  FocusNode _priceFocusNode = FocusNode();
  FocusNode _descFocusNode = FocusNode();
  FocusNode _imageURLFocusNode = FocusNode();

  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  initState() {
    super.initState();
  }

  dispose() {
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageUrlController.dispose();
    _imageURLFocusNode.dispose();
    super.dispose();
  }

  void saveFormState(Product product, String title, double price, String desc) {
    formKey.currentState!.save();
    product.title = title;
    product.price = price;
    product.desc = desc;
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Product? product = productProvider
        .findProduct(ModalRoute.of(context)!.settings.arguments as String);

    _titleController.text = (product != null ? product.title : '')!;
    _priceController.text = product != null ? product.price.toString() : '';
    _descController.text = (product != null ? product.desc : '')!;

    return Scaffold(
        appBar: AppBar(title: Text('Edit Product'), actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                productProvider.updateProduct(product!, _titleController.text,
                    double.parse(_priceController.text), _descController.text).then((_) => Navigator.of(context).pop());
              })
        ]),
        body: Form(
            key: formKey,
            child: ListView(children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                controller: _titleController,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descFocusNode);
                  }),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                controller: _descController,
                keyboardType: TextInputType.multiline,
                focusNode: _descFocusNode,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter URL')
                        : FittedBox(
                            child: Image.network(_imageUrlController.text),
                            fit: BoxFit.contain)),
                Expanded(
                  child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) {}),
                )
              ])
            ])));
  }
}
