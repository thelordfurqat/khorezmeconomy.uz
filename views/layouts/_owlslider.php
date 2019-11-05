<div class="owl-carousel owl-theme slide" id="featured">
    <?php foreach (\app\models\News::find()->orderBy(['created'=>SORT_DESC])->limit(3)->all() as $item):?>
    <div class="item">
        <article class="featured">
            <div class="overlay"></div>
            <figure>
                <img src="/uploads/<?= $item->image?>" alt="Sample Article">
            </figure>
            <div class="details">
                <div class="category"><a href="<?= Yii::$app->urlManager->createUrl(['site/news','code'=>$item->cat->code])?>"><?= $item->cat->name?></a></div>
                <h1><a href="<?= Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code])?>"><?= $item->name?></a></h1>
                <div class="time"><?= $this->render('/site/_date',['date'=>$item->created])?></div>
            </div>
        </article>
    </div>
    <?php endforeach?>
</div>
