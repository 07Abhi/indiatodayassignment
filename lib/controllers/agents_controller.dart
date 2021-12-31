import 'package:assignment/app_utils/app_enums.dart';
import 'package:assignment/global/global.dart';
import 'package:assignment/models/agents_model.dart';
import 'package:assignment/provider_base/provider_base.dart';
import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/provider_base/provider_response.dart';
import 'package:assignment/services/api_calls.dart';

class AgentController extends ProviderBase {
  AgentController() {
    fetchAvailableAgents();
  }
  List<AgentModel> _availableAgents = [];
  // ignore: prefer_final_fields
  List<AgentModel> _searchedusers = [];
  SortingTag _sortingTag = SortingTag.expHighToLow;
  List<AgentModel> get availableAgents => _availableAgents;
  List<AgentModel> get seachedUsers => _searchedusers;
  SortingTag get sortTag => _sortingTag;

  fetchAvailableAgents() async {
    changeState(
      ProviderResponse(ProviderState.loading, ProviderEvent.astrologer),
    );
    var response = await ApiCalls.astrologerApiData();
    if (response.state == ProviderState.success) {
      printDebug("Response");
      printDebug(response.data);

      _availableAgents = List<AgentModel>.from(
          response.data["data"].map((x) => AgentModel.fromJson(x)));

      _availableAgents.sort((a, b) => b.experience.compareTo(a.experience));
      _sortingTag = SortingTag.expHighToLow;
    }
    changeState(response);
  }

  clearSearchField() {
    _searchedusers.clear();

    notifyListeners();
  }

  searchAstrologer(String query) {
    if (query.isNotEmpty) {
      List<AgentModel> users = [];
      for (int i = 0; i < _availableAgents.length; i++) {
        if (_availableAgents[i]
            .firstName
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          users.add(_availableAgents[i]);
        }
        if (_availableAgents[i].languages.any(
            (element) => element.name.toLowerCase() == query.toLowerCase())) {
          users.add(_availableAgents[i]);
        }
        if (_availableAgents[i].skills.any(
            (element) => element.name.toLowerCase() == query.toLowerCase())) {
          users.add(_availableAgents[i]);
        }
      }
      Set<AgentModel> setData = users.toSet();
      List<AgentModel> newList = setData.toList();
      _searchedusers.clear();
      _searchedusers.addAll(newList);
    }
    notifyListeners();
  }

  sortAgentsList(SortingTag tag) {
    if (tag == SortingTag.expHighToLow) {
      _sortingTag = SortingTag.expHighToLow;
      _availableAgents.sort((a, b) => b.experience.compareTo(a.experience));
    }
    if (tag == SortingTag.expLowToHigh) {
      _sortingTag = SortingTag.expLowToHigh;
      _availableAgents.sort((a, b) => a.experience.compareTo(b.experience));
    }
    if (tag == SortingTag.priceHighToLow) {
      _sortingTag = SortingTag.priceHighToLow;
      _availableAgents.sort((a, b) =>
          b.minimumCallDurationCharges.compareTo(a.minimumCallDurationCharges));
    }
    if (tag == SortingTag.priceLowToHigh) {
      _sortingTag = SortingTag.priceLowToHigh;
      _availableAgents.sort((a, b) =>
          a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    }
    notifyListeners();
  }
}
