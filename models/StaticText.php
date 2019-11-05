<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "static_text".
 *
 * @property integer $id
 * @property string $code
 * @property string $text
 * @property integer $lang_id
 */
class StaticText extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'static_text';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'text', 'lang_id'], 'required'],
            [['text'], 'string'],
            [['lang_id'], 'integer'],
            [['code'], 'string', 'max' => 500],
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
            'text' => 'Text',
            'lang_id' => 'Lang ID',
        ];
    }
}
