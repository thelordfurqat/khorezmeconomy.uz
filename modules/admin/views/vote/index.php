<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\VoteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Votes';
$this->params['breadcrumbs'][] = ['label' => 'Admin', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="wrapper border-bottom white-bg mptop">


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-6">
            <p>
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Qo'shish</button>
            </p>
        </div>
        <div class="col-md-6 col-lg-6 col-sm-6">
            <p>
                <button type="button" class="btn btn-info btn-lg pull-right" data-toggle="modal" data-target="#myModal1"><i class="fa fa-search"></i> Qidiruv</button>
            </p>
        </div>
    </div>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'question',
//            'answer:ntext',
//            'lang_id',
            [
                'attribute'=>'lang_id',
                'value'=>'lang.language',
                'filter'=>\app\components\ArrayMaps::language()
            ],
            [
                'attribute'=>'author_id',
                'value'=>'author.name',
                'filter'=>\app\components\ArrayMaps::Authors()
            ],
//            'author_id',
            // 'page_id',
            // 'news_id',
            // 'status',
            // 'active',
            'created',
            [
                'attribute'=>'status',
                'value'=>function($d){
                    $ch = $d->status == 1 ? 'checked' : '';
                    return "
                        <div class='checkboxcustom'>
                            <input type='checkbox' {$ch}  onchange='statuschanger({$d->id})'>
                        </div>
                    ";
                },
                'format'=>'raw',
                'filter'=>[1=>'Aktiv',0=>'Deaktiv']
            ],
            // 'updated',

            ['class' => 'yii\grid\ActionColumn','template'=>'{delete}'],
        ],
    ]); ?>
</div>


<div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-search"></i> Qidiruv</h4>
            </div>
            <div class="modal-body">

                <?php  echo $this->render('_search', ['model' => $searchModel]); ?>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Yopish</button>
            </div>
        </div>

    </div>
</div>


    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-search"></i> So'rovnoma qo'shish</h4>
                </div>
                <div class="modal-body">

                    <?php  echo $this->render('_form', ['model' => new \app\models\Vote()]); ?>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Yopish</button>
                </div>
            </div>

        </div>
    </div>



<?php

$url = Yii::$app->urlManager->createUrl(['admin/vote/status']);
$this->registerJs("
    statuschanger = function(id){
        $.get('{$url}?id='+id).done(function(data){
            if(data==1){
                alert('Status aktivlashtirildi');
            }else if(data == 0){
                alert('Status Deaktivlashtirildi');
            }else{
                alert('Amalni bajarishdagi xatolik')
            }
        });
   }
")
?>