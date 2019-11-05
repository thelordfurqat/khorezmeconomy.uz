<?php

namespace app\models;

use Yii;
use yii\web\UploadedFile;
use dosamigos\transliterator\TransliteratorHelper;
/**
 * This is the model class for table "page".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $image
 * @property string $preivew
 * @property string $detail
 * @property integer $sort
 * @property integer $show_counter
 * @property integer $slider
 * @property integer $vote
 * @property string $tags
 * @property integer $author_id
 * @property integer $modify_by
 * @property integer $lang_id
 * @property string $created
 * @property string $updated
 * @property integer $status
 * @property integer $active
 */
class Page extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'page';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name',   'preivew',  'author_id', 'lang_id'], 'required'],
            [['detail'], 'string'],


            [['sort', 'show_counter', 'slider', 'vote',  'author_id', 'modify_by', 'lang_id', 'status', 'active'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['name', 'code', 'image'], 'string', 'max' => 255],
            ['tags','string','max'=>500],
            [['preivew'], 'string', 'max' => 500],
            ['code','unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Nomi',
            'code' => 'Code',
            'image' => 'Rasm',
            'preivew' => 'Anons matn',
            'detail' => 'To\'liq matn',
            'sort' => 'Sort',
            'show_counter' => 'Ko\'rishlar soni',
            'slider' => 'Slider',
            'vote' => 'So\'rovnoma',
            'tags' => 'Taglar',
            'author_id' => 'Avtor',
            'modify_by' => 'O\'zgartiruvchi',
            'lang_id' => 'Til',
            'created' => 'Yaratilgan vaqt',
            'updated' => 'O\'zgartirilgan vaqt',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }

    public function getAuthor(){
        return $this->hasOne(User::className(),['id'=>'author_id']);
    }

    public function codegenerate($status = null){
        if($status == 1){

            $code = TransliteratorHelper::process($this->code);
            for($i=0; $i<strlen($code); $i++){
                if($code[$i] < 'a' or $code[$i] > 'z'){
                    if($code[$i] < 'A' or $code[$i]>'Z'){
                        if($code[$i] >'9' or $code[$i]<'0')
                            $code[$i] = '-';
                    }
                }
            }
            $name = $code;
            $i = 0;
            while(static::findOne(['code'=>$name])){
                $i++;
                $name = $code . '-'.$i;
            }
            $this->code = $name;
            return true;

        }else{
            $code = TransliteratorHelper::process($this->name);
            $code .= '-'.date("Y-m-d");
            for($i=0; $i<strlen($code); $i++){
                if($code[$i] < 'a' or $code[$i] > 'z'){
                    if($code[$i] < 'A' or $code[$i]>'Z'){
                        if($code[$i] >'9' or $code[$i]<'0')
                        $code[$i] = '-';
                    }
                }
            }
            $name = $code;
            $i = 0;
            while(static::findOne(['code'=>$name])){
                $i++;
                $name = $code . '-'.$i;
            }
            $this->code = $name;
            return true;
        }
    }
    public function uploadimage($image = null){
        if($this->image = UploadedFile::getInstance($this,'image')){
            $name = round(microtime(true)).'.'.$this->image->extension;
            $this->image->saveAs(Yii::$app->basePath.'/web/uploads/'.$name);
            $this->image = $name;
            return true;
        }else{
            if($image != null){
                $this->image = $image;
                return false;
            }else {
                $this->image = "default.jpg";
                return false;
            }
        }
    }


    public function closetags($html) {
        preg_match_all('#<(?!meta|img|br|hr|input\b)\b([a-z]+)(?: .*)?(?<![/|/ ])>#iU', $html, $result);
        $openedtags = $result[1];
        preg_match_all('#</([a-z]+)>#iU', $html, $result);
        $closedtags = $result[1];
        $len_opened = count($openedtags);
        if (count($closedtags) == $len_opened) {
            return $html;
        }
        $openedtags = array_reverse($openedtags);
        for ($i=0; $i < $len_opened; $i++) {
            if (!in_array($openedtags[$i], $closedtags)) {
                $html .= '</'.$openedtags[$i].'>';
            } else {
                unset($closedtags[array_search($openedtags[$i], $closedtags)]);
            }
        }
        return $html;

    }
}
