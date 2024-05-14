import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/home/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<HomeProvider>(),
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: provider.currentPage,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: provider.currentIndex,
                selectedItemColor: primaryDarkColor,
                showUnselectedLabels: false,
                onTap: (index) {
                  provider.changePage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: "History",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile",
                  ),
                ],
              ),
            );
          },
        ));
  }
}
