<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property integer $lang_id
 * @property integer $status
 * @property integer $active
 */
class Menu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code', 'lang_id'], 'required'],
            [['lang_id', 'status', 'active'], 'integer'],
            [['name', 'code'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'code' => 'Code',
            'lang_id' => 'Lang ID',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }

    public function getLang(){
        return $this->hasOne(Language::className(),['id'=>'lang_id']);
    }
}
