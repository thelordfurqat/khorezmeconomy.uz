
<script>
    function voteajaxsend(id) {
        var radios = document.getElementsByName('ansvote');
        var r = 0;
        for (var i = 0, length = radios.length; i < length; i++)
        {
            if (radios[i].checked)
            {
                // do whatever you want with the checked radio
                r = i+1;
                // only one radio can be logically checked, don't check the rest
                break;
            }
        }

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("resultvote").innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "<?= Yii::$app->urlManager->createUrl(['site/voteresult'])?>?id="+id+"&result="+r, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send();
    }
</script>


<?php $vote = \app\models\Vote::find()->where(['page_id'=>0])->andWhere(['news_id'=>0]) ->orderBy(new \yii\db\Expression('rand()'))->one()?>

<?php $ans = explode(';',$vote->answer) ?>
    <h2><a>Сўровнома</a></h2>
    <h4><a href="#"><?= $vote->question?></a></h4>
    <ul id="resultvote">

        <?php if(Yii::$app->session->get('votestatus')){?>


            <?php

            $t = explode(';',$vote->answer);
            $r = json_decode($vote->result,true);
            foreach ($r as $key=>$item){
                echo "<li class='cat-item'>{$t[$key-1]} - $item</li>";
            }
            ?>

        <?php }else{?>



        <?php $n=0; foreach ($ans as $key=>$item):?>
        <?php  if(strlen($item)==0) continue; $n++;?>
        <li><label>
                <input type="radio" name="ansvote" value="<?= $key?>"> <?= $item ?>
            </label>
        </li>
        <?php endforeach?>

        <li class="cat-item"><button id="votebutton" onclick="voteajaxsend(<?= $vote->id ?>)">Овоз бериш</button></li>

        <?php } ?>
    </ul>


<style>
    #resultvote li {
        list-style: none;
    }
</style>
