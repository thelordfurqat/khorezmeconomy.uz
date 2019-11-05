<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $icon
 * @property integer $parent_id
 * @property integer $page_id
 * @property integer $sort
 * @property integer $lang_id
 * @property integer $status
 * @property integer $active
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code', 'parent_id', 'lang_id'], 'required'],
            [['parent_id','page_id', 'sort', 'lang_id', 'status', 'active'], 'integer'],
            [['name', 'code'], 'string', 'max' => 255],
            [['icon'], 'string', 'max' => 50],
            [['sort','page_id'],'default','value'=>0],

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
            'parent_id' => 'Parent ID',
            'sort' => 'Sort',
            'icon' => 'icon',
            'lang_id' => 'Lang ID',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }

}
