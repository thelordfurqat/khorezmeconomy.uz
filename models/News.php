<?php

namespace app\models;

use dosamigos\transliterator\TransliteratorHelper;
use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "news".
 *
 * @property integer $id
 * @property string $code
 * @property string $name
 * @property string $image
 * @property integer $cat_id
 * @property string $preview
 * @property string $detail
 * @property integer $sort
 * @property integer $show_counter
 * @property integer $slider
 * @property integer $vote
 * @property integer $tags
 * @property integer $author_id
 * @property integer $modify_by
 * @property string $updated
 * @property string $created
 * @property integer $status
 * @property integer $active
 * @property integer $lang_id
 */
class News extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'news';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'cat_id', 'preview', 'author_id','lang_id'], 'required'],
            [['cat_id', 'sort', 'show_counter', 'slider', 'vote',  'author_id', 'modify_by', 'status', 'active'], 'integer'],
            [['preview', 'detail'], 'string'],
            ['modify_by','default','value'=>Yii::$app->user->getId()],
            [['updated', 'created'], 'safe'],
            ['code','unique'],
            [['code', 'image'], 'string', 'max' => 255],
            [['name','tags',], 'string', 'max' => 500],
            ['show_counter','default','value'=>0],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Code',
            'name' => 'Sarlavha',
            'image' => 'Rasm',
            'cat_id' => 'Bo\'lim',
            'preview' => 'Anons matn',
            'detail' => 'To\'liq matn',
            'sort' => 'Sort',
            'show_counter' => 'Ko\'rishlar soni',
            'slider' => 'Slider',
            'vote' => 'Vote',
            'tags' => 'Tags',
            'author_id' => 'Avtor',
            'modify_by' => 'Modify By',
            'lang_id' => 'Til',
            'updated' => 'Updated',
            'created' => 'Yaratildi',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }


    public function getCat(){
        return $this->hasOne(Category::className(),['id'=>'cat_id']);
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


}
