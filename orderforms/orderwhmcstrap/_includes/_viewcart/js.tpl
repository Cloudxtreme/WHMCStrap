<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>

{literal}
<script language="javascript">
	function removeItem(type,num) {
		var response = confirm("{/literal}{$LANG.cartremoveitemconfirm}{literal}");
		if (response) {
			window.location = 'cart.php?a=remove&r='+type+'&i='+num;
		}
	}
	function emptyCart(type,num) {
		var response = confirm("{/literal}{$LANG.cartemptyconfirm}{literal}");
		if (response) {
			window.location = 'cart.php?a=empty';
		}
	}
	function showloginform() {
			jQuery("#loginfrm").slideToggle();
			jQuery("#mainfrm").slideToggle();
	}
	function domaincontactchange() {
			if (jQuery("#domaincontact").val()=="addingnew") {
					jQuery("#domaincontactfields").slideDown();
			} else {
					jQuery("#domaincontactfields").slideUp();
			}
	}
	function showCCForm() {
			jQuery("#ccinputform").slideDown();
	}
	function hideCCForm() {
			jQuery("#ccinputform").slideUp();
	}
	function useExistingCC() {
			jQuery(".newccinfo").hide();
	}
	function enterNewCC() {
			jQuery(".newccinfo").show();
	}
</script>
{/literal}