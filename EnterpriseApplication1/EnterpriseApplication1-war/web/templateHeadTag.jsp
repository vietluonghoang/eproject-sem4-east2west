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
    }
    #btLogOut{
        font-size: 0;
        width: 88px;
        height: 40px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/log_out_button.png) 0 0 no-repeat;
    }
    #btViewOrder{
        font-size: 0;
        width: 72px;
        height: 27px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/view-order-button.png) 0 0 no-repeat;
    }
    #btBook{
        font-size: 0;
        width: 80px;
        height: 26px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/book-button.png) 0 0 no-repeat;
    }

    #btViewDetail{
        font-size: 0;
        width: 100px;
        height: 27px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/view-detail-button.png) 0 0 no-repeat;
    }

    #btSearch{
        font-size: 0;
        width: 77px;
        height: 28px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/search-button.png) 0 0 no-repeat;
    }
    #btCancel2{
        font-size: 0;
        width: 100px;
        height: 26px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/Cancel-button-2.png) 0 0 no-repeat;
    }
    #btConfirm{
        font-size: 0;
        width: 100px;
        height: 44px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/confirm-button.png) 0 0 no-repeat;
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
