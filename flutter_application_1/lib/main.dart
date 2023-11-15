import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce App'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MySearchBox(),
            ),
            SliverToBoxAdapter(
              child: UserProfileBorder(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Belanja berdasarkan kategori',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      '',
                      '',
                      'https://placekitten.com/200/200',
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CategoryCard(
                      '',
                      '',
                      'https://placekitten.com/200/200',
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CategoryCard(
                      '',
                      '',
                      'https://placekitten.com/200/200',
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: CategoryCard(
                      '',
                      '',
                      'https://placekitten.com/200/200',
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Semua Produk',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          'Product ${index * 2 + 1}',
                          'Description for Product ${index * 2 + 1}',
                          20.0 + index.toDouble(),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: ProductCard(
                          'Product ${index * 2 + 2}',
                          'Description for Product ${index * 2 + 2}',
                          30.0 + index.toDouble(),
                        ),
                      ),
                    ],
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://placekitten.com/100/100',
            ),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Followers: 1000', 
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MySearchBox extends StatefulWidget {
  @override
  _MySearchBoxState createState() => _MySearchBoxState();
}

class _MySearchBoxState extends State<MySearchBox> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Type your search query...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        onChanged: (value) {
        
          print('Search query: $value');
          
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  CategoryCard(this.name, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 150.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  ProductCard(this.name, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://placekitten.com/200/200', 
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      
                      print('Tambahkan ke Keranjang: $name');
                    },
                    child: Text('+ Keranjang'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
