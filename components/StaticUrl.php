<?php
/**
 * Created by PhpStorm.
 * User: Dilmurod
 * Date: 10.01.2019
 * Time: 1:26
 */

namespace app\components;

use Yii;

class StaticUrl{
    public static function t($url){
        switch ($url){
            case 'Urganch-shahar-hokimligi-apparati-2019-01-09': return static::getText(1);
        }
    }

    public static function url($url){
        switch ($url){
            case 'Urganch-shahar-hokimligi-apparati-2019-01-09': return static::getUrl(1);
        }
    }

    public function getText($code){
        switch ($code){
            case 1: return "Shahar hokimligi";
        }
    }

    public function getUrl($code){
        switch ($code){
            case 1: return "#";
        }
    }
}