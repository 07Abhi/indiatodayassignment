import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_enums.dart';
import 'package:assignment/app_utils/app_fonts.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/controllers/agents_controller.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomToolBar extends StatefulWidget {
  final AgentController provider;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final Function expHtoL;
  final Function expLToH;
  final Function priceHToL;
  final Function priceLToH;

  const CustomToolBar({
    Key key,
    this.provider,
    this.onChanged,
    this.onFieldSubmitted,
    this.expHtoL,
    this.expLToH,
    this.priceHToL,
    this.priceLToH,
  }) : super(key: key);

  @override
  _CustomToolBarState createState() => _CustomToolBarState();
}

class _CustomToolBarState extends State<CustomToolBar> {
  bool _showToobar = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchNode = FocusNode();
  //Search Bar TextField
  Widget _searchTextField() {
    return TextFormField(
      controller: _searchController,
      focusNode: _searchNode,
      maxLines: 1,
      maxLength: 40,
      buildCounter: (BuildContext context,
              {int currentLength, int maxLength, bool isFocused}) =>
          null,
      cursorColor: AppColors.grey0,
      style: AppStyles.black14Regular,
      keyboardType: TextInputType.name,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: const InputDecoration(
        hintText: AppStrings.searchAstroler,
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColors.grey0,
          fontFamily: AppFonts.RobotoRegular,
        ),
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }

//Search Bar widget
  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: AppColors.grey1,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.search,
            height: 15.0,
            width: 15.0,
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: _searchTextField(),
            ),
          ),
          GestureDetector(
            onTap: () {
              _searchController.clear();
              widget.provider.clearSearchField();
            },
            child: const Icon(
              Icons.close,
              size: 15.0,
              color: AppColors.baseOrange,
            ),
          )
        ],
      ),
    );
  }

//Control Buttons Search, Filter, Sort widget
  Widget _controlButtons() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showToobar = !_showToobar;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            color: AppColors.whiteColor,
            child: Image.asset(
              AppImages.search,
              height: 25.0,
              width: 25.0,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          height: 25.0,
          width: 25.0,
          color: AppColors.whiteColor,
          child: Image.asset(
            AppImages.filterImage,
            height: 25.0,
            width: 25.0,
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          height: 25.0,
          width: 25.0,
          color: AppColors.whiteColor,
          child: CustomPopupMenu(
              child: Image.asset(
                AppImages.sort,
                height: 25.0,
                width: 25.0,
              ),
              showArrow: false,
              barrierColor: Colors.transparent,
              menuBuilder: () {
                return StatefulBuilder(
                  builder: (context, setState) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    height: 200.0,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.sortBy,
                          style: AppStyles.black12Regular.copyWith(
                            color: AppColors.baseOrange,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black.withOpacity(0.3),
                        ),
                        _selectionCircle(
                            workString: AppStrings.expHighToLow,
                            tag: SortingTag.expHighToLow,
                            onTap: () {
                              setState(() {
                                widget.expHtoL();
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _selectionCircle(
                            workString: AppStrings.expLowToHigh,
                            tag: SortingTag.expLowToHigh,
                            onTap: () {
                              setState(() {
                                widget.expLToH();
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _selectionCircle(
                            workString: AppStrings.priceHighToLow,
                            tag: SortingTag.priceHighToLow,
                            onTap: () {
                              setState(() {
                                widget.priceHToL();
                              });
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _selectionCircle(
                            workString: AppStrings.priceLowToHigh,
                            tag: SortingTag.priceLowToHigh,
                            onTap: () {
                              setState(() {
                                widget.priceLToH();
                              });
                            }),
                      ],
                    ),
                  ),
                );
              },
              pressType: PressType.singleClick),
        ),
      ],
    );
  }

//Pop Up Menu Options
  Widget _selectionCircle({String workString, SortingTag tag, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 25.0,
        color: AppColors.whiteColor,
        child: Row(
          children: [
            Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                color: widget.provider.sortTag == tag
                    ? AppColors.black.withOpacity(0.6)
                    : AppColors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.black.withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(workString, style: AppStyles.black12Regular)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteColor,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.talkToAstro, style: AppStyles.black14Bold),
              _controlButtons(),
            ],
          ),
        ),
        _showToobar ? _searchBar() : const SizedBox(),
      ],
    );
  }
}
