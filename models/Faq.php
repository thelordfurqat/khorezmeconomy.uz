<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "faq".
 *
 * @property integer $id
 * @property string $question
 * @property string $answer
 * @property integer $lang_id
 * @property string $created
 * @property string $updated
 * @property integer $status
 * @property integer $active
 */
class Faq extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'faq';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question', 'answer', 'lang_id'], 'required'],
            [['question', 'answer'], 'string'],
            [['lang_id', 'status', 'active'], 'integer'],
            [['created', 'updated'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'question' => 'Question',
            'answer' => 'Answer',
            'lang_id' => 'Lang ID',
            'created' => 'Created',
            'updated' => 'Updated',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
