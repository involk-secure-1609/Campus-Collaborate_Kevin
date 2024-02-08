import 'package:campuscollaborate/constants/skills.dart';
import 'package:campuscollaborate/constants/themes.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:flutter/material.dart';
class MultipleSelectionDropDown extends StatelessWidget {
  final MultiSelectController multiSelectDropDown;
  const MultipleSelectionDropDown({super.key, required this.multiSelectDropDown});

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown(
        fieldBackgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
        optionsBackgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
        optionTextStyle: const TextStyle(color: Colors.white),
        selectedOptionBackgroundColor: Colors.black,
        controller: multiSelectDropDown,
        onOptionSelected: (val){
            debugPrint(val.toString());
        }, options: getValuesFromEnum());
  }
}

List<ValueItem> getValuesFromEnum(){
  final List<ValueItem> list=[];
  for(int i=0; i<SkillsEnum.values.length; i++){
    list.add(ValueItem(label: SkillsEnum.values[i].name, value: i));
  }
  return list;
}
