<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "feedback".
 *
 * @property integer $id
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $preview
 * @property string $detail
 * @property string $file
 * @property string $created
 * @property string $updated
 * @property integer $status
 * @property integer $active
 */
class Feedback extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'feedback';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'email', 'preview', 'detail', 'file'], 'required'],
            [['created', 'updated'], 'safe'],
            [['status', 'active'], 'integer'],
            [['name', 'email', 'preview', 'file'], 'string', 'max' => 255],
            [['phone'], 'string', 'max' => 20],
            [['detail'], 'string', 'max' => 5000],
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
            'email' => 'Email',
            'phone' => 'Phone',
            'preview' => 'Preview',
            'detail' => 'Detail',
            'file' => 'File',
            'created' => 'Created',
            'updated' => 'Updated',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
