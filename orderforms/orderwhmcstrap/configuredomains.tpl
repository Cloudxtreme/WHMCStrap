{include file="orderforms/$carttpl/_includes/header.tpl" step=3 title="Now pick your domain name settings" pageinfo=$LANG.cartdomainsconfigdesc}

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
    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">{$LANG.domainnameservers}</h3>
        </div>

        <div class="panel-body">

            <div class="well">
                {$LANG.cartnameserversdesc}
            </div>

            <div class="form-group">
                <label>{$LANG.domainnameserver1}</label>
                <input class="form-control" type="text" name="domainns1" size="40" value="{$domainns1}"/>
            </div>

            <div class="form-group">
                <label>{$LANG.domainnameserver2}</label>
                <input class="form-control" type="text" name="domainns2" size="40" value="{$domainns2}"/>
            </div>

            <div class="form-group">
                <label>{$LANG.domainnameserver3}</label>
                <input class="form-control" type="text" name="domainns3" size="40" value="{$domainns3}"/>
            </div>

            <div class="form-group">
                <label>{$LANG.domainnameserver4}</label>
                <input class="form-control" type="text" name="domainns4" size="40" value="{$domainns4}"/>
            </div>

            <div class="form-group">
                <label>{$LANG.domainnameserver5}</label>
                <input class="form-control" type="text" name="domainns5" size="40" value="{$domainns5}"/>
            </div>


        </div>

    </div>
{/if}

    <p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.updatecart}"/></p>>

</form>

{include file="orderforms/$carttpl/_includes/footer.tpl"}

