/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {

	// Define changes to default configuration here. For example:
	config.language = 'ko'; // 언어는 한글
	// config.uiColor = '#AADC6E'; // 배경색
	config.enterMode = '2' ,// 엔터모드는 <br/>
	config.toolbarCanCollapse = true; // 에디터 메뉴 축소/확대 가능 버튼 보이기
	config.resize_dir = 'both'  //  사이즈 둘 다 조정
	config.resize_minWidth = 200;
	//config.resize_maxWidth = 400;
	config.resize_minHeight = 200;
	config.resize_maxHeight = 600;
	
    // 업로드 설정
    config.filebrowserUploadUrl      = '/upload.do?type=Files',
	config.filebrowserImageUploadUrl = '/upload.do?type=Images',
	config.filebrowserUploadMethod='form'; //파일 오류났을때 alert띄워줌
};
