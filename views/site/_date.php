<?php
/**
 * Created by PhpStorm.
 * User: Dilmurod
 * Date: 22.01.2019
 * Time: 22:54
 */

if(isset($date)){
    $time = strtotime($date);
    $month[1] = "Январь";
    $month[2] = "Февраль";
    $month[3] = "Март";
    $month[4] = "Апрель";
    $month[5] = "Май";
    $month[6] = "Июнь";
    $month[7] = "Июль";
    $month[8] = "Август";
    $month[9] = "Сентябрь";
    $month[10] = "Октябрь";
    $month[11] = "Ноябрь";
    $month[12] = "Декабрь";
    $newformat = date('d, Y',$time);
    $m = $month[intval(date('m',$time))];

    echo $m. ' '. $newformat;
}