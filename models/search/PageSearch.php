<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Page;

/**
 * PageSearch represents the model behind the search form of `app\models\Page`.
 */
class PageSearch extends Page
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sort', 'show_counter', 'slider', 'vote', 'tags', 'author_id', 'modify_by', 'lang_id', 'status', 'active'], 'integer'],
            [['name', 'code', 'image', 'preivew', 'detail', 'created', 'updated'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Page::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'sort' => $this->sort,
            'show_counter' => $this->show_counter,
            'slider' => $this->slider,
            'vote' => $this->vote,
            'tags' => $this->tags,
            'author_id' => $this->author_id,
            'modify_by' => $this->modify_by,
            'lang_id' => $this->lang_id,
            'created' => $this->created,
            'updated' => $this->updated,
            'status' => $this->status,
            'active' => $this->active,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'preivew', $this->preivew])
            ->andFilterWhere(['like', 'detail', $this->detail]);

        return $dataProvider;
    }
}
