<?php $this->title = $sitetitle?>





<section class="home">
    <div class="container">
        <div class="row">

            <?= \app\components\BreadcrumbsGenerator::generate(['type'=>'page','code'=>$code])?>

            <div class="col-md-8 col-sm-12 col-xs-12 page-content">


                <button class="page-print-link pull-right btn btn-link" onclick="printfunction()"><i class="fa fa-print print-icon"></i><span class="hidden-xs">Чоп этиш</span></button>
                <div class="line top">
                    <div><?= $model->name?></div>
                </div>


                <div class="short-text">

                    <?= \yii\helpers\Html::decode($model->detail) ?>

                </div>

            </div>

            <?= $this->render('_sidebar')?>
        </div>
    </div>
</section>

