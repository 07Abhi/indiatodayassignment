import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/models/agents_model.dart';
import 'package:assignment/screen/widgets/network_image.dart';
import 'package:assignment/screen/widgets/talk_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//Available Astrologer Tiles.
class AstrologerTile extends StatefulWidget {
  final AgentModel agentModel;

  const AstrologerTile({Key key, this.agentModel}) : super(key: key);

  @override
  _AstrologerTileState createState() => _AstrologerTileState();
}

class _AstrologerTileState extends State<AstrologerTile> {
  Widget _informationColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.agentModel?.firstName} ${widget.agentModel?.lastName}",
            style: AppStyles.black12Bold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.keyboard_arrow_right,
                size: 15.0,
                color: AppColors.baseOrange,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  (widget.agentModel.aboutMe == "" ||
                          widget.agentModel.aboutMe == ".")
                      ? AppStrings.noInformationn
                      : widget.agentModel.aboutMe.toString(),
                  maxLines: 5,
                  style: AppStyles.black10Regular,
                ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.keyboard_arrow_right,
                size: 15.0,
                color: AppColors.baseOrange,
              ),
              widget.agentModel.languages.length > 1
                  ? Text(
                      "${widget.agentModel.languages[0].name}, ${widget.agentModel.languages[1].name}",
                      style: AppStyles.black10Regular,
                    )
                  : widget.agentModel.languages.isNotEmpty
                      ? Text(
                          widget.agentModel.languages[0].name,
                          style: AppStyles.black10Regular,
                        )
                      : Text(AppStrings.noInformationn,
                          style: AppStyles.black10Regular)
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.keyboard_arrow_right,
                size: 15.0,
                color: AppColors.baseOrange,
              ),
              Text(
                "₹${widget.agentModel.minimumCallDurationCharges}",
                style: AppStyles.black10Bold,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: TalkButton(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworkImageCustom(
                imageUrl: widget.agentModel.profliePicUrl,
              ),
              _informationColumn(),
              widget.agentModel.experience == null
                  ? const SizedBox(width: 10.0)
                  : Text(
                      "${widget.agentModel.experience} Years",
                      style: AppStyles.black12Regular,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
