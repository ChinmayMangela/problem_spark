import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/constants/icon_constants.dart';
import 'package:problem_spark/constants/string_constants.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_state.dart';
import 'package:problem_spark/features/credits_store/presentation/screens/credits_store_screen.dart';
import 'package:problem_spark/features/problem_discover/presentation/screens/problem_discover_screen.dart';
import 'package:problem_spark/features/problem_library/presentation/screens/problem_library.dart';
import 'package:problem_spark/features/splash/presentation/widgets/app_logo.dart';
import 'package:problem_spark/features/user_data/presentation/screens/profile_screen.dart';
import 'package:problem_spark/home_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ProblemDiscoverScreen(),
    ProblemLibraryScreen(),
    CreditsStoreScreen(),
    ProfileScreen(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return _buildAppBar(state);
          },
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar(AuthState state) {
    final userNameFirstCharacter = state is Authenticated
        ? state.endUser.name[0]
        : 'C';
    return AppBar(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 6),
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: AppLogo(height: 30, width: 30, iconSize: 20),
      ),
      title: Text(
        appName,
        style: TextThemes(
          context,
        ).titleLarge.copyWith(fontWeight: TextWeights.w900),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(shape: BoxShape.circle, color: grey),
          child: Text(userNameFirstCharacter),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return _screens[_selectedIndex];
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        tabBackgroundColor: black,
        padding: EdgeInsets.all(15),
        activeColor: white,
        gap: 8,
        tabs: [
          GButton(icon: homeIcon, text: homeLabel),
          GButton(icon: discoverIcon, text: discoverLabel),
          GButton(icon: libraryIcon, text: libraryLabel),
          GButton(icon: storeIcon, text: storeLabel),
          GButton(icon: profileIcon, text: profileLabel),
        ],
      ),
    );
  }
}
