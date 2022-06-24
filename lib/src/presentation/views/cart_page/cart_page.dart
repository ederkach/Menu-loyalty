import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_loyalty/src/config/size_config.dart';

import '../../../constants/enums.dart';
import '../../../data/models/cart_model/cart_model.dart';
import '../../blocs/blocs.dart';
import '../../widgets/button_up_dark.dart';
import '../../widgets/label_widget.dart';
import '../../widgets/leading_icon_app_bar.dart';
import '../../widgets/title_app_bar.dart';
import 'components/cart_sum.dart';
import 'components/control_cart_list.dart';
import 'components/show_pay_dialog.dart';

class CartPage extends StatefulWidget {
  static const String routeName = 'CartPage';

  const CartPage({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => const CartPage());
  }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  void payNow() {
    showPayDialog(context);
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
          title: 'Cart',
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizer.hwt(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sizer.w(24),
                ),
                child: const LabelWidget(
                  label: 'Item to order',
                  darkWhite: DarkWhite.dark,
                ),
              ),
              SizedBox(
                height: sizer.hwt(10),
              ),
              const Expanded(child: ControlCartList()),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: sizer.hwt(22),
                  ),
                  child: Column(
                    children: [
                      const ButtonUpDark(),
                      const SizedBox(),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                              cartLoadSuccess: (cart) => CartSum(
                                    payNow: payNow,
                                    cart: cart,
                                  ),
                              orElse: () => CartSum(
                                    payNow: payNow,
                                    cart: Cart(menuItems: []),
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
                width: sizer.w(375),
                height: sizer.h(335),
                decoration: BoxDecoration(
                  color: designColorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
