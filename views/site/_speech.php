<?php
/**
 * Created by PhpStorm.
 * User: Dilmurod
 * Date: 11.02.2019
 * Time: 17:47
 */

?>


<span id="sexy_tooltip_title" style="left: 631.5px; top: 1097px; opacity: 0.95; display: none;"><span class="the-tooltip top left dark-midnight-blue"><span class="tooltip_inner">Матнни тинглаш!</span></span></span>
<div id="sound_container" class="sound_div sound_div_basic size_1 speaker_32" style="transform: rotate(0deg); display: none; left: 647px; top: 1097px; opacity: 1;">
    <div id="sound_text"></div>
</div>
<div id="sound_audio"></div>



<?php

$this->registerJs("

    var site_lng = 'uz';
    var players = new Array(),
        blink_timer = new Array(),
        rotate_timer = new Array(),
        lang_identifier = 'uz',
        selected_txt = '',
        sound_container_clicked = false,
        sound_container_visible = true,
        blinking_enable = true,
        basic_plg_enable = true,
        pro_container_clicked = true,
        streamerphp_folder = '/js/gspeech/',
        translation_tool = 'g',
        translation_audio_type = 'audio/mpeg',
        speech_text_length = 50,
        blink_start_enable_pro = true,
        createtriggerspeechcount = 0,
        speechtimeoutfinal = 0,
        speechtxt = '',
        userRegistered = \"0\",
        gspeech_bcp = [\"rgba(0,0,0,0)\",\"rgba(255,255,255,0)\",\"rgba(255,255,255,0)\",\"rgba(255,255,255,0)\",\"rgba(255,255,255,0)\"],
        gspeech_cp = [\"#F0F0F0\",\"#3284c7\",\"#fc0000\",\"#0d7300\",\"#ea7d00\"],
        gspeech_bca = [\"rgba(0, 0, 0, 0.24)\",\"#3284c7\",\"#ff3333\",\"#0f8901\",\"#ea7d00\"],
        gspeech_ca = [\"#ffffff\",\"#ffffff\",\"#ffffff\",\"#ffffff\",\"#ffffff\"],
        gspeech_spop = [\"90\",\"80\",\"90\",\"90\",\"90\"],
        gspeech_spoa = [\"100\",\"100\",\"100\",\"100\",\"100\"],
        gspeech_animation_time = [\"400\",\"400\",\"400\",\"400\",\"400\"];
");
?>
