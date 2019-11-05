<?php $this->title = $sitetitle?>


<section class="home">
    <div class="container">
        <div class="row">


            <div class="col-md-8 col-sm-12 col-xs-12 ">




           <?= $this->render('/layouts/_owlslider')?>

<div class="line top">
    <div>Сўнги янгиликлар</div>
</div>
<div class="row">
    <?php foreach($news as $item):?>
    <?php $url = Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code]);?>
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
</div>


</div>

            <?= $this->render('_sidebar')?>

</div>
</div>
</section>
