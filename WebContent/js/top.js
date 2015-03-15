$(function(){
	$('.rollover').each(function(){
		var img = $(this);

		var src_off = img.attr('src');
		var src_on = src_off.replace(/^(.+)_off(\.[^\.]+)$/, '$1_on$2');

		$('<IMG />').attr('src', src_on);

		img.bind('mouseenter focus', function(){
			img.attr('src', src_on);
		});

		img.bind('mouseleave blur', function(){
			img.attr('src', src_off);
		});
	});

	$('.rollover').click(function(){
		location.href = $(this).attr('alt');
	});
	

	var searchForm = $('#searchPicture');
	var searchFunc = searchForm.find('input:hidden[name=func]');
	var searchWord = searchForm.find('input:hidden[name=topword]');

	$('#searchListBtn').click(function (){
		
		searchAction2();

	});
	$('#searchListWord').keypress(function (event){
		if(event.keyCode == 13)
		{
			searchAction2();
			return false;
		}
	});

	function searchAction2(){

		searchFunc.val("common_003");
		searchWord.val(trim($('#searchListWord').val()));
		searchForm.submit();
	}
});