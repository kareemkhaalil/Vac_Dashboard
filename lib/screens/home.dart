import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/bloc/cubits/cubit/home_cubit.dart';
import 'package:project_management/models/admins_model.dart';
import 'package:project_management/screens/admins_screen.dart';
import 'package:project_management/screens/articles_screen.dart';
import 'package:project_management/screens/dashboard_screen.dart';
import 'package:project_management/screens/icons_screen.dart';
import 'package:project_management/screens/schadule_screen.dart';
import 'package:project_management/screens/tags_screen.dart';
import 'package:project_management/utils/theme/appColors.dart';
import 'package:project_management/widgets/background.dart';
import 'package:project_management/widgets/drawer_icon.dart';
import 'package:project_management/widgets/glass_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.adminModel,
  }) : super(key: key);
  final AdminModel? adminModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final screenSize = MediaQuery.sizeOf(context);
          final height = screenSize.height;
          final width = screenSize.width;
          final heightUnit = 1 / height;
          final widthUnit = 1 / width;
          var cubit = context.read<HomeCubit>();
          return Background(
            screenHeight: height,
            screenWidth: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Stack(
                children: [
                  _buildPage(
                    context,
                    height,
                    width,
                    heightUnit,
                    widthUnit,
                    adminModel,
                  ),
                  Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Align(
                      alignment: AlignmentGeometry.lerp(
                        Alignment.centerLeft,
                        Alignment.centerLeft,
                        0.5,
                      )!,

                      /// Drawer
                      child: GestureDetector(
                        onTap: cubit.toggleDrawer,
                        child: GlassmorphismContainer(
                          height: height,
                          width: width * cubit.scale,
                          colors: [
                            AppColors.backgroundColor.withOpacity(0.4),
                            AppColors.backgroundColor.withOpacity(0.4),
                          ],
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height * 0.2,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Dashboard',
                                      icon: FluentIcons.home_28_regular,
                                      onTap: () {
                                        cubit.dashboardPage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Admins',
                                      icon: FluentIcons.person_28_regular,
                                      onTap: () {
                                        cubit.adminsPage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Articels',
                                      icon: FluentIcons.edit_28_regular,
                                      onTap: () {
                                        cubit.articlesPage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Schadule',
                                      icon: FluentIcons.calendar_add_28_regular,
                                      onTap: () {
                                        cubit.scadulePage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Tags',
                                      icon: FluentIcons.tag_28_regular,
                                      onTap: () {
                                        cubit.tagsPage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.03,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Icons',
                                      icon: FluentIcons.icons_24_regular,
                                      onTap: () {
                                        cubit.iconsPage();
                                      },
                                    ),
                                    SizedBox(
                                      height: height * 0.3,
                                    ),
                                    DrawerIcon(
                                      width: width,
                                      height: height,
                                      drawer: cubit.drawerOpen,
                                      text: 'Log out',
                                      icon: FluentIcons.sign_out_24_regular,
                                      onTap: () {
                                        cubit.signOut(context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    height,
    width,
    heightUnit,
    widthUnit,
    adminModel,
  ) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();

        return IndexedStack(index: cubit.currentPageIndex, children: [
          DashboardScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
            adminModel: adminModel,
          ),
          AdminsScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
          ),
          ArticlesScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
          ),
          ScaduleScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
          ),
          TagsScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
          ),
          IconsScreen(
            height: height,
            width: width,
            heightUnit: heightUnit,
            widthUnit: widthUnit,
          ),
        ]);
      },
    );
  }
}
