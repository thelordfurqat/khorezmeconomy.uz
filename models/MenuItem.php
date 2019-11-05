<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu_item".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property integer $menu_id
 * @property integer $lang_id
 * @property integer $cat_id
 * @property integer $page_id
 * @property integer $parent_id
 * @property string $icon
 * @property integer $status
 * @property integer $active
 */
class MenuItem extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu_item';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code', 'menu_id', 'lang_id'], 'required'],
            [['menu_id', 'lang_id', 'cat_id', 'page_id', 'parent_id', 'status', 'active'], 'integer'],
            [['name', 'code', 'icon'], 'string', 'max' => 255],
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
            'menu_id' => 'Menu ID',
            'lang_id' => 'Lang ID',
            'cat_id' => 'Cat ID',
            'page_id' => 'Page ID',
            'parent_id' => 'Parent ID',
            'icon' => 'Icon',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
