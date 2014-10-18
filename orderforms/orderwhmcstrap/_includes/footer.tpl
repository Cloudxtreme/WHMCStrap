
	</div>
	
	<!-- RIGHT SIDE -->
	<div class="col-md-4">

        <div id="producttotal"></div>

        {if $showcart}
		<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
			<input type="hidden" name="validatepromo" value="true" />
			{include file="orderforms/$carttpl/_includes/cart.tpl"}
		</form>
        {/if}

        {if !$loggedin && $currencies}
            {foreach from=$currencies item=curr}
                <a href="cart.php?a=add&domain{$domain}&currency={$curr.id}"><img
                            src="images/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png"
                            border="0" alt=""/> {$curr.code}</a>
            {/foreach}
            <hr/>
        {/if}

        <div class="list-group">

            {foreach key=num item=productgroup from=$productgroups}
                <a href="cart.php?gid={$productgroup.gid}"
                   class="list-group-item{if $productgroup.gid eq $gid} active{/if}">{$productgroup.name}</a>
            {/foreach}

            <hr/>

            {if $loggedin}
                {if $gid neq "addons"}<a href="cart.php?gid=addons"
                                         class="list-group-item">{$LANG.cartproductaddons}</a></li>{/if}
                {if $renewalsenabled && $gid neq "renewals"}<a href="cart.php?gid=renewals"
                                                               class="list-group-item">{$LANG.domainrenewals}</a>{/if}
            {/if}

            {if $registerdomainenabled}<a href="cart.php?a=add&domain=register"
                                          class="list-group-item{if $active eq "register"} active{/if}">{$LANG.registerdomain}</a>{/if}

            {if $transferdomainenabled}<a href="cart.php?a=add&domain=transfer"
                                          class="list-group-item{if $active eq "transfer"} active{/if}">{$LANG.transferdomain}</a>{/if}

            <a href="cart.php?a=view" class="list-group-item{if $active eq "viewcart"} active{/if}">{$LANG.viewcart}</a>

        </div>

    </div>

    <div class="col-md-12 text-center">
        <div class="alert alert-info" role="alert">{$LANG.ordersecure}
            (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</div>
    </div>

</div>

