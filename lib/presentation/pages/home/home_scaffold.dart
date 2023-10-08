import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hankofiles/constants/colors.dart';

class HomeScaffold extends StatefulWidget {
  final Widget child;
  const HomeScaffold({super.key, required this.child});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int get _currentIndex => _locationToTabIndex(GoRouterState.of(context).uri.toString());

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) async{
    // final accessToken = await SessionManager.getSecureLocalValue(key: ESP.espAccessT);
    // if (tabIndex != _currentIndex) {

    //   // run a fetch for data realted to the selected tab (by index)
    //   runFunction(accessToken, tabs[tabIndex].initialLocation, context);
    //   // go to the initial location of the selected tab (by index)
    //   context.go(tabs[tabIndex].initialLocation);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (index) => _onItemTapped(context, index),
        showUnselectedLabels: true,
        backgroundColor: kWhite,
        selectedItemColor: kRed,
        unselectedItemColor: kBlack.withOpacity(0.1),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
      }, backgroundColor: kRed, shape: const CircleBorder(), elevation: 8, child: const IconButton(iconSize: 30, onPressed: null, color: kRed, icon: Icon(Icons.add))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeScaffoldNavBarTabItem extends BottomNavigationBarItem {
  final String initialLocation;
  const HomeScaffoldNavBarTabItem( 
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

}

const tabs = [
  HomeScaffoldNavBarTabItem(
    initialLocation: '/home',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  HomeScaffoldNavBarTabItem(
    initialLocation: '/explore',
    icon: Icon(Icons.explore),
    label: 'Explore',
  ),
 
  HomeScaffoldNavBarTabItem(
    initialLocation: '/profile',
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  ),
];

runFunction(String accessToken,String initialLocation, BuildContext context)async {
  switch (initialLocation) {
    // case "/home":
    //   context.read<ReadingCubit>().getArticles(accessToken);
    //           context.read<WatchingCubit>().getVideos(accessToken);
    //           context.read<NoticeBoardCubit>().getBoardListing(accessToken);
    //           context.read<InfographicCubit>().getInfographics(accessToken);
    //           context.read<DuaCubit>().getDuas(accessToken);
    //           context.read<BlogCubit>().getBlogs(accessToken);
    //   break;
    // case "/explore":
    //   context.read<ReadingCubit>().getArticles(accessToken);
    //   context.read<WatchingCubit>().getVideos(accessToken);
    //   context.read<NoticeBoardCubit>().getBoardListing(accessToken);
    //   context.read<InfographicCubit>().getInfographics(accessToken);
    //   context.read<DuaCubit>().getDuas(accessToken);
    //   context.read<BlogCubit>().getBlogs(accessToken);
    //   break;
    // case "/directory":
    //   context.read<BusinessCubit>().getBusinesses(accessToken);
    //   context.read<BusinessCubit>().getBusinessCategories(accessToken);
    //   break;
    // case "/profile":
    //   context.read<ProfileCubit>().getBookmarks(accessToken);
    //   break;
    // default:
    //   break;
  }
}