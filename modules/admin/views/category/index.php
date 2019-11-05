<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bo\'limlar';
$this->params['breadcrumbs'][] = ['label' => 'Admin', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="panel blank-panel">

    <div class="panel-heading">
        <div class="panel-options">

            <ul class="nav nav-tabs">

                <?php $n = 0; foreach ($langs as $lang): $n++;?>
                <li class="<?= $n == 1 ? "active" : ''?>"><a data-toggle="tab" href="#tab-<?= $lang->id?>"><?= $lang->language ?></a></li>
                <?php endforeach;?>

                <li class="pull-right">

                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Qo'shish</button>

                </li>

            </ul>
        </div>
    </div>

    <div class="panel-body">

        <div class="tab-content">

            <?php $n = 0; foreach($langs as $lang): $n++; ?>
            <div id="tab-<?= $lang->id?>" class="tab-pane <?=$n == 1 ? 'active' : ''?>">



                <div class="ibox float-e-margins">


                    <div class="ibox-content">
                        <div class="panel-body">
                            <div class="panel-group" id="accordion">

                                <?php foreach(\app\models\Category::find()->where(['lang_id'=>$lang->id])->andWhere(['parent_id'=>1])->all() as $cat): ?>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">

                                                <h5 class="panel-title" style="height:30px;">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse<?=$cat->id?>"><span class="<?= $cat->icon ?>"></span> <?= $cat->name?></a>
                                                    <a href="<?= Yii::$app->urlManager->createUrl(['/admin/category/delete','id'=>$cat->id])?>" class="pull-right" title="O`chirish" aria-label="O`chirish" data-pjax="0" data-confirm="Sizni ushbu elementni o`chirishga ishonchngiz komilmi?" data-method="post"><span class="fa fa-trash fa-2x"></span></a>
                                                    <button type="button" class="btn btn-link pull-right" style="padding:0 7px;" onclick="updatemodal(<?=$cat->id?>)"><span class="fa fa-edit fa-2x"></span></button>
                                                    <div class='checkboxcustom pull-right' style="margin-right:10px;">
                                                        <input type='checkbox' <?= $cat->status==1 ? 'checked' : '' ?>  onchange='statuschanger(<?=$cat->id?>)' style="top:-8px;">
                                                    </div>

                                                </h5>
                                            </div>
                                            <div id="collapse<?= $cat->id?>" class="panel-collapse collapse">
                                                <div class="panel-body">

                                                    <?php foreach(\app\models\Category::find()->where(['parent_id'=>$cat->id])->all() as $item):?>

                                                        <div class="row" style="margin:5px; padding:10px; background: #f5f5f5">
                                                            <div class="col-md-8" style="font-size:16px; color:#000; margin-top:5px;">
                                                                <h5 class="panel-title">
                                                                <span class="<?= $item->icon ?>"></span> <?= $item->name ?>
                                                                </h5>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <a href="<?= Yii::$app->urlManager->createUrl(['/admin/category/delete','id'=>$item->id])?>" class="pull-right" style="color:#000; margin-top:4px;" title="O`chirish" aria-label="O`chirish" data-pjax="0" data-confirm="Sizni ushbu elementni o`chirishga ishonchngiz komilmi?" data-method="post"><span class="fa fa-trash fa-2x"></span></a>
                                                                <button type="button" class="btn btn-link pull-right" style="padding:0 7px; margin-top:4px;" onclick="updatemodal(<?=$item->id?>)"><span class="fa fa-edit fa-2x"></span></button>
                                                                <div class='checkboxcustom pull-right' style="margin-right:10px;">
                                                                    <input type='checkbox' <?= $item->status==1 ? 'checked' : '' ?>  onchange='statuschanger(<?=$item->id?>)' >
                                                                </div>

                                                            </div>
                                                        </div>



                                                    <?php endforeach;?>

                                                </div>
                                            </div>
                                        </div>
                                <?php endforeach;?>






                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <?php endforeach; ?>

        </div>

    </div>

</div>











<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-search"></i> Bo'lim qo'shish</h4>
            </div>
            <div class="modal-body">

                <?php  echo $this->render('_form', ['model' => new \app\models\Category()]); ?>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Yopish</button>
            </div>
        </div>

    </div>
</div>




    <div id="myModal1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-search"></i> Ma'lumotni yangilash</h4>
                </div>
                <div class="modal-body" id="updateform">



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Yopish</button>
                </div>
            </div>

        </div>
    </div>



<?php
$url = Yii::$app->urlManager->createUrl(['/admin/category/lang']);
$url1 = Yii::$app->urlManager->createUrl(['/admin/category/page']);
$updateurl = Yii::$app->urlManager->createUrl(['/admin/category/update-form']);
$this->registerJs("
$('#category-lang_id').change(function(){
    $.get('{$url}?id='+$('#category-lang_id').val()).done(function(data){
        $('#category-parent_id').empty();
        $('#category-parent_id').append(data);
    });
    $.get('{$url1}?id='+$('#category-lang_id').val()+'&st=true').done(function(data){
        $('#category-page_id').empty();
        $('#category-page_id').append(data);
    });
});

updatemodal = function(id){
    $.post('{$updateurl}?id='+id).done(function(data){
        if(data != 1){
            $('#updateform').empty();
            $('#updateform').append(data);
            
            $('#myModal1').modal();
        }else{
            alert('Bunday element mavjud emas');
        }
    })
    $('#myModal1').modal();
}

");


$url1 = Yii::$app->urlManager->createUrl(['admin/category/status']);
$this->registerJs("
    statuschanger = function(id){
        $.get('{$url1}?id='+id).done(function(data){
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