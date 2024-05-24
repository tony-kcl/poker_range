import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ShowType {
  name,
  number,
}

class PokerTable extends StatefulWidget {
  const PokerTable({
    super.key,
    required this.width
  });

  final double width;

  @override
  State<PokerTable> createState() => _PokerTableState();
}

class _PokerTableState extends State<PokerTable> {
  ShowType _currentType = ShowType.name;
  @override
  Widget build(BuildContext context) {
    final posSize = widget.width / 10;
    final height = posSize * 2.4 + widget.width / 3;
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10,),
              CupertinoRadio(
                value: ShowType.name, 
                groupValue: _currentType, 
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _currentType = val;
                    });
                  }
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                      _currentType = ShowType.name;
                  });
                },
                child: Text(
                  '名稱',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              CupertinoRadio(
                value: ShowType.number, 
                groupValue: _currentType, 
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _currentType = val;
                    });
                  }
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                      _currentType = ShowType.number;
                  });
                },
                child: Text(
                  '座位號碼',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.width / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          SizedBox(
            width: widget.width,
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  width: widget.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _PosCircle(posSize, name: 'CO', number: '9', type: _currentType,),
                      _DealerCircle(posSize, name: '荷'),
                      _PosCircle(posSize, name: 'Btn', number: '1', type: _currentType,),
                    ],
                  ),
                ),
                Positioned(
                  top: height - posSize,
                  width: widget.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _PosCircle(posSize, name: 'MP1', type: _currentType, number: '6',),
                      _PosCircle(posSize, name: 'UTG+1', type: _currentType, number: '5',),
                      _PosCircle(posSize, name: 'UTG', type: _currentType, number: '4',),
                    ],
                  ),
                ),
                Positioned(
                  top: posSize * 1.2,
                  left: posSize * 1.5,
                  child: _Table(width: widget.width / 10 * 7, height: widget.width / 3,),
                ),
                Positioned(
                  left: posSize * 0.25,
                  top: (height - (posSize * 2)) / 3,
                  child: _PosCircle(posSize, name: 'HJ', type: _currentType, number: '8',),
                ),
                Positioned(
                  left: posSize * 0.25,
                  top: ((height - (posSize * 2)) / 3) * 2 + posSize,
                  child: _PosCircle(posSize, name: 'MP2', type: _currentType, number: '7',),
                ),
                // SB
                Positioned(
                  right: posSize * 0.25,
                  top: (height - (posSize * 2)) / 3,
                  child: _PosCircle(posSize, name: 'SB', type: _currentType, number: '2',),
                ),
                // BB
                Positioned(
                  right: posSize * 0.25,
                  top: ((height - (posSize * 2)) / 3) * 2 + posSize,
                  child: _PosCircle(posSize, name: 'BB', type: _currentType, number: '3',),
                ),
              ],
            ),
          ),
          SizedBox(height: widget.width / 50,),
        ],
      ),
    );
  }
}

class _PosCircle extends StatelessWidget {
  const _PosCircle(this.size, {required this.name, required this.number, required this.type});

  final double size;

  final String name;

  final String number;

  final ShowType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: OverflowBox(
          maxWidth: type == ShowType.name ? name.length * (size / 2 * 1.2) : null,
          child: Container(
            color: type == ShowType.name ? Colors.black : null,
            child: Text(
              type == ShowType.name ? name : number,
              style: TextStyle(
                color: type == ShowType.name ? Colors.white : Colors.black,
                fontSize: size / 2 * 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DealerCircle extends StatelessWidget {
  const _DealerCircle(this.size, {this.name});

  final double size;

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: name != null
        ? Center(
            child: Text(
              name!,
              style: TextStyle(
                color: Colors.black,
                fontSize: size / 2 * 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          : null,
    );
  }
}

class _Table extends StatelessWidget {
  const _Table({
    required this.width,
    required this.height,
  });

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.elliptical(width / 6, width / 7))
      ),
    );
  }
}