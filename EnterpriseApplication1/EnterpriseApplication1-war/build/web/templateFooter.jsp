
<div id="footer">

    <div id="altnav">
        <a href="Ehome.jsp">Home</a>
        <a href="Eabout.jsp">About</a>
        <a href="Etour.jsp">Tour</a>
        <a href="carSearch.jsp">Car</a>
        <a href="EinformationDesk.jsp">Information Desk</a>
        <a href="Econtact.jsp">Contact</a>
        <a href="adminLogin.jsp">Admin</a>
    </div>
    Copyright © East2West<br/>
    Powered by <a href="http://www.facebook.com/ngocteng146">Ngocpt's Facebook</a>
</div>
<style type='text/css'>
    #bttop{border:1px solid #ff0000;background:#000;text-align:center;padding:5px;position:fixed;bottom:35px;right:10px;cursor:pointer;display:none;color:#fff;font-size:11px;font-weight:900;}
    #bttop:hover{border:1px solid #ffa789;background:#ff6734;}
</style>
<div id='bttop'>Back on top</div>
<script type='text/javascript'>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() !== 0) {
                $('#bttop').fadeIn();
            } else {
                $('#bttop').fadeOut();
            }
        });
        $('#bttop').click(function() {
            $('body,html').animate({scrollTop: 0}, 800);
        });
    });
</script>