import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/global/global.dart';
import 'package:assignment/models/panchang_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//All Panchang Block Widgets
class PanchangBlockTithi extends StatelessWidget {
  final Panchang panchangModel;
  const PanchangBlockTithi({Key key, this.panchangModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.tithi, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.tithiNumber,
            panchangModel.tithi.details.tithiNumber.toString()),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.tithiName,
          panchangModel.tithi.details.tithiName,
        ),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.speacial, panchangModel.tithi.details.special),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.summary, panchangModel.tithi.details.summary),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.deity, panchangModel.tithi.details.deity),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.endTime,
            "${panchangModel.tithi.endTime.hour}hr ${panchangModel.tithi.endTime.minute} min ${panchangModel.tithi.endTime.second} sec"),
      ],
    );
  }
}

class NakshtraBlock extends StatelessWidget {
  final Panchang panchang;
  const NakshtraBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.nakshtra, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.nakNumber,
            panchang.nakshatra.details.nakNumber.toString()),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.nakName,
          panchang.nakshatra.details.nakName,
        ),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.ruler, panchang.nakshatra.details.ruler),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.deity, panchang.nakshatra.details.deity),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.speacial, panchang.nakshatra.details.special),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.summary, panchang.nakshatra.details.summary),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.endTime,
            "${panchang.nakshatra.endTime.hour}hr ${panchang.nakshatra.endTime.minute} min ${panchang.nakshatra.endTime.second} sec"),
      ],
    );
  }
}

class YogBlock extends StatelessWidget {
  final Panchang panchang;
  const YogBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.yog, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(
            AppStrings.nakNumber, panchang.yog.details.yogNumber.toString()),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.yogName,
          panchang.yog.details.yogName,
        ),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.speacial, panchang.yog.details.special),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.meaning, panchang.yog.details.meaning),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.endTime,
            "${panchang.yog.endTime.hour}hr ${panchang.yog.endTime.minute} min ${panchang.yog.endTime.second} sec"),
      ],
    );
  }
}

class KaranBlock extends StatelessWidget {
  final Panchang panchang;
  const KaranBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.karan, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.karanNumber,
            panchang.karan.details.karanNumber.toString()),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.karanName,
          panchang.karan.details.karanName,
        ),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.speacial, panchang.karan.details.special),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.deity, panchang.karan.details.deity),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.endTime,
            "${panchang.karan.endTime.hour}hr ${panchang.karan.endTime.minute} min ${panchang.karan.endTime.second} sec"),
      ],
    );
  }
}

class HinduMaahBlock extends StatelessWidget {
  final Panchang panchang;
  const HinduMaahBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.hinduMaah, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.purnimanta, panchang.hinduMaah.purnimanta),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.amanta,
          panchang.hinduMaah.amanta,
        ),
      ],
    );
  }
}

class OtherInformation extends StatelessWidget {
  final Panchang panchang;
  const OtherInformation({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        infoRow(AppStrings.paksha, panchang.paksha),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.ritu, panchang.ritu),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.sunSign, panchang.sunSign),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.moonSign, panchang.moonSign),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.ayana, panchang.ayana),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.panchangyog, panchang.panchangYog),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.vikramSamvat, panchang.vikramSamvat?.toString()),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.shakaSamvat, panchang.shakaSamvat.toString()),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.vikramSamvatName, panchang.vkramSamvatName),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.shakaSamvatName, panchang.shakaSamvatName),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.dishaShool, panchang.dishaShool),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.dishaShoolRemedies, panchang.dishaShoolRemedies),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.moonNivas, panchang.moonNivas),
      ],
    );
  }
}

class NakShoolBlock extends StatelessWidget {
  final Panchang panchang;
  const NakShoolBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.nakShool, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.direction, panchang.nakShool.direction),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.remedies,
          panchang.nakShool.remedies,
        ),
      ],
    );
  }
}

class AbhijitMuhuratBlock extends StatelessWidget {
  final Panchang panchang;
  const AbhijitMuhuratBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.abhijitMahurat, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.start, panchang.abhijitMuhurta.start),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.end,
          panchang.abhijitMuhurta.end,
        ),
      ],
    );
  }
}

class RaguKaalBlock extends StatelessWidget {
  final Panchang panchang;
  const RaguKaalBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.rahukaal, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.start, panchang.rahukaal.start),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.end,
          panchang.rahukaal.end,
        ),
      ],
    );
  }
}

class GuliKaalBlock extends StatelessWidget {
  final Panchang panchang;
  const GuliKaalBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.gulikaal, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.start, panchang.guliKaal.start),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.end,
          panchang.guliKaal.end,
        ),
      ],
    );
  }
}

class YamghantKaalBlock extends StatelessWidget {
  final Panchang panchang;
  const YamghantKaalBlock({Key key, this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.yamghantKaal, style: AppStyles.black14Bold),
        const SizedBox(height: 10.0),
        infoRow(AppStrings.start, panchang.yamghantKaal.start),
        const SizedBox(height: 10.0),
        infoRow(
          AppStrings.end,
          panchang.yamghantKaal.end,
        ),
      ],
    );
  }
}
