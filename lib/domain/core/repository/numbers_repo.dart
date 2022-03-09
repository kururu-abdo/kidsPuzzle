import 'package:flutter/material.dart';
import 'package:kids_puzzle/app/types/levels.dart';

abstract class NumbersRepo{
    void  generatNumbers(Level level);
}