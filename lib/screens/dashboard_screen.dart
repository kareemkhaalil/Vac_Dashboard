import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/bloc/cubits/cubit/home_cubit.dart';
import 'package:project_management/models/admins_model.dart';
import 'package:project_management/utils/theme/appColors.dart';
import 'package:project_management/widgets/glass_button.dart';
import 'package:project_management/widgets/glass_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    this.height,
    this.width,
    this.heightUnit,
    this.widthUnit,
    required this.adminModel,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? heightUnit;
  final double? width;
  final double? widthUnit;
  final AdminModel? adminModel;
  // final IconModel? iconModel;

  @override
  Widget build(BuildContext context) {
    if (adminModel == null) {
      return const Center(
        child:
            CircularProgressIndicator(), // عرض Loader أو أي واجهة محتوى مؤقتة
      );
    } else {
      return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          bool isDropdownOpen = state
              is DropdownMenuOpen; // تحقق مما إذا كانت القائمة المنسدلة مفتوحة

          void openDropdownMenu() {
            cubit.openDropdownMenu();
          }

          void closeDropdownMenu() {
            cubit.closeDropdownMenu();
          }

          return Center(
            child: GlassmorphismContainer(
              height: height! * 0.98,
              width: width! * 0.99,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GlassmorphismContainer(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                    top: 20,
                                  ),
                                  child: GlassmorphismButton(
                                    width: width! * 0.15,
                                    height: height! * 0.05,
                                    onPressed: () {
                                      cubit.toggleDropDown();
                                    },
                                    text: 'New',
                                    textColor: AppColors.accentColor,
                                    colors: [
                                      AppColors.backgroundColor
                                          .withOpacity(0.8),
                                      AppColors.backgroundColor
                                          .withOpacity(0.8),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            cubit.dropOpen
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: width! * 0.075),
                                        child: Icon(Icons.arrow_drop_down,
                                            size: 30,
                                            color: AppColors.backgroundColor
                                                .withOpacity(0.8)),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20),
                                  child: Column(
                                    children: [
                                      GlassmorphismContainer(
                                        height: height! * cubit.dropScale,
                                        width: width! * 0.3,
                                        colors: [
                                          AppColors.backgroundColor
                                              .withOpacity(0.4),
                                          AppColors.backgroundColor
                                              .withOpacity(0.4),
                                        ],
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(height! * 0.02),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height! * 0.07,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width! * 0.03),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GlassmorphismContainer(
                                  width: width! * 0.7,
                                  height: height! * 0.15,
                                  borderRadius:
                                      BorderRadius.circular(height! * 0.03),
                                  colors: [
                                    const Color(0xffffeaa7).withOpacity(0.9),
                                    const Color(0xfffdcb6e).withOpacity(0.6),
                                  ],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(7, (index) {
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015),
                                                child: Column(
                                                  children: [
                                                    adminModel!.imageUrl != null
                                                        ? CircleAvatar(
                                                            radius: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.05,
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    adminModel!
                                                                        .imageUrl!),
                                                          )
                                                        : Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.08,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.08,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.01,
                                                    ),
                                                    Text(
                                                      adminModel!.userName !=
                                                              null
                                                          ? adminModel!
                                                              .userName!
                                                          : 'Unknown User',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: "Raleway",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width! * 0.04,
                                      ),
                                      // SizedBox(
                                      //   height: height! * 0.15,
                                      //   width: width! * 0.5,
                                      //   child: Padding(
                                      //     padding:
                                      //         EdgeInsets.all(height! * 0.008),
                                      //     child: Column(
                                      //       children: [
                                      //         adminModel!.imageUrl != null
                                      //             ? CircleAvatar(
                                      //                 radius: width! * 0.05,
                                      //                 backgroundImage:
                                      //                     NetworkImage(
                                      //                         adminModel!
                                      //                             .imageUrl!),
                                      //               )
                                      //             : Container(
                                      //                 width: width! * 0.08,
                                      //                 height: height! * 0.08,
                                      //                 decoration:
                                      //                     const BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   shape: BoxShape.circle,
                                      //                 ),
                                      //               ),
                                      //         SizedBox(
                                      //           height: height! * 0.01,
                                      //         ),
                                      //         Text(
                                      //           adminModel!.userName != null
                                      //               ? adminModel!.userName!
                                      //               : 'Unknown User',
                                      //           style: const TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 20,
                                      //             fontWeight: FontWeight.w400,
                                      //             fontFamily: "Raleway",
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),

                                      SizedBox(
                                        width: width! * 0.08,
                                        height: height! * 0.15,
                                        child: GestureDetector(
                                          onTap: () {
                                            debugPrint('more admins');
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: width! * 0.03),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        FluentIcons
                                                            .chevron_right_24_regular,
                                                        color: AppColors
                                                            .backgroundColor
                                                            .withOpacity(0.8),
                                                        size: height! * 0.05,
                                                      ),
                                                      SizedBox(
                                                        height: height! * 0.01,
                                                      ),
                                                      const Text(
                                                        'More',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Raleway",
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GlassmorphismContainer(
                      child: Padding(
                        padding: EdgeInsets.all(
                          height! * 0.03,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height! * 0.03,
                            ),
                            adminModel!.imageUrl != null
                                ? CircleAvatar(
                                    radius: width! * 0.1,
                                    backgroundImage:
                                        NetworkImage(adminModel!.imageUrl!),
                                  )
                                : Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: width! * 0.2,
                                        height: height! * 0.2,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                      ),
                                      Positioned(
                                        bottom: height! * 0.001,
                                        right: width! * 0.04,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: width! * 0.015,
                                              backgroundColor:
                                                  AppColors.darkColor,
                                            ),
                                            Positioned(
                                              top: height! * 0.001,
                                              left: width! * 0.0015,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  FluentIcons
                                                      .camera_add_48_regular,
                                                  color:
                                                      AppColors.backgroundColor,
                                                  size: height! * 0.04,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: height! * 0.02,
                            ),
                            Text(
                              adminModel!.userName != null
                                  ? adminModel!.userName!
                                  : 'Unknown User',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Raleway",
                              ),
                            ),
                            SizedBox(
                              height: height! * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FluentIcons.edit_28_regular,
                                          color: AppColors.backgroundColor,
                                          size: height! * 0.03,
                                        ),
                                        SizedBox(
                                          width: width! * 0.01,
                                        ),
                                        Text(
                                          adminModel!.articles != null
                                              ? adminModel!.articles!.toString()
                                              : '0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height! * 0.02,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Raleway",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height! * 0.06,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FluentIcons.calendar_add_28_regular,
                                          color: AppColors.backgroundColor,
                                          size: height! * 0.03,
                                        ),
                                        SizedBox(
                                          width: width! * 0.01,
                                        ),
                                        Text(
                                          adminModel!.schedule != null
                                              ? adminModel!.schedule!.toString()
                                              : '0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height! * 0.02,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Raleway",
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: width! * 0.05,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FluentIcons.tag_28_regular,
                                          color: AppColors.backgroundColor,
                                          size: height! * 0.03,
                                        ),
                                        SizedBox(
                                          width: width! * 0.01,
                                        ),
                                        Text(
                                          adminModel!.tags != null
                                              ? adminModel!.tags!.toString()
                                              : '0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height! * 0.02,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Raleway",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height! * 0.05,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FluentIcons.icons_24_regular,
                                          color: AppColors.backgroundColor,
                                          size: height! * 0.03,
                                        ),
                                        SizedBox(
                                          width: width! * 0.01,
                                        ),
                                        Text(
                                          adminModel!.icons != null
                                              ? adminModel!.icons!.toString()
                                              : '0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height! * 0.02,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Raleway",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height! * 0.05,
                            ),
                            Container(
                              height: 1,
                              width: width! * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
