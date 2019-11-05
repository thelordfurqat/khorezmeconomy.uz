<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Menular';
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

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Menu yaratish</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i> Bo'lak Qo'shish</button>

                    </li>

                </ul>
            </div>
        </div>

        <div class="panel-body">

            <div class="tab-content">

                <?php $n = 0; foreach($langs as $lang): $n++; ?>
                    <div id="tab-<?= $lang->id?>" class="tab-pane <?=$n == 1 ? 'active' : ''?>">



                        <div class="ibox float-e-margins">



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
                    <h4 class="modal-title"><i class="fa fa-search"></i> Menu yaratish</h4>
                </div>
                <div class="modal-body">

                    <?php  echo $this->render('_form', ['model' => new \app\models\Menu()]); ?>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Yopish</button>
                </div>
            </div>

        </div>
    </div>


    <div id="myModal2" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-search"></i> Menuga bo'lak qo'shish</h4>
                </div>
                <div class="modal-body">

                    <?php  echo $this->render('_items', ['model' => new \app\models\MenuItem()]); ?>

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
$updateurl = Yii::$app->urlManager->createUrl(['/admin/menu/update-form']);
$this->registerJs("
$('#menu-lang_id').change(function(){
    $.get('{$url}?id='+$('#category-lang_id').val()).done(function(data){
        $('#category-parent_id').empty();
        $('#category-parent_id').append(data);
    });
});

updatemodal = function(id){
    $.post('update-form?id='+id).done(function(data){
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

?>