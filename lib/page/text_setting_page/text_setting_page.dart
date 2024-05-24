import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/constant/field.dart';
import 'package:poker_range/helper/shared_preference/shared_preference_helper.dart';
import 'package:poker_range/page/probability_page/bloc/probability_bloc.dart';

class TextSettingPage extends StatefulWidget {
  const TextSettingPage({super.key});

  @override
  State<TextSettingPage> createState() => _TextSettingPageState();
}

class _TextSettingPageState extends State<TextSettingPage> {
  final TextEditingController _flopToRiver = TextEditingController();
  final TextEditingController _flopToTurn = TextEditingController();
  final TextEditingController _turnToRiver = TextEditingController();

  String _preFlopToRiver = '';
  String _preFlopToTurn = '';
  String _preTurnToRiver = '';

  bool _isModified = false;

  _checkModify() {
    if (_flopToRiver.text != _preFlopToRiver || _flopToTurn.text != _preFlopToTurn || _preTurnToRiver != _turnToRiver.text) {
      setState(() {
        _isModified = true;
      });
      return;
    } else {
      setState(() {
        _isModified = false;
      });
    }
  }

  _saveText() {
    SharedPreferencesHelper().setString(field: Field.flopToRiverField, value: _flopToRiver.text);
    SharedPreferencesHelper().setString(field: Field.flopToTurnField, value: _flopToTurn.text);
    SharedPreferencesHelper().setString(field: Field.turnToRiverField, value: _turnToRiver.text);
    context.read<ProbabilityBloc>().add(
      ProbabilityChangeTextEvent(
        flopToRiver: _flopToRiver.text, flopToTurn: _flopToTurn.text, turnToRiver: _turnToRiver.text
      )
    );
  }

  @override
  void initState() {
    _preFlopToRiver = SharedPreferencesHelper().getString(Field.flopToRiverField) ?? '';
    _preFlopToTurn = SharedPreferencesHelper().getString(Field.flopToTurnField) ?? '';
    _preTurnToRiver = SharedPreferencesHelper().getString(Field.turnToRiverField) ?? '';
    _flopToRiver.text = _preFlopToRiver;
    _flopToTurn.text = _preFlopToTurn;
    _turnToRiver.text = _preTurnToRiver;
    super.initState();
  }

  @override
  void dispose() {
    _flopToRiver.dispose();
    _flopToTurn.dispose();
    _turnToRiver.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '文字設定',
          style: theme.textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_isModified) {
                _saveText();
              }
            }, 
            child: Text(
              '儲存',
              style: theme.textTheme.titleLarge?.copyWith(
                color: _isModified ? null : theme.disabledColor,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '翻牌到河牌: ',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: TextField(
                      style: theme.textTheme.titleMedium,
                      controller: _flopToRiver,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      onChanged: (val) {
                        _checkModify();
                      },
                    )
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '翻牌到轉牌: ',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: TextField(
                      style: theme.textTheme.titleMedium,
                      controller: _flopToTurn,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      onChanged: (val) {
                        _checkModify();
                      },
                    )
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '轉牌到河牌: ',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: TextField(
                      style: theme.textTheme.titleMedium,
                      controller: _turnToRiver,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      onChanged: (val) {
                        _checkModify();
                      },
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}