<?php $this->title = $sitetitle?>


<section class="home">
    <div class="container">
        <div class="row">

    <?= \app\components\BreadcrumbsGenerator::generate(['type'=>'view','code'=>$code])?>

            <div class="col-md-8 col-sm-12 col-xs-12 page-content">


    <button class="page-print-link pull-right btn btn-link" onclick="printfunction()"><i class="fa fa-print print-icon"></i><span class="hidden-xs">Чоп этиш</span></button>
                <div class="line top">
                    <div><?= $model->name?></div>
                </div>


        <div class="short-text">
            <h5><?=$model->preview?></h5>
            <div class="owl-item active" style="width: 720px;"><div class="item">
                    <article class="featured" style="height: 350px">
                        <div class="overlay"></div>
                        <figure style="background-image: url(&quot;<?=Yii::$app->homeUrl?>uploads/<?=$model->image?>&quot;); background-size: cover; background-repeat: no-repeat; background-position: center center;">

                        </figure>
                        <div class="details">
                            <div class="time"><?= $this->render('_date',['date'=>$model->created])?></div>
<!--                            <div class="time">Ноябрь 19, 2018</div>-->
                        </div>
                    </article>
                </div></div>
            <?= \yii\helpers\Html::decode($model->detail) ?>

<!--            --><?php
//            echo '<pre>';
//            print_r($model);
//            echo '</pre>';
//            ?>

        </div>

            </div>

            <?= $this->render('_sidebar')?>
        </div>
    </div>
</section>


