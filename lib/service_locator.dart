import 'package:football_shop_app/data/auth/repository/auth.dart';
import 'package:football_shop_app/data/auth/source/auth_firebase_service.dart';
import 'package:football_shop_app/data/category/repository/category.dart';
import 'package:football_shop_app/data/category/source/category_firebase_service.dart';
import 'package:football_shop_app/data/order/repository/order.dart';
import 'package:football_shop_app/data/order/source/order_firebase_service.dart';
import 'package:football_shop_app/data/product/repository/product.dart';
import 'package:football_shop_app/data/product/source/product_firebase_service.dart';
import 'package:football_shop_app/domain/auth/repository/auth.dart';
import 'package:football_shop_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:football_shop_app/domain/auth/usecases/signin.dart';
import 'package:football_shop_app/domain/auth/usecases/signup.dart';
import 'package:football_shop_app/domain/category/repository/category.dart';
import 'package:football_shop_app/domain/category/usecases/get_categories.dart';
import 'package:football_shop_app/domain/order/repository/order.dart';
import 'package:football_shop_app/domain/order/usecases/add_to_cart.dart';
import 'package:football_shop_app/domain/order/usecases/get_cart_products.dart';
import 'package:football_shop_app/domain/order/usecases/remove_cart_product.dart';
import 'package:football_shop_app/domain/product/repository/product.dart';
import 'package:football_shop_app/domain/product/usecases/get_new_products.dart';
import 'package:football_shop_app/domain/product/usecases/get_product_by_category_id.dart';
import 'package:football_shop_app/domain/product/usecases/get_recommended.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Services
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl()
  );

  sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl()
  );

  sl.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl()
  );
  //Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<CategoryReposiory>(
    CategoryReposioryImpl()
  );

  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl()
  );

  sl.registerSingleton<OrderRepository>(
    OrderRepositoryImpl()
  );
  //Usecaces
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

   sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase()
  );

  sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase()
  );

  sl.registerSingleton<GetNewProductsUseCase>(
    GetNewProductsUseCase()
  );

  sl.registerSingleton<GetRecommendedUseCase>(
    GetRecommendedUseCase()
  );

  sl.registerSingleton<GetProductByCategoryIdUseCase>(
    GetProductByCategoryIdUseCase()
  );

  sl.registerSingleton<AddToCartUseCase>(
    AddToCartUseCase()
  );

  sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase()
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
    RemoveCartProductUseCase()
  );
}