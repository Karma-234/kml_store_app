import 'package:ecommerce_app/core/services/api/store_api/store_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DashView extends StatefulWidget {
  DashView({super.key});

  @override
  State<DashView> createState() => _DashViewState();
}

class _DashViewState extends State<DashView>
    with SingleTickerProviderStateMixin {
  var getProducts = StoreApi();
  late final tabCtrl = TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          TabBar(
            labelStyle: GoogleFonts.inter(fontSize: 14.0),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.blueGrey,
            controller: tabCtrl,
            tabs: const [
              Tab(
                text: 'All Products',
              ),
              Tab(
                text: 'Jewelery',
              ),
              Tab(
                text: 'Men\'s Clothing',
              ),
              Tab(
                text: 'Women\'s Clothing',
              ),
              Tab(
                text: 'Electronics',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              viewportFraction: 1,
              controller: tabCtrl,
              children: [
                ProductList(stream: getProducts.getAllProducts().asStream()),
                ProductList(
                    stream: getProducts.getCategory('jewelery').asStream()),
                ProductList(
                    stream:
                        getProducts.getCategory('men\'s clothing').asStream()),
                ProductList(
                    stream: getProducts
                        .getCategory('women\'s clothing')
                        .asStream()),
                ProductList(
                    stream: getProducts.getCategory('electronics').asStream()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.stream,
  });
  final Stream<dynamic>? stream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var data = snapshot.data!;
        return ListView.separated(
          itemCount: data.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              leading: data[index]['image'] == null
                  ? const CircleAvatar()
                  : Image(
                      image: NetworkImage(data[index]['image']),
                      width: 59.0.w,
                    ),
              title: Text(data[index]['title'].toString()),
              subtitle: Text(
                data[index]['description'].toString(),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.inter(),
              ),
              trailing: Text('\$${data[index]['price'].toString()}'),
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      builder: (context, scrollController) {
                        return Column();
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
