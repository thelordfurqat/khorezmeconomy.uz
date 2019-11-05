<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "slider".
 *
 * @property integer $id
 * @property string $name
 * @property string $image
 * @property integer $page_id
 * @property integer $cat_id
 * @property integer $lang_id
 * @property string $created
 * @property string $updated
 * @property integer $author_id
 * @property integer $modify_by
 * @property integer $status
 * @property integer $active
 */
class Slider extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'slider';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'image', 'lang_id', 'author_id', 'modify_by'], 'required'],
            [['page_id', 'cat_id', 'lang_id', 'author_id', 'modify_by', 'status', 'active'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['name', 'image'], 'string', 'max' => 255],
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
            'image' => 'Image',
            'page_id' => 'Page ID',
            'cat_id' => 'Cat ID',
            'lang_id' => 'Lang ID',
            'created' => 'Created',
            'updated' => 'Updated',
            'author_id' => 'Author ID',
            'modify_by' => 'Modify By',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
