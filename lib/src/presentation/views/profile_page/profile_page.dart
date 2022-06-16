import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../widgets/leading_icon_app_bar.dart';
import '../../widgets/title_app_bar.dart';
import 'components/header_widget.dart';
import 'components/item_menu_profile.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'ProfilePage';

  const ProfilePage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var sizer = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIconAppBar(
          iconData: EvaIcons.arrowIosBackOutline,
        ),
        title: const TitleAppBar(
          title: 'Profile',
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: sizer.w(24),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.settingsOutline,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizer.w(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizer.hwt(20),
              ),
              const HeaderWidget(),
              SizedBox(
                height: sizer.hwt(30),
              ),
              Stack(
                children: [
                  const ItemMenuProfile(
                    evaIcons: EvaIcons.creditCardOutline,
                    onSubtitle: true,
                    title: 'Payment Method',
                    subTitle: 'Mastercard : 3424',
                    redColor: false,
                  ),
                  Positioned(
                    right: sizer.w(10),
                    bottom: sizer.hwt(33),
                    child: SizedBox(
                        width: sizer.w(60),
                        height: sizer.hwt(24),
                        child: Image.asset('assets/images/MasterCard.png')),
                  ),
                ],
              ),
              SizedBox(
                height: sizer.hwt(15),
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.pinOutline,
                onSubtitle: false,
                title: 'Save adress',
                subTitle: '',
                redColor: false,
              ),
              SizedBox(
                height: sizer.hwt(15),
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.bellOffOutline,
                onSubtitle: false,
                title: 'Notifications',
                subTitle: '',
                redColor: false,
              ),
              SizedBox(
                height: sizer.hwt(15),
              ),
              Stack(children: [
                const ItemMenuProfile(
                  evaIcons: EvaIcons.syncOutline,
                  onSubtitle: false,
                  title: 'Order history',
                  subTitle: '',
                  redColor: false,
                ),
                Positioned(
                  right: sizer.w(14),
                  bottom: sizer.hwt(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'OrdersHistoryPage');
                    },
                    child: Container(
                        width: sizer.w(59),
                        height: sizer.hwt(59),
                        decoration: BoxDecoration(
                          color: designColorScheme.secondary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Icon(
                          EvaIcons.arrowIosForwardOutline,
                          color: designColorScheme.background,
                        )),
                  ),
                ),
              ]),
              SizedBox(
                height: sizer.hwt(15),
              ),
              const ItemMenuProfile(
                evaIcons: EvaIcons.logOutOutline,
                onSubtitle: false,
                title: 'Logout',
                subTitle: '',
                redColor: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
