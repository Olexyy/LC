/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'uk';
	config.height = 100;
	config.toolbarCanCollapse = true;


	//config.uiColor = '#AADC6E';
};
CKEDITOR.config.height = 150;
CKEDITOR.config.width = 'auto';
CKEDITOR.config.toolbarStartupExpanded = false;
CKEDITOR.config.removeButtons = 'Image,Flash,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,About,' +
	'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,selection,spellchecker,Find,Replace,SelectAll,Scayt';
CKEDITOR.replace( 'editor' );
