{include file="orderforms/$carttpl/_includes/header.tpl" title="Now pick your domain name settings" pageinfo=$LANG.cartdomainsconfigdesc}

{include file="orderforms/$carttpl/verticalsteps.tpl" step=3}

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div><br />{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?a=confdomains">
<input type="hidden" name="update" value="true" />

{foreach key=num item=domain from=$domains}
<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$domain.domain} - {$domain.regperiod} {$LANG.orderyears} {if $domain.hosting}<span style="color:#333;">[{$LANG.cartdomainshashosting}]</span>{else}<a href="cart.php" style="color:#cc0000;">[{$LANG.cartdomainsnohosting}]</a><br />{/if}</h3>
	</div>
	
	<div class="panel-body">
		
		{if $domain.configtoshow}

		<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>

		{if $domain.eppenabled}
			<label>{$LANG.domaineppcode}</label>
			<input type="text" name="epp[{$num}]" size="20" value="{$domain.eppvalue}" /> 
			{$LANG.domaineppcodedesc}
		{/if}
		
		{if $domain.dnsmanagement}
			<label>
				<input type="checkbox" name="dnsmanagement[{$num}]"{if $domain.dnsmanagementselected} checked{/if} /> {$LANG.domaindnsmanagement} ({$domain.dnsmanagementprice})</label><br />
		{/if}
		
		{if $domain.emailforwarding}
			<label>
				<input type="checkbox" name="emailforwarding[{$num}]"{if $domain.emailforwardingselected} checked{/if} /> {$LANG.domainemailforwarding} ({$domain.emailforwardingprice})</label><br />
		{/if}
			
		{if $domain.idprotection}
			<label>
				<input type="checkbox" name="idprotection[{$num}]"{if $domain.idprotectionselected} checked{/if} /> {$LANG.domainidprotection} ({$domain.idprotectionprice})</label><br />
		{/if}
		
		
		{foreach key=domainfieldname item=domainfield from=$domain.fields}
		<div class="form-group">
			<label>{$domainfieldname}</label>
			{$domainfield|replace:"*":""|replace:'type="text"':'type="text" class="form-control required"'}
		</div>
		{/foreach}
		
		<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>

		{/if}

	</div>
	
</div>

{/foreach}

{if $atleastonenohosting}
<h2>{$LANG.domainnameservers}</h2>
<p>{$LANG.cartnameserversdesc}</p>
<div class="orderbox">
<table class="noborders">
<tr><td>{$LANG.domainnameserver1}:</td><td><input type="text" name="domainns1" size="40" value="{$domainns1}" /></td></tr>
<tr><td>{$LANG.domainnameserver2}:</td><td><input type="text" name="domainns2" size="40" value="{$domainns2}" /></td></tr>
<tr><td>{$LANG.domainnameserver3}:</td><td><input type="text" name="domainns3" size="40" value="{$domainns3}" /></td></tr>
<tr><td>{$LANG.domainnameserver4}:</td><td><input type="text" name="domainns4" size="40" value="{$domainns4}" /></td></tr>
<tr><td>{$LANG.domainnameserver5}:</td><td><input type="text" name="domainns5" size="40" value="{$domainns5}" /></td></tr>
</table>
</div>
{/if}

<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.updatecart}" /></p>

</form>

<!--
{literal}
<script>
$(document).ready(function(e) {
	$('.form-group select').addClass('form-control');
	$('.form-group input[type="text"]').addClass('form-control');
});
</script>
{/literal}
-->

{include file="orderforms/$carttpl/_includes/footer.tpl"}