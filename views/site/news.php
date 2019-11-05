<?php $this->title = $sitetitle?>


<section class="home">
    <div class="container">
        <div class="row">
            <button class="page-print-link pull-right btn btn-link" onclick="printfunction()"><i class="fa fa-print print-icon"></i><span class="hidden-xs"> Чоп этиш</span></button>

            <?php if(Yii::$app->controller->action->id=='search'){
                echo \app\components\BreadcrumbsGenerator::generate(['code'=>$code, 'type'=>'search']);
            }else{
                echo \app\components\BreadcrumbsGenerator::generate(['code'=>$code, 'type'=>'news']);
            }?>
            <div class="col-md-8 col-sm-12 col-xs-12 page-content">




                <div class="line top">
                    <div><?= $catname?></div>
                </div>

    <div class="news-list">

        <?php foreach ($model as $item):?>

        <?php $url = Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code])?>

            <article class="col-md-12 article-list">
                <div class="inner">
                    <figure>
                        <a href="<?= $url?>">
                            <img src="/uploads/<?= $item->image?>" alt="<?= $item->name?>">
                        </a>
                    </figure>
                    <div class="details">
                        <div class="detail">
                            <div class="category">
                                <a href="<?= Yii::$app->urlManager->createUrl(['site/news','code'=>$item->cat->code])?>"><?= $item->cat->name?></a>
                            </div>
                            <div class="time"><?= $this->render('_date',['date'=>$item->created])?></div>
                        </div>
                        <h1><a href="<?= $url?>"><?= $item->name?></a></h1>
                        <p>
                            <?= $item->preview?>
                        </p>
                        <footer>
                            <a href="#" class="love"><i class="ion-android-favorite-outline"></i> <div><?= $item->show_counter?></div></a>
                            <a class="btn btn-primary more" href="<?= $url?>">
                                <div>Батафсил</div>
                                <div><i class="ion-ios-arrow-thin-right"></i></div>
                            </a>
                        </footer>
                    </div>
                </div>
            </article>

        <?php endforeach;?>

        <?=
        \yii\widgets\LinkPager::widget([
            'pagination' => $pages,
        ]);
        ?>


    </div>


</div>

<?= $this->render('_sidebar')?>

</div>
</div>
</section>

