jQuery(document).bind('turbolinks:load', function($){
    jQuery('#ck_editor').ready(function(){
        CKEDITOR.config.language = 'uk';
        CKEDITOR.config.height = 300;
        CKEDITOR.config.width = 'auto';
        CKEDITOR.config.toolbarCanCollapse = true;
        CKEDITOR.config.toolbarStartupExpanded = false;
        CKEDITOR.config.removeButtons = 'Image,Flash,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,About,Link,Unlink,Anchor,' +
        'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,selection,spellchecker,Find,Replace,SelectAll,Scayt';
        if (jQuery('#ck_editor')) {
            CKEDITOR.replace('ck_editor');
        }
    });
});