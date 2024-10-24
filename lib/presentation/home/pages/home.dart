import 'package:flutter/material.dart';
import 'package:football_shop_app/presentation/home/widgets/about_us.dart';
import 'package:football_shop_app/presentation/home/widgets/categories.dart';
import 'package:football_shop_app/presentation/home/widgets/get_recommended.dart';
import 'package:football_shop_app/presentation/home/widgets/header.dart';
import 'package:football_shop_app/presentation/home/widgets/new_products.dart';
import 'package:football_shop_app/presentation/home/widgets/rgolbanner.dart';
import 'package:football_shop_app/presentation/home/widgets/sale.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Header(),
                Sale(),
                Categories(),
                SizedBox(height: 30),
                NewProducts(),
                SizedBox(height: 30),
                GetRecommended(),
                SizedBox(height: 20),
                Rgolbanner(),
                SizedBox(height: 20),
                AboutUs(),
              ],
            ),
          ),
        
      ),
    );
  }
}