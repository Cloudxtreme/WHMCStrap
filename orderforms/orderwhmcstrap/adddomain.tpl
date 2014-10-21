{include file="orderforms/$carttpl/_includes/header.tpl" step=1 title="Product Selection" pageinfo="Select a product below, use the dropdown to adjust the services offered"}


<form method="post" action="{$smarty.server.PHP_SELF}?a=add">

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':' &nbsp;#&nbsp; '} &nbsp;#&nbsp; </div>{/if}

<div class="domainoptions">

<div><label><input type="radio" name="domain" value="register" id="selregister"{if $domain eq "register"} checked{/if} /> {$LANG.orderdomainoption1part1} {$companyname} {$LANG.orderdomainoption1part2}</label></div>

<div><label><input type="radio" name="domain" value="transfer" id="seltransfer"{if $domain eq "transfer"} checked{/if} /> {$LANG.orderdomainoption3} {$companyname}</label></div>

</div>



<div class="orderbox textcenter">

    www. <input type="text" name="sld" size="40" value="{$sld}" />

    <select name="tld">
        {foreach key=num item=listtld from=$tlds}
        <option value="{$listtld}"{if $listtld eq $tld} selected="selected"{/if}>{$listtld}</option>
        {/foreach}
    </select>
s
</div>

<p align="center"><input type="submit" value="{$LANG.checkavailability}" /></p>

</form>









{if $availabilityresults}

<h2>{$LANG.choosedomains}</h2>

<form method="post" action="{$smarty.server.PHP_SELF}?a=add&domain={$domain}">

<table class="styled textcenter">
<tr><th>{$LANG.domainname}</th><th>{$LANG.domainstatus}</th><th>{$LANG.domainmoreinfo}</th></tr>
{foreach key=num item=result from=$availabilityresults}
<tr><td>{$result.domain}</td><td class="{if $result.status eq $searchvar}textgreen{else}textred{/if}">{if $result.status eq $searchvar}<input type="checkbox" name="domains[]" value="{$result.domain}"{if $result.domain|in_array:$domains} checked{/if} /> {$LANG.domainavailable}{else}{$LANG.domainunavailable}{/if}</td><td>{if $result.regoptions}<select name="domainsregperiod[{$result.domain}]">{foreach key=period item=regoption from=$result.regoptions}{if $regoption.$domain}<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.$domain}</option>{/if}{/foreach}</select>{/if}</td></tr>
{/foreach}
</table>

<p align="center"><input type="submit" value="{$LANG.addtocart}" /></p>

</form>

{/if}

{include file="orderforms/$carttpl/_includes/footer.tpl"}