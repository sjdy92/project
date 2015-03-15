jQuery(function(){
	
    $(document).ready(function () {
        $(".searchType").click(function (event) {
            for (var i = 0; i < f.searchType.length; i++) {
                if (f.searchType[i].checked == true) {
                    if (f.searchType[i].value == 'all') {
                        document.getElementById("all").style.backgroundColor = '#c8f2b6';
                        document.getElementById("maemae").style.backgroundColor = '#ebfae8';
                        document.getElementById("junse").style.backgroundColor = '#ebfae8';
                        document.getElementById("walse").style.backgroundColor = '#ebfae8';
                    }
                    if (f.searchType[i].value == 'maemae') {
                        document.getElementById("all").style.backgroundColor = '#ebfae8';
                        document.getElementById("maemae").style.backgroundColor = '#c8f2b6';
                        document.getElementById("junse").style.backgroundColor = '#ebfae8';
                        document.getElementById("walse").style.backgroundColor = '#ebfae8';
                    }
                    if (f.searchType[i].value == 'junse') {
                        document.getElementById("all").style.backgroundColor = '#ebfae8';
                        document.getElementById("maemae").style.backgroundColor = '#ebfae8';
                        document.getElementById("junse").style.backgroundColor = '#c8f2b6';
                        document.getElementById("walse").style.backgroundColor = '#ebfae8';
                    }
                    if (f.searchType[i].value == 'walse') {
                        document.getElementById("all").style.backgroundColor = '#ebfae8';
                        document.getElementById("maemae").style.backgroundColor = '#ebfae8';
                        document.getElementById("junse").style.backgroundColor = '#ebfae8';
                        document.getElementById("walse").style.backgroundColor = '#c8f2b6';
                    }

                    break;
                }

            }
        })
    })
});