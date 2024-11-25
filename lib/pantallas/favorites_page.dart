import 'package:flutter/material.dart';
import 'package:my_first_app/provider/my_app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No tienes favoritos'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Text('Tienes ${appState.favorites.length} favoritos:'),
        ),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 400 / 80,
            ),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      appState.removeFavorite(pair);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      semanticLabel: 'Eliminar',
                    ),
                    color: theme.colorScheme.primary,
                  ),
                  title: Text(
                    pair.asLowerCase,
                    semanticsLabel: pair.asPascalCase,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
