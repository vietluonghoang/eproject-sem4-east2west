<%
    String $category = "";
    String $page = "";
%>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--[if IE]>
<link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
<![endif]-->

<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!--  checkbox styling script -->
<script src="js/jquery/ui.core.js" type="text/javascript"></script>
<script src="js/jquery/ui.checkbox.js" type="text/javascript"></script>
<script src="js/jquery/jquery.bind.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function() {
        $('input').checkBox();
        $('#toggle-all').click(function() {
            $('#toggle-all').toggleClass('toggle-checked');
            $('#mainform input[type=checkbox]').checkBox('toggle');
            return false;
        });
    });
</script>

<![if !IE 7]>

<!--  styled select box script version 1 -->
<script src="js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.styledselect').selectbox({inputClass: "selectbox_styled"});
    });
</script>


<![end if]>

<!--  styled select box script version 2 -->
<script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.styledselect_form_1').selectbox({inputClass: "styledselect_form_1"});
        $('.styledselect_form_2').selectbox({inputClass: "styledselect_form_2"});
    });
</script>

<!--  styled select box script version 3 -->
<script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.styledselect_pages').selectbox({inputClass: "styledselect_pages"});
    });
</script>

<!--  styled file upload script -->
<script src="js/jquery/jquery.filestyle.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    $(function() {
        $("input.file_1").filestyle({
            image: "images/forms/choose-file.gif",
            imageheight: 21,
            imagewidth: 78,
            width: 310
        });
    });
</script>

<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- Tooltips -->
<script src="js/jquery/jquery.tooltip.js" type="text/javascript"></script>
<script src="js/jquery/jquery.dimensions.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function() {
        $('a.info-tooltip ').tooltip({
            track: true,
            delay: 0,
            fixPNG: true,
            showURL: false,
            showBody: " - ",
            top: -35,
            left: 5
        });
    });
</script>


<!--  date picker script -->
<link rel="stylesheet" href="css/datePicker.css" type="text/css" />
<script src="js/jquery/date.js" type="text/javascript"></script>
<script src="js/jquery/jquery.datePicker.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    $(function()
    {

// initialise the "Select date" link
        $('#date-pick')
                .datePicker(
                // associate the link with a date picker
                        {
                            createButton: false,
                            startDate: '01/01/2005',
                            endDate: '31/12/2020'
                        }
                ).bind(
                        // when the link is clicked display the date picker
                        'click',
                        function()
                        {
                            updateSelects($(this).dpGetSelected()[0]);
                            $(this).dpDisplay();
                            return false;
                        }
                ).bind(
                        // when a date is selected update the SELECTs
                        'dateSelected',
                        function(e, selectedDate, $td, state)
                        {
                            updateSelects(selectedDate);
                        }
                ).bind(
                        'dpClosed',
                        function(e, selected)
                        {
                            updateSelects(selected[0]);
                        }
                );

                var updateSelects = function(selectedDate)
                {
                    var selectedDate = new Date(selectedDate);
                    $('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
                    $('#m option[value=' + (selectedDate.getMonth() + 1) + ']').attr('selected', 'selected');
                    $('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
                };
// listen for when the selects are changed and update the picker
                $('#d, #m, #y')
                        .bind(
                        'change',
                        function()
                        {
                            var d = new Date(
                                    $('#y').val(),
                                    $('#m').val() - 1,
                                    $('#d').val()
                                    );
                            $('#date-pick').dpSetSelected(d.asString());
                        }
                );

// default the position of the selects to today
                var today = new Date();
                updateSelects(today.getTime());

// and update the datePicker to reflect it...
                $('#d').trigger('change');
            });
</script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(document).pngFix( );
    });
</script>
<script>
    $(function() {
        $("#datepicker1").datepicker({dateFormat: 'yy-mm-dd'});
        $("#datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
        $("#datepicker3").datepicker({dateFormat: 'yy/mm/dd'});
        $("#datepicker4").datepicker({dateFormat: 'yy/mm/dd'});
    });

</script>
<style>
    #btLogin{
        font-size: 0;
        width: 140px;
        height: 36px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/login-button.png) 0 0 no-repeat;
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
    #btDelete{
        font-size: 0;
        width: 100px;
        height: 38px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/delete-button.png) 0 0 no-repeat;
    }
    #btInsert{
        font-size: 0;
        width: 100px;
        height: 26px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/insert-button.png) 0 0 no-repeat;
    }
    #btUpdate{
        font-size: 0;
        width: 100px;
        height: 26px;
        border: none;
        margin: 0;
        padding: 0;
        background: url(images/button/update-button.png) 0 0 no-repeat;
    }
</style>