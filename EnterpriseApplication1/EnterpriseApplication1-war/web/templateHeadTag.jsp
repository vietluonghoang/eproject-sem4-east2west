<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>East2West</title>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta name="description" content="Description" />
<meta name="keywords" content="Keywords" />
<meta name="author" content="Enlighten Designs" />
<link rel="stylesheet" href="jquery/jquery-ui.css"/>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/css-style.css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="jquery/jquery-ui.js"></script>
<script src="jquery/jquery.tablePagination.0.js"></script>
<style>
    #btLogin{
        background-color: #4545F1;
        color: #fff;
        width: 60px;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }
    #btLogOut{
        background-color: #ff6633;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }
    #btViewOrder{
        background-color: #009999;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }
    #btBook{
        background-color: #00cc00;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }

    #btViewDetail{
        background-color: #4545F1;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }

    #btSearch{
        background-color: #515170;
        color: #fff;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        margin-top: 10px;
        margin-bottom: 50px;
        cursor: pointer;
    }
    #btCancel2{
        background-color: #ff3300;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }
    #btConfirm{
        background-color: #4545F1;
        color: #fff;
        height: 30px;
        font-weight: bold;
        box-shadow: 0px 0px 1px 1px #000;
        border: 0px;
        cursor: pointer;
    }
</style>
<script>

    $(function() {
        $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
        $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
        $("#datepicker3").datepicker({dateFormat: 'yy/mm/dd'});
        $("#datepicker4").datepicker({dateFormat: 'yy/mm/dd'});
    });

    $(document).ready(
            function() {
                $(document).find("#searchPanelButton").click(function() {

                    if ($(document).find("#searchPanel").css("visibility") === "visible") {
                        $(document).find("#searchPanel").css("visibility", "hidden");
                    }else{
                        $(document).find("#searchPanel").css("visibility", "visible");
                    }
                });
                $('tbody tr:odd', $('#menuTable')).show(); //hiding rows for test
                var options = {
                    rowsPerPage: 18,
                    optionsForRows: [6, 12, 18],
                    firstArrow: (new Image()).src = "./images/paging/firstBlue.gif",
                    prevArrow: (new Image()).src = "./images/paging/prevBlue.gif",
                    lastArrow: (new Image()).src = "./images/paging/lastBlue.gif",
                    nextArrow: (new Image()).src = "./images/paging/nextBlue.gif",
                    topNav: false
                };

                $('#isPaging #menuTable').tablePagination(options);
            });
</script>
