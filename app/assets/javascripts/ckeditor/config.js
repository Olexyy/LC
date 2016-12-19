/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'uk';
	// config.uiColor = '#AADC6E';
    config.language = 'uk';
    config.height = 300;
    config.width = 'auto';
    config.toolbarCanCollapse = true;
    config.toolbarStartupExpanded = false;
    config.removeButtons = 'Image,Flash,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,About,Link,Unlink,Anchor,' +
    'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,selection,spellchecker,Find,Replace,SelectAll,Scayt';
};
