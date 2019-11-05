<?php

namespace app\components;
/**
 * Created by PhpStorm.
 * User: Shomurod
 * Date: 06.01.2019
 * Time: 22:14
 */

use Yii;
use app\components\Data;
use yii\helpers\Url;
use yii\helpers\Html;

use app\models\StaticText;

class Text{

    private $_texts = [];

    public function init()
    {
        parent::init();

        $this->_texts = Data::cache(StaticText::CACHE_KEY, 3600, function(){
            return StaticText::find()->asArray()->all();
        });
    }

    public function get($code)
    {
        if(($text = $this->findText($code)) === null){
            return $this->notFound($code);
        }
        return $text['text'];
    }

    private function findText($code)
    {
        foreach ($this->_texts as $item) {
            if($item['slug'] == $code){
                return $item;
            }
        }
        return null;
    }

    private function notFound($code)
    {
        $text = '';

        $model = new StaticText();
        $model->code = $code;
        $lang = Yii::$app->language;
        if($lang == 'uz'){
            $model->text = $code;
        }else{
//            $model->text =
        }

        return $text;
    }
}