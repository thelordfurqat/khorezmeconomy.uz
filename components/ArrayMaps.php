<?php
/**
 * Created by PhpStorm.
 * User: Shomurod
 * Date: 18.12.2018
 * Time: 21:55
 */
namespace app\components;
use \yii\helpers\ArrayHelper;
use \yii\base\Component;

class ArrayMaps extends Component{

    public static function pages($language=null,$sts = null,$st=null){
        if($st != null){
            $data =  ArrayHelper::map(\app\models\Page::find()->where(['lang_id'=>$language])->all(),'id','name');
            $data[0]='Sahifaga ulamaslik';
            ksort($data);
            return $data;
        }
        if($sts == null){
            if($language){
                return ArrayHelper::map(\app\models\Page::find()->where(['lang_id'=>$language])->all(),'id','name');
            }else{
                return ArrayHelper::map(\app\models\Page::find()->all(),'id','name');
            }
        }else{
            if($language){
                $data =  ArrayHelper::map(\app\models\Page::find()->where(['lang_id'=>$language])->all(),'id','name');
                $data[-1]='Menu';
                $data[0]='Bo\'lim';
                ksort($data);
                return $data;
            }else{
                $data = ArrayHelper::map(\app\models\Page::find()->all(),'id','name');
                $data[-1]='Menu';
                $data[0]='Bo\'lim';
                ksort($data);
                return $data;
            }
        }

    }

    public static function menu($language=null){
        if($language){
            return ArrayHelper::map(\app\models\Menu::find()->where(['lang_id'=>$language])->all(),'id','name');
        }else{
            return ArrayHelper::map(\app\models\Menu::find()->all(),'id','name');
        }
    }

    public static function language(){
        return ArrayHelper::map(\app\models\Language::find()->all(),'id','language');
    }
    public static function users(){
        return ArrayHelper::map(\app\models\User::find()->all(),'id','name');
    }
    public static function Authors(){
        return ArrayHelper::map(\app\models\User::find()->where(['<>','role_id','3'])->all(),'id','name');
    }
    public static function role(){
        return ArrayHelper::map(\app\models\Role::find()->all(),'id','role');
    }
    public static function category($params = null,$status = null,$sts = null){
        if($sts == null){
            if($status == null) {
                if ($params) {
                    return ArrayHelper::map(\app\models\Category::find()->where(['lang_id' => $params])->orWhere(['id' => 1])->andWhere(['page_id'=>0])->andWhere(['parent_id'=>1])->orderBy(['id' => SORT_ASC])->all(), 'id', 'name');
                } else {
                    return ArrayHelper::map(\app\models\Category::find()->all(), 'id', 'name');
                }
            }else{
                if ($params) {
                    return ArrayHelper::map(\app\models\Category::find()->where(['lang_id' => $params])->andWhere(['page_id'=>0])->andWhere(['<>','id',1])->orderBy(['id' => SORT_ASC])->all(), 'id', 'name');
                } else {
                    return ArrayHelper::map(\app\models\Category::find()->where(['<>','id',1])->all(), 'id', 'name');
                }
            }
        }else{
            if($status == null) {
                if ($params) {
                    $data = ArrayHelper::map(\app\models\Category::find()->where(['lang_id' => $params])->andWhere(['page_id'=>[0,-1]])->orWhere(['id' => 1])->andWhere(['parent_id'=>1])->orderBy(['id' => SORT_ASC])->all(), 'id', 'name');

                    return $data;
                } else {
                    $data =  ArrayHelper::map(\app\models\Category::find()->all(), 'id', 'name');
                    return $data;
                }
            }else{
                if ($params) {
                    $data =  ArrayHelper::map(\app\models\Category::find()->where(['lang_id' => $params])->andWhere(['page_id'=>[0,1]])->andWhere(['<>','id',1])->orderBy(['id' => SORT_ASC])->all(), 'id', 'name');
                    $data[0]='Faqat menu';
                    ksort($data);
                    return $data;
                } else {
                    $data = ArrayHelper::map(\app\models\Category::find()->where(['<>','id',1])->all(), 'id', 'name');
                    $data[0]='Faqat menu';
                    ksort($data);
                    return $data;
                }
            }
        }

    }


    public function News($l=null, $sts=null){
        if($l==null){
            $l = 1;
        }
        if($sts == null){
            $data = ArrayHelper::map(\app\models\News::find()->where(['status'=>1])->andWhere(['lang_id'=>$l])->all(), 'id', 'name');
            return $data;
        }else{
            $data = ArrayHelper::map(\app\models\News::find()->where(['status'=>1])->andWhere(['lang_id'=>$l])->all(), 'id', 'name');
            $data[0]='Yangilikga ulamaslik';
            ksort($data);
            return $data;
        }
    }

}