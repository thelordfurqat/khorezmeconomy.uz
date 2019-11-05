<?php
/**
 * Created by PhpStorm.
 * User: Dilmurod
 * Date: 12.01.2019
 * Time: 21:53
 */

namespace app\components;

use app\models\Category;
use app\models\News;
use yii\base\Widget;
use Yii;
class BreadcrumbsGenerator extends Widget{

    public static $newsurl="site/news",$newsview="site/view", $viewcode='code',$pageview = 'site/page';
    public static function generate($params){

        $code = $params['code'];
        $type = $params['type'];
        $homeurl = Yii::$app->urlManager->createUrl(['site/index']);

        $result = '<div class="bx_breadcrumbs">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-fix" style="display: inline-block;">
                            <a href="'.$homeurl.'" title="Bosh sahifa">Бош сахифа</a>
                        </li>
                    ';


        if($type == 'view'){
            $result = static::generateView($result,$code);
        }elseif($type == 'news'){
            $id = Category::findOne(['code'=>$code])->id;
            $result = static::parentGenerate($id, $result);
        }elseif($type == 'page'){
            $id = Category::findOne(['code'=>$code])->id;
            $result = static::parentGenerate($id, $result);
        }elseif($type=='search'){
            $result = $result . '';
        }
        elseif($type=='sitemap'){
            $result = $result . '<li class="breadcrumb-fix"><span>Сайт харитаси</span></li>';
        }



        $result = $result.'</ul>
	</div>	';


        return $result;

    }


    public static function generateView($res, $code){
        $model = News::findOne(['code'=>$code]);
        $res = static::parentGenerate($model->cat_id,$res);
        $res .= '<li class="breadcrumb-fix" style="display: inline-block;">
                            <span>'.$model->name.'</span>
                        </li>';
        return $res;
    }

    public static function generatePage($res, $code){
        $model = Category::findOne(['code'=>$code]);
        $res = static::parentGenerate($model->id,$res);
        $res .= '<li class="breadcrumb-fix" style="display: inline-block;">
                            <span>'.$model->name.'</span>
                        </li>';
        return $res;
    }

    public static function parentGenerate($id,$res){
        $parents = [];
        for($i = 0; $i<5; $i++){
            if($model = Category::findOne($id)){
                $parents[$model->code] = $model->name;
                $id = $model->parent_id;
                if($model->parent_id == 1){
                    break;
                }
            }else{
                break;
            }
        }
        $parents = array_reverse($parents);
        foreach($parents as $key => $item){
            $url = Yii::$app->urlManager->createUrl([static::$newsurl,'code'=>$key]);
            $res = $res . '<li class="breadcrumb-fix" style="display: inline-block;">
                            <a href="'.$url.'" title="'.$item.'">'.$item.'</a>
                        </li>';
        }

        return $res;

    }
}