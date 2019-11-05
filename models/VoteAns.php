<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vote_ans".
 *
 * @property integer $id
 * @property string $answer
 * @property integer $vote_id
 * @property integer $news_id
 * @property integer $lang_id
 * @property integer $result
 * @property integer $status
 * @property integer $active
 */
class VoteAns extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vote_ans';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['answer', 'vote_id', 'news_id', 'lang_id'], 'required'],
            [['vote_id', 'news_id', 'lang_id', 'result', 'status', 'active'], 'integer'],
            [['answer'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'answer' => 'Answer',
            'vote_id' => 'Vote ID',
            'news_id' => 'News ID',
            'lang_id' => 'Lang ID',
            'result' => 'Result',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }
}
