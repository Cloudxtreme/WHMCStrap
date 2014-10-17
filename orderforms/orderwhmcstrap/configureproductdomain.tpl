{capture name="title"}{$productinfo.groupname} - {$productinfo.name}{/capture} 
{include file="orderforms/$carttpl/_includes/header.tpl" step=2 title=$smarty.capture.title pageinfo=$LANG.cartproductdomaindesc}

<form method="post" action="{$smarty.server.PHP_SELF}?a=add&pid={$pid}">
{foreach from=$passedvariables key=name item=value}
<input type="hidden" name="{$name}" value="{$value}" />
{/foreach}

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div><br />{/if}

<div class="domainoptions">

	{if $incartdomains}
	<div class="well well-sm">
		<div class="radio">
			<label>
				<input type="radio" name="domainoption" value="incart" id="selincart" />
				<strong>{$LANG.cartproductdomainuseincart}</strong>
			</label>
		</div>

		<div class="domainreginput row" id="domainincart">

			<div class="col-sm-5">
				<select id="incartdomain" name="incartdomain" class="form-control">
					{foreach key=num item=incartdomain from=$incartdomains}
					<option value="{$incartdomain}">{$incartdomain}</option>
					{/foreach}
				</select>
			</div>

			<div class="col-sm-4">
				<button type="submit" class="btn btn-primary">Continue <i class="fa fa-arrow-circle-right"></i></button>
			</div>
			
		</div>
	</div>
	{/if}
	
	{if $registerdomainenabled}
	<div class="well well-sm">
		<div class="radio">
			<label>
				<input type="radio" name="domainoption" value="register" id="selregister" />
				<strong>{$LANG.cartregisterdomainchoice|sprintf2:$companyname}</strong>
			</label>
		</div>

		<div class="domainreginput" id="domainregister">
			
			<div class="row">
			
				<div class="col-md-9">
					<div class="input-group">
						<div class="input-group-addon">www.</div>					
						<input class="form-control" type="text" name="sld[0]" size="40" value="{$sld}" /> 
					
						
						<div class="input-group-addon">.</div>	
						
						<select class="form-control" name="tld[0]">
							{foreach key=num item=listtld from=$registertlds}
							<option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld|substr:1}</option>
							{/foreach}
						</select>
					
					</div>
				</div>
			
				<div class="col-md-3">
					<button type="submit" class="btn btn-primary btn-block">Continue <i class="fa fa-arrow-circle-right"></i></button>
				</div>
				
			</div>
			
		</div>
	</div>
	{/if}
	

	{if $transferdomainenabled}
	<div class="well well-sm">
		<div class="radio">
			<label>
				<input type="radio" name="domainoption" value="transfer" id="seltransfer" />
				<strong>{$LANG.carttransferdomainchoice|sprintf2:$companyname}</strong>
			</label>
		</div>

		<div class="domainreginput" id="domaintransfer">

			<div class="row">
			
			

				<div class="col-md-9">
				
					<div class="input-group">
						<div class="input-group-addon">www.</div>
						<input class="form-control" type="text" name="sld[1]" size="40" value="{$sld}" />
					
						<div class="input-group-addon">.</div>	
			
						<select id="tld[1]" name="tld[1]" class="form-control">
							{foreach key=num item=listtld from=$transfertlds}
							<option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld|substr:1}</option>
							{/foreach}
						</select>
					
					</div>
					
				</div>

				<div class="col-md-3">
					<button type="submit" class="btn btn-primary btn-block">Continue <i class="fa fa-arrow-circle-right"></i></button>
				</div>
			</div>
		</div>
	</div>
	{/if}

	{if $owndomainenabled}
	<div class="well well-sm">
		<div class="radio">
			<label>
				<input type="radio" name="domainoption" value="owndomain" id="selowndomain" />
				<strong>{$LANG.cartexistingdomainchoice|sprintf2:$companyname}</strong>
			</label>
		</div>
		
		<div class="domainreginput" id="domainowndomain">
		
			<div class="row">
			
				<div class="col-md-9">
	
					<div class="input-group">
						<div class="input-group-addon">www.</div>
						
						<input class="form-control" type="text" id="sld[2]" name="sld[2]" size="40" value="{$sld}" />
						
						<div class="input-group-addon">.</div>
						
						<input class="form-control" type="text" id="tld[2]" name="tld[2]" size="7" value="{$tld}" />
					</div>

				</div>
				
				<div class="col-md-3">
					<button type="submit" class="btn btn-primary btn-block">Continue <i class="fa fa-arrow-circle-right"></i></button>
				</div>
				
			</div>
		
		</div>
			
	</div>
	{/if}
	
	
	{if $subdomains}
	<div class="well well-sm">
		<div class="radio">
			<label>
				<input type="radio" name="domainoption" value="subdomain" id="selsubdomain" />
				<strong>{$LANG.cartsubdomainchoice|sprintf2:$companyname}</strong>
			</label>
		</div>

		<div class="domainreginput" id="domainsubdomain">
			<div class="input-group">
				<div class="input-group-addon">http://</div>
				<input type="text" id="sld[3]" name="sld[3]" size="30" value="{$sld}" class="form-control" />
				<div class="input-group-addon">
					<select name="tld[3]" id="tld[3]">{foreach from=$subdomains key=subid item=subdomain}<option value="{$subid}">{$subdomain}</option>{/foreach}</select>
				</div>
			</div>

			<br />

			<input type="submit" value="{$LANG.ordercontinuebutton}" class="btn btn-danger" />
		</div>
	</div>
	{/if}

</div>

{if $availabilityresults}

	<h2>{$LANG.choosedomains}</h2>
	
	<table class="table table-striped table-borered">
		<thead>
			<tr>
				<th>{$LANG.domainname}</th>
				<th>{$LANG.domainstatus}</th>
				<th>{$LANG.domainmoreinfo}</th>
			</tr>
		</thead>
		
		<tbody>
		{foreach key=num item=result from=$availabilityresults}
		<tr><td>{$result.domain}</td><td class="{if $result.status eq $searchvar}textgreen{else}textred{/if}">{if $result.status eq $searchvar}<input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq 0} checked{/if} /> {$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td><td>{if $result.regoptions}<select name="domainsregperiod[{$result.domain}]">{foreach key=period item=regoption from=$result.regoptions}{if $regoption.$domainoption}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.$domainoption}</option>{/if}{/foreach}</select>{/if}</td></tr>
		{/foreach}
		</tbody>
		
	</table>

{/if}

{if $freedomaintlds}* <em>{$LANG.orderfreedomainregistration} {$LANG.orderfreedomainappliesto}: {$freedomaintlds}</em>{/if}

<p align="center"><button class="btn btn-primary" type="submit">Click to Continue&nbsp;&nbsp;<i class="fa fa-arrow-circle-right"></i></button></p>

</form>

{include file="orderforms/$carttpl/_includes/footer.tpl"}


{literal}
<script language="javascript">
jQuery(".domainreginput").hide();
jQuery(".domainoptions input:first").attr('checked','checked');
jQuery(".domainoptions input:first").parent().parent().addClass('optionselected');
jQuery("#domain"+jQuery(".domainoptions input:first").val()).show();
jQuery(document).ready(function(){
    jQuery(".domainoptions input:radio").click(function(){
        jQuery(".domainoptions .option").removeClass('optionselected');
        jQuery(this).parent().parent().addClass('optionselected');
        jQuery(".domainreginput").hide();
        jQuery("#domain"+jQuery(this).val()).show();
    });
});
function checkdomain() {
    jQuery("#greyout").fadeIn();
    jQuery("#domainpopupcontainer").slideDown();
    var domainoption = jQuery(".domainoptions input:checked").val();
    var sld = jQuery("#"+domainoption+"sld").val();
    var tld = '';
    if (domainoption=='incart') var sld = jQuery("#"+domainoption+"sld option:selected").text();
    if (domainoption=='subdomain') var tld = jQuery("#"+domainoption+"tld option:selected").text();
    else var tld = jQuery("#"+domainoption+"tld").val();
    jQuery.post("cart.php", { ajax: 1, a: "domainoptions", sld: sld, tld: tld, checktype: domainoption },
    function(data){
        jQuery("#domainresults").html(data);
    });
}
function cancelcheck() {
    jQuery("#domainpopupcontainer").slideUp('slow',function() {
        jQuery("#greyout").fadeOut();
        jQuery("#domainresults").html('<i class="fa fa-spin fa-spinner fa-2x"></i>');
    });
}
function completedomain() {
    jQuery("#domainresults").append('<i class="fa fa-spin fa-spinner fa-2x"></i>');
    jQuery.post("cart.php", 'ajax=1&a=add&pid={/literal}{$pid}{literal}&domainselect=1&'+jQuery("#domainfrm").serialize(),
    function(data){
        if (data=='') {
            window.location='cart.php?a=view';
        } else if (data=='nodomains') {
            jQuery("#domainpopupcontainer").slideUp('slow',function() {
                jQuery("#greyout").fadeOut();
            });
        } else {
            jQuery("#prodconfigcontainer").html(data);
            jQuery("#domainpopupcontainer").slideUp();
            jQuery("#prodconfigcontainer").slideDown();
        }
    });
}
</script>
{/literal}
