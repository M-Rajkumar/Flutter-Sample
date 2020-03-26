import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_app_theme.dart';
import 'image_picker_state.dart';

class FallBackAvatar extends StatefulWidget {
  final String image;
  final String initials;
  final TextStyle textStyle;
  final Color circleBackground;
  final double radius;
  final double heightWeight;
  final int msAnimationDuration;
  final String file;

  FallBackAvatar(
      {@required this.image,
      @required this.initials,
      this.circleBackground,
      this.textStyle,
      @required this.radius,
      @required this.heightWeight,
      this.file = '',
      this.msAnimationDuration});

  @override
  _FallBackAvatarState createState() => _FallBackAvatarState();
}

class _FallBackAvatarState extends State<FallBackAvatar> {
  bool _imgSuccess = false;

  @override
  initState() {
    super.initState();
    // Add listeners to this class
//    ImageStreamListener listener = ImageStreamListener(_setImage, onError: _setError);
//
//    widget.image.resolve(ImageConfiguration()).addListener(listener);

    setState(() {
      if (widget.image.isEmpty && widget.image == '') {
        if (widget.file.isNotEmpty && widget.file != '') {
          setState(() => _imgSuccess = true);
        } else {
          setState(() => _imgSuccess = false);
        }
      } else {
        setState(() => _imgSuccess = true);
      }
    });
  }

  void setImage(ImageInfo image, bool sync) {
    setState(() => _imgSuccess = true);
  }

  void setError(dynamic dyn, StackTrace st) {
    setState(() => _imgSuccess = false);
    dispose();
  }

  Widget _fallBackAvatar() {
    return Container(
      height: widget.radius * 2,
      width: widget.radius * 2,
      decoration: BoxDecoration(
        color: widget.circleBackground ?? Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black54,
          width: 1,
        ),
//        borderRadius: BorderRadius.all(
//          Radius.circular(widget.radius),
//        ),
      ),
      child: Center(
        child: Text(
          widget.initials,
          style: widget.textStyle ??
              CustomAppTheme.title.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _avatarImage() {
    return SizedBox(
      height: widget.heightWeight,
      width: widget.heightWeight,
//        child: CircleAvatar(backgroundImage: NetworkImage(widget.image), backgroundColor: widget.circleBackground));
      child: ClipOval(
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: CircleBorder(
              side: BorderSide(style: BorderStyle.solid),
            ),
          ),
          child: Container(
              decoration: BoxDecoration(
                color: widget.circleBackground ?? Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black54,
                  width: 1,
                ),
              ),
              child: widget.file.isEmpty && widget.file == ''
                  ? Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 0.5,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        );
                      },
                    )
                  : Image.file(
                      File(widget.file),
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imagePickerState = ImagePickerState.of(context);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: widget.msAnimationDuration ?? 500),
      child: imagePickerState?.imageStatus ?? _imgSuccess
          ? _avatarImage()
          : _fallBackAvatar(),
    );
  }
}
