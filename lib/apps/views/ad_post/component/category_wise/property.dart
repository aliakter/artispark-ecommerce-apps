import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:artispark/apps/views/home/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyField extends StatefulWidget {
  const PropertyField({Key? key, required this.controller}) : super(key: key);
  final AdPostController controller;

  @override
  State<PropertyField> createState() => _PropertyFieldState();
}

class _PropertyFieldState extends State<PropertyField> {


  String size = propertySizeList[0];
  String price = propertyPriceList[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Property Type",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 7,
        ),

        Wrap(
          alignment: WrapAlignment.start,
          // runSpacing: 12,
          // spacing: 10,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedPropertyType = "agricultural";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: primaryColor,
                    value: "agricultural",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedPropertyType = value.toString();
                      });
                    },
                  ),
                  const Text("Agricultural"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedPropertyType = "residential";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: primaryColor,
                    value: "residential",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedPropertyType = value.toString();
                      });
                    },
                  ),
                  const Text("Residential"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedPropertyType = "commercial";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: primaryColor,
                    value: "commercial",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedPropertyType = value.toString();
                      });
                    },
                  ),
                  const Text("Commercial"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.controller.selectedPropertyType = "other";
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: primaryColor,
                    value: "other",
                    groupValue: widget.controller.selectedPropertyType,
                    onChanged: (value){
                      setState(() {
                        widget.controller.selectedPropertyType = value.toString();
                      });
                    },
                  ),
                  const Text("Other"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Size",
          style: TextStyle(fontSize: 16),
        ),

        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: widget.controller.sizeController,
                // validator: (value) {
                //   if (value == "") {
                //     return null;
                //   }
                //   return null;
                // },
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText:
                  "Size",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField(
                value: size,
                // validator: (value) {
                //   if (value == null) {
                //     return null;
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                  fillColor: ashColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                ),
                items: propertySizeList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    size = value!;
                    widget.controller.selectedPropertySize = value.toString();
                  });
                  // widget.onValueChanged(value!.value);
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        const Text("Bedroom"),
        const SizedBox(height: 7,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller.bedroomController,
          textInputAction: TextInputAction.next,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return null;
          //   }
          //   return null;
          // },
          // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
          decoration: const InputDecoration(hintText: "Edition"),
        ),

        const SizedBox(height: 16),
        const Text("Property Location"),
        const SizedBox(height: 7,),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller.propertyLocationController,
          textInputAction: TextInputAction.next,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return null;
          //   }
          //   return null;
          // },
          // onChanged: (value) => postAdBloc.add(NewPostAdEventAddress(value)),
          decoration: const InputDecoration(hintText: "Edition"),
        ),


        const SizedBox(
          height: 16,
        ),
        const Text(
          "Price",
          style: TextStyle(fontSize: 16),
        ),

        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: widget.controller.propertyPriceController,
                // validator: (value) {
                //   if (value == "") {
                //     return null;
                //   }
                //   return null;
                // },
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText:
                  "Price",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ashColor),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(4))),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField(
                value: price,
                // validator: (value) {
                //   if (value == null) {
                //     return null;
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                  fillColor: ashColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(4))),
                ),
                items: propertyPriceList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    price = value!;
                    widget.controller.selectedPropertyPrice = value.toString();
                  });
                  // widget.onValueChanged(value!.value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
