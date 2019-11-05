<?php

namespace app\controllers;

use app\models\Category;
use app\models\Language;
use app\models\News;
use app\models\Page;
use app\models\Vote;
use Yii;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use yii\web\NotFoundHttpException;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function getLang(){
        $l = Yii::$app->language;
        if($id = Language::findOne(['code'=>$l])){
            return $id;
        }else{
            throw new NotFoundHttpException();
        }
    }
    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $news = News::find()->orderBy(['created'=>SORT_DESC])->where(['lang_id'=>1])->limit(6)->offset(3)->all();

        return $this->render('index',[
            'news'=>$news,
            'sitetitle'=>"Хива шаҳар олимпия ва миллий спорт турлари бўйича давлат ихтисослаштирилган мактаб-интернати расмий веб сайти | xivaolimpia.uz"
        ]);
    }





    public function actionSearch($s = null){

        $name = "Қидирув натижалари";
        $code = '11';
        if($s == null){
            $code = "desc";
        }
        $model = null;
        switch ($code){
            case 'desc': $model = News::find()->where(['status'=>1])->orderBy(['created'=>SORT_DESC]); break;
            default :
                {
                    $code = 'search';
                    $model = News::find()
                        ->andFilterWhere([
                            'or',
                            ['like', 'name', $s],
                            ['like', 'preview', $s],
                            ['like', 'detail', $s],
                        ]);
                    ;
                }
        }

        $countQuery = clone $model;
        $pages = new Pagination(['totalCount' => $countQuery->count(),'pageSize' => 10]);
        $models = $model->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        return $this->render('news', [
            'model' => $models,
            'pages' => $pages,
            'code'=>$s,
            'name'=>$name,
            'sitetitle'=>'Қидирув натижалари | xivaolimpia.uz'
        ]);
    }


    public function actionView($code = null){
        if($code == null){
            throw new NotFoundHttpException();
        }
        if($model = News::findOne(['code'=>$code])){
        	$model->show_counter = intval($model->show_counter)+1;
            $model->save();
            return $this->render('view',[
                'model'=>$model,
                'code'=>$code,
                'sitetitle'=>$model->name. ' | xivaolimpia.uz'
            ]);
        }else{
            throw new NotFoundHttpException();
        }
    }

    public function actionSitemap(){


        return $this->render('sitemap',[
            'sitetitle'=>'Сайт харитаси  | xivaolimpia.uz'
        ]);
    }


    public function actionNews($code = null){
        if($code == null){
            $query = News::find()->where(['status' => 1])->orderBy(['show_counter'=>SORT_DESC]);
            $sitetitle = "Энг кўр ўқилганлар";
        }else{
            if($model = Category::findOne(['code'=>$code])){
                $query = News::find()->where(['status' => 1])->andWhere(['cat_id'=>$model->id])->orderBy(['created'=>SORT_DESC]);
                $sitetitle = $model->name;
            }else{
                throw new NotFoundHttpException();
            }
        }

        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        return $this->render('news', [
            'model' => $models,
            'pages' => $pages,
            'code'=>$code,
            'sitetitle'=> $sitetitle.' | xivaolimpia.uz',
            'catname'=>$sitetitle,
        ]);


    }
    public function actionPage($code = null){
        if($code == null){
            throw new NotFoundHttpException();
        }

        if($id = Category::findOne(['code'=>$code])){
            $id = $id->page_id;
            if(!Page::findOne($id)){
                throw new NotFoundHttpException();
            }
            $model = Page::findOne($id);
            $model->show_counter = intval($model->show_counter)+1;
            $model->save();
            return $this->render('page',[
                'model'=>$model,
                'code'=>$code,
                'sitetitle'=>$model->name .' | xivaolimpia.uz'
            ]);
        }else{
            throw new NotFoundHttpException();
        }



    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
            'sitetitle'=>"Боғланиш | xivaolimpia.uz"
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionVoteresult($id, $result){
        $res = $result;
        if($id == 0 or $res == 0){
            echo "xatolik11";
        }else{
            Yii::$app->session->set('votestatus',true);
            if($model = Vote::findOne($id)){
                if(strlen($model->result) == 0){

                    $r = explode(';',$model->answer);
                    $n = 0;
                    $t = [];
                    foreach ($r as $item) {
                        if(strlen($item)==0){
                            continue;
                        }
                        $n++;
                        $t[$n] = 0;
                    }
                    $model->result = json_encode($t);

                }
                $r = json_decode($model->result,true);

                $r[intval($res)] = intval($r[intval($res)])+1;
                $model->result = json_encode($r);
                $model->save();
                $t = explode(';',$model->answer);
                $m = "<li class='clearfix'>$model->question</li>";
                foreach ($r as $key=>$item){
                    $m = $m . "<li class='clearfix'>{$t[$key-1]} - $item</li>";
                }
                 echo $m;
            }else{
                echo "xatolik22";
            }
        }
    }
}
