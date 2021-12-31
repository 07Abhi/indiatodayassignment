import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_enums.dart';
import 'package:assignment/controllers/agents_controller.dart';
import 'package:assignment/global/global.dart';
import 'package:assignment/provider_base/provider_consumer.dart';
import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/screen/widgets/astrologer_tile.dart';
import 'package:assignment/screen/widgets/custom_appbar.dart';
import 'package:assignment/screen/widgets/shimmer_widget.dart';
import 'package:assignment/screen/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Talk To Astrologer page.
class TalkToAstro extends StatefulWidget {
  const TalkToAstro({Key key}) : super(key: key);

  @override
  _TalkToAstroState createState() => _TalkToAstroState();
}

class _TalkToAstroState extends State<TalkToAstro> {
  bool _noInternet = false;
  _onRefreshPage(AgentController provider) {
    return provider.fetchAvailableAgents();
  }

  _getBody() {
    return ProviderConsumer<AgentController>(
      defaultView: (context, provider, child) => _getDefaultView(provider),
      loadingView: (context, provider, child) {
        if (provider.event == ProviderEvent.astrologer) {
          return _getLoadingView(provider);
        }
        return _getDefaultView(provider);
      },
      failedView: (context, provider, child) {
        return failedView(retryFunction: () {
          provider.fetchAvailableAgents();
        });
      },
      noInternetView: (context, provider, child) {
        return noInternetWork(noInternet: () {
          provider.fetchAvailableAgents();
        });
      },
    );
  }

  _getLoadingView(AgentController provider) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          height: 180.0,
          width: MediaQuery.of(context).size.width,
          child: const ShimmerWidget(),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10.0,
        );
      },
      itemCount: 10,
    );
  }

  _getDefaultView(AgentController provider) {
    return RefreshIndicator(
      onRefresh: () => _onRefreshPage(provider),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CustomToolBar(
              provider: provider,
              onFieldSubmitted: (text) {
                FocusScope.of(context).unfocus();
              },
              expHtoL: () {
                provider.sortAgentsList(SortingTag.expHighToLow);
              },
              expLToH: () {
                provider.sortAgentsList(SortingTag.expLowToHigh);
              },
              priceHToL: () {
                provider.sortAgentsList(SortingTag.priceHighToLow);
              },
              priceLToH: () {
                provider.sortAgentsList(SortingTag.priceLowToHigh);
              },
              onChanged: (data) {
                if (data.length > 1) {
                  provider.searchAstrologer(data);
                }
                if (provider.seachedUsers.isNotEmpty && data.isEmpty) {
                  provider.clearSearchField();
                }
              },
            ),
            provider.seachedUsers.isNotEmpty
                ? Flexible(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black.withOpacity(0.4),
                        );
                      },
                      itemCount: provider.seachedUsers.length,
                      itemBuilder: (context, index) {
                        return AstrologerTile(
                          agentModel: provider.seachedUsers[index],
                        );
                      },
                    ),
                  )
                : Flexible(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: 1.0,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black.withOpacity(0.4),
                        );
                      },
                      itemCount: provider.availableAgents.length,
                      itemBuilder: (context, index) {
                        return AstrologerTile(
                          agentModel: provider.availableAgents[index],
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: const CustomAppBar(),
        body: _getBody(),
      ),
    );
  }
}
