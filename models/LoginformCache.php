<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "loginform_cache".
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property integer $times
 * @property integer $blocked
 * @property integer $status
 * @property integer $active
 * @property string $created
 * @property string $updated
 */
class LoginformCache extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'loginform_cache';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'username', 'password'], 'required'],
            [['id', 'times', 'blocked', 'status', 'active'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['username', 'password'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'password' => 'Password',
            'times' => 'Times',
            'blocked' => 'Blocked',
            'status' => 'Status',
            'active' => 'Active',
            'created' => 'Created',
            'updated' => 'Updated',
        ];
    }
}
