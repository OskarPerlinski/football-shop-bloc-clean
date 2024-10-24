import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/categories/categories_state.dart';
import 'package:football_shop_app/common/bloc/categories/categories_state_cubit.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/domain/category/entity/category.dart';
import 'package:football_shop_app/presentation/category_products/page/category_products.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesStateCubit()..displayCategories(),
      child: BlocBuilder<CategoriesStateCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _categories(state.categories),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return Container(
      color: Colors.black87,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    AppNavigator.push(
                        context,
                        CategoryProductsPage(
                          categoryEntity: categories[index],
                        ));
                  },
                  child: Text(
                    categories[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 30),
            itemCount: categories.length,
          ),
        ),
      ),
    );
  }
}
