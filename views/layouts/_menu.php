<!-- Start nav -->
<nav class="menu" style="background-color: rgba(10,178,255,0.48)">
    <div class="container" >

        <div class="mobile-toggle">
            <a href="#" data-toggle="menu" data-target="#menu-list"><i class="ion-navicon-round"></i></a>
        </div>
        <div class="mobile-toggle">
            <a href="#" data-toggle="sidebar" data-target="#sidebar"><i class="ion-ios-arrow-left"></i></a>
        </div>
        <div id="menu-list" >


            <?= \app\components\MenuBuilder::generate('menu')?>


        </div>
    </div>
</nav>
<!-- End nav -->