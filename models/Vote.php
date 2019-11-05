<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vote".
 *
 * @property integer $id
 * @property string $question
 * @property string $answer
 * @property integer $lang_id
 * @property integer $author_id
 * @property integer $page_id
 * @property integer $news_id
 * @property integer $status
 * @property integer $active
 * @property string $created
 * @property string $updated
 */
class Vote extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vote';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question', 'answer', 'lang_id', 'author_id'], 'required'],
            [['answer'], 'string'],
            [['lang_id', 'author_id', 'page_id', 'news_id', 'status', 'active'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['question'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'question' => 'Savol',
            'answer' => 'Javoblar',
            'lang_id' => 'Til',
            'author_id' => 'Avtor',
            'page_id' => 'Sahifa',
            'news_id' => 'Yangilik',
            'status' => 'Status',
            'active' => 'Active',
            'created' => 'Yaratildi',
            'updated' => 'Updated',
        ];
    }

    public function getLang(){
        return $this->hasOne(Language::className(),['id'=>'lang_id']);
    }
    public function getAuthor(){
        return $this->hasOne(User::className(),['id'=>'author_id']);
    }
    public function getPage(){
        return $this->hasOne(Page::className(),['id'=>'page_id']);
    }
    public function getNews(){
        return $this->hasOne(News::className(),['id'=>'n    ews_id']);
    }
}
