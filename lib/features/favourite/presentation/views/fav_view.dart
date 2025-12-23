import 'package:cure/features/favourite/presentation/widgets/fav_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Your Favourites'),
      ),
      body: FavViewBody(),
    );
  }
}
