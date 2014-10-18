{include file="orderforms/$carttpl/_includes/header.tpl" step=3 title=$LANG.cartproductconfig pageinfo=$LANG.cartproductdesc}

<form method="post" id="orderfrm" action="{$smarty.server.PHP_SELF}?a=confproduct&i={$i}">
<input type="hidden" name="configure" value="true">
<input type="hidden" name="i" value="{$i}"/>

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div><br />{/if}

{if $productinfo}
<div class="panel panel-primary">
	<input type="hidden" name="previousbillingcycle" value="{$billingcycle}" />

	<div class="panel-heading">
		<h3 class="panel-title">Billing Period</h3>
	</div>

  <div class="panel-body">
		<div class="well well-sm">
			<p style="margin-top:10px;">Pick how frequently you'd like to be billed. Longer billing periods mean bigger discounts, and other perks!</p>
		</div>
		
		{if $pricing.type eq "free"}
			<input type="hidden" name="billingcycle" value="free" />
			{$LANG.orderfree}
		{elseif $pricing.type eq "onetime"}
			<input type="hidden" name="billingcycle" value="onetime" />
			{$pricing.onetime} {$LANG.orderpaymenttermonetime}
		{else}
			<select class="form-control" name="billingcycle" onchange="submit()">
                {if $pricing.monthly}
                    <option
                    value="monthly"{if $billingcycle eq "monthly"} selected="selected"{/if}>{$pricing.monthly|replace:"£0.00GBP":""}</option>{/if}
                {if $pricing.quarterly}
                    <option
                    value="quarterly"{if $billingcycle eq "quarterly"} selected="selected"{/if}>{$pricing.quarterly|replace:"£0.00GBP":""}</option>{/if}
                {if $pricing.semiannually}
                    <option
                    value="semiannually"{if $billingcycle eq "semiannually"} selected="selected"{/if}>{$pricing.semiannually|replace:"£0.00GBP":""}</option>{/if}
                {if $pricing.annually}
                    <option
                    value="annually"{if $billingcycle eq "annually"} selected="selected"{/if}>{$pricing.annually|replace:"£0.00GBP":""}</option>{/if}
                {if $pricing.biennially}
                    <option
                    value="biennially"{if $billingcycle eq "biennially"} selected="selected"{/if}>{$pricing.biennially|replace:"£0.00GBP":""}</option>{/if}
                {if $pricing.triennially}
                    <option
                    value="triennially"{if $billingcycle eq "triennially"} selected="selected"{/if}>{$pricing.triennially|replace:"£0.00GBP":""}</option>{/if}
			</select>
		{/if}
  </div>

</div>
{/if}


{if $productinfo.type eq "server"}
<p><strong>{$LANG.cartconfigserver}</strong></p>
<div class="orderbox">
<table>
<tr><td>{$LANG.serverhostname}:</td><td><input type="text" name="hostname" size="15" value="{$server.hostname}" /> eg. server1(.yourdomain.com)</td></tr>
<tr><td>{$LANG.serverns1prefix}:</td><td><input type="text" name="ns1prefix" size="10" value="{$server.ns1prefix}" /> eg. ns1(.yourdomain.com)</td></tr>
<tr><td>{$LANG.serverns2prefix}:</td><td><input type="text" name="ns2prefix" size="10" value="{$server.ns2prefix}" /> eg. ns2(.yourdomain.com)</td></tr>
<tr><td>{$LANG.serverrootpw}:</td><td><input type="password" name="rootpw" size="20" value="{$server.rootpw}" /></td></tr>
</table>
</div>
{/if}

{if $configurableoptions}
<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$LANG.orderconfigpackage}</h3>
	</div>

	<div class="panel-body">

		<div class="well well-sm">
			<p style="margin-top:10px;">{$LANG.cartconfigoptionsdesc}</p>
		</div>

        {foreach key=num item=configoption from=$configurableoptions}

            {if $configoption.optiontype eq 1}

            <div class="form-group">

                <label>{$configoption.optionname}:</label>
                <select class="form-control" name="configoption[{$configoption.id}]">
                {foreach key=num2 item=options from=$configoption.options}
                    <option value="{$options.id}"{if $configoption.selectedvalue eq $options.id} selected="selected"{/if}>{$options.name}</option>
                {/foreach}
                </select>

            </div>

            {elseif $configoption.optiontype eq 2}

            {foreach key=num2 item=options from=$configoption.options}
                <label>
                    <input type="radio" name="configoption[{$configoption.id}]" value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if}> {$options.name}
                </label>
            {/foreach}

            {elseif $configoption.optiontype eq 3}

            <label>
                <input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}>
                {$configoption.options.0.name}
            </label>

            {elseif $configoption.optiontype eq 4}
            <div class="form-group">
                <label>{$configoption.optionname}:</label>
                <input type="text" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5"> x {$configoption.options.0.name}
            </div>

            {/if}

        {/foreach}

	</div>

</div>
{/if}

{if $addons}
<div class="panel panel-primary">

	<div class="panel-heading">
		<h3 class="panel-title">{$LANG.orderchooseaddons}</h3>
	</div>
	
	<div class="panel-body">
		<div class="well well-sm">
			<p style="margin-top:10px;">{$LANG.orderaddondescription}</p>
		</div>
	
		{foreach key=num item=addon from=$addons}
		
		<label class="checkbox" for="a{$addon.id}">
			{$addon.checkbox} <h4 style="display:inline-block;">{$addon.name}</h4>
			<br>
			<span style="font-size:16px; margin-bottom:10px;" class="label label-success">{$addon.pricing}</span>
			<p style="margin-top:8px;">{$addon.description} </p>
		</label>
		
		<hr>
		{/foreach}
		
	</div>
	
</div>
{/if}

{if $customfields}
<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title">{$LANG.orderadditionalrequiredinfo}</h3>
    </div>

    <div class="panel-body">
        <div class="well well-sm">
            <p class="well-text">{$LANG.cartcustomfieldsdesc}</p>
        </div>

        {foreach key=num item=customfield from=$customfields}
            <label>{$customfield.name}</label>
            {$customfield.input|replace:"<select":"<select class='form-control'"|replace:"<input":"<input class='form-control'"}
            <span class="help-block">{$customfield.description}</span>
        {/foreach}

    </div>

</div>
{/if}

{if $domainoption}
<p><strong>{$LANG.cartproductdomain}</strong></p>

{if $domains}
<input type="hidden" name="domainoption" value="{$domainoption}" />
<p>
{foreach key=num item=domain from=$domains}
<input type="hidden" name="domains[]" value="{$domain.domain}" />
<input type="hidden" name="domainsregperiod[{$domain.domain}]" value="{$domain.regperiod}" />
{$LANG.orderdomain} {$num+1} - {$domain.domain}{if $domain.regperiod} ({$domain.regperiod} {$LANG.orderyears}){/if}<br />
{/foreach}
</p>
{/if}

{if $additionaldomainfields}
<div class="panel panel-primary">

    <div class="panel-heading">
        <h3 class="panel-title">{$LANG.orderchooseaddons}</h3>
    </div>

    <div class="panel-body">
        {foreach key=domainfieldname item=domainfield from=$additionaldomainfields}
        <div class="form-group">
            <label>{$domainfieldname}</label>
            {$domainfield|replace:"<select":"<select class='form-control'"}
        </div>
        {/foreach}
    </div>
</div>
{/if}

{/if}

<p align="center">
{if $firstconfig}
	<input class="btn btn-primary" type="submit" value="{$LANG.addtocart}" />
{else}
	<input class="btn btn-primary" type="submit" value="{$LANG.updatecart}" />
{/if}
</p>

<script>recalctotals();</script>

</form>


{include file="orderforms/$carttpl/_includes/footer.tpl"}