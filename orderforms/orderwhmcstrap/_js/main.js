function recalctotals() {
    jQuery.post("cart.php", 'ajax=1&a=confproduct&calctotal=true&' + jQuery("#orderfrm").serialize(),
        function (data) {
            jQuery("#producttotal").html(data);
        });
}
