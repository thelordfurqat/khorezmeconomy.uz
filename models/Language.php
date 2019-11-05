<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "language".
 *
 * @property integer $id
 * @property string $language
 * @property string $code
 * @property string $icon
 * @property integer $type
 * @property integer $status
 * @property integer $active
 */
class Language extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'language';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['language', 'code', 'icon', 'type'], 'required'],
            [['type', 'status', 'active'], 'integer'],
            [['language', 'code', 'icon'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'language' => 'Language',
            'code' => 'Code',
            'icon' => 'Icon',
            'type' => 'Type',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
